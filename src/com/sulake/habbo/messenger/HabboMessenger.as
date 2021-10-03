package com.sulake.habbo.messenger
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.InstantMessageErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewConsoleMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteEvent;
   import com.sulake.habbo.communication.messages.parser.friendlist.InstantMessageErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IFriend;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Conversations;
   import com.sulake.habbo.messenger.domain.ConversationsDeps;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboMessenger extends Component implements IHabboMessenger, IAvatarImageListener
   {
      
      public static const const_154:String = "face";
       
      
      private var _friendList:IHabboFriendList;
      
      private var var_889:IAvatarRenderManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_626:Conversations;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_239:MessengerView;
      
      private var var_148:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      public function HabboMessenger(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      private function onRoomInvite(param1:IMessageEvent) : void
      {
         var _loc2_:RoomInviteMessageParser = (param1 as RoomInviteEvent).getParser();
         var _loc3_:Message = new Message(Message.const_1045,_loc2_.senderId,getText("messenger.invitation") + " " + _loc2_.messageText,Util.getFormattedNow());
         addMsg(_loc3_);
      }
      
      public function startConversation(param1:int) : void
      {
         var _loc2_:Conversation = var_626.addConversation(param1);
         if(_loc2_ == null)
         {
            Logger.log("No friend " + param1 + " found. Shouldn\'t happen");
         }
         else
         {
            setHabboToolbarIcon(true,false);
            var_626.setSelected(_loc2_);
            var_239.openMessenger();
            var_239.refresh();
         }
      }
      
      public function send(param1:IMessageComposer) : void
      {
         _communication.getHabboMainConnection(null).send(param1);
      }
      
      public function get conversations() : Conversations
      {
         return var_626;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      private function getPageParam(param1:String) : String
      {
         var _loc2_:* = null;
         if(param1 == "url.prefix")
         {
            _loc2_ = "d31.web.varoke.net";
            _loc2_ = var_148.getKey("url.prefix",_loc2_);
            _loc2_ = _loc2_.replace("http://","");
            return _loc2_.replace("https://","");
         }
         return null;
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: configuration " + [param1,param2]);
         var_148 = param2 as IHabboConfigurationManager;
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
      }
      
      private function prepareButton(param1:IBitmapWrapperWindow, param2:String, param3:Function, param4:int) : void
      {
         param1.id = param4;
         if(param1.bitmap != null)
         {
            return;
         }
         param1.bitmap = getButtonImage(param2);
         param1.width = param1.bitmap.width;
         param1.height = param1.bitmap.height;
         param1.procedure = param3;
      }
      
      public function getButtonImage(param1:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_png");
         var _loc3_:BitmapDataAsset = _loc2_ as BitmapDataAsset;
         Logger.log("GETTING ASSET: " + param1);
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         Logger.log("GOT ASSET: " + _loc2_ + ", " + _loc4_);
         _loc5_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc5_.draw(_loc4_);
         return _loc5_;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:IAvatarImage = var_889.createAvatarImage(param1,AvatarScaleType.SMALL,null,this);
         if(_loc2_)
         {
            _loc3_ = _loc2_.getImage(AvatarSetType.const_41,true);
            _loc2_.dispose();
            return _loc3_;
         }
         return null;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function createConversation(param1:int) : Conversation
      {
         var _loc2_:IFriend = _friendList.getFriend(param1);
         if(_loc2_ == null)
         {
            Logger.log("No friend found with: " + param1);
            return null;
         }
         Logger.log("A FRIEND FOUND: " + _loc2_.id + ", " + _loc2_.name + ", " + _loc2_.gender + ", " + _loc2_.figure);
         return new Conversation(_loc2_.id,_loc2_.name,_loc2_.figure,_loc2_.followingAllowed);
      }
      
      private function addMsg(param1:Message) : void
      {
         var_626.addMessageAndUpdateView(param1);
         if(!var_239.isMessengerOpen())
         {
            setHabboToolbarIcon(true,true);
         }
      }
      
      public function getText(param1:String) : String
      {
         return _localization.getKey(param1,param1);
      }
      
      private function onMessengerInit(param1:IMessageEvent) : void
      {
         var_626 = new Conversations(new ConversationsDeps(this));
         var_239 = new MessengerView(this);
         _communication.addHabboConnectionMessageEvent(new NewConsoleMessageEvent(onNewConsoleMessage));
         _communication.addHabboConnectionMessageEvent(new RoomInviteEvent(onRoomInvite));
         _communication.addHabboConnectionMessageEvent(new InstantMessageErrorEvent(onInstantMessageError));
         _toolbar.events.addEventListener(HabboToolbarEvent.const_57,onHabboToolbarEvent);
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Messenger: communication available " + [param1,param2]);
         _communication = param2 as IHabboCommunicationManager;
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderedReady);
      }
      
      override public function dispose() : void
      {
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(var_148)
         {
            var_148.release(new IIDHabboConfigurationManager());
            var_148 = null;
         }
         if(_localization)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(_friendList)
         {
            _friendList.release(new IIDHabboFriendList());
            _friendList = null;
         }
         if(var_889)
         {
            var_889.release(new IIDAvatarRenderManager());
            var_889 = null;
         }
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_239)
         {
            var_239.dispose();
            var_239 = null;
         }
         super.dispose();
      }
      
      public function setHabboToolbarIcon(param1:Boolean, param2:Boolean) : void
      {
         if(!param1)
         {
            _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_179,HabboToolbarIconEnum.MESSENGER));
            return;
         }
         _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_119,HabboToolbarIconEnum.MESSENGER));
         var _loc3_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_165,HabboToolbarIconEnum.MESSENGER);
         _loc3_.iconState = !!param2 ? "1" : "0";
         _toolbar.events.dispatchEvent(_loc3_);
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content));
      }
      
      public function setOnlineStatus(param1:int, param2:Boolean) : void
      {
         var_626.setOnlineStatusAndUpdateView(param1,param2);
      }
      
      private function onAvatarRenderedReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Messenger: avatar renderer " + [param1,param2]);
         var_889 = param2 as IAvatarRenderManager;
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(var_239)
         {
            var_239.refresh();
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Messenger: window manager available " + [param1,param2]);
         _windowManager = param2 as IHabboWindowManager;
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Messenger: friend list available " + [param1,param2]);
         _friendList = param2 as IHabboFriendList;
         _communication.addHabboConnectionMessageEvent(new MessengerInitEvent(onMessengerInit));
      }
      
      private function onNewConsoleMessage(param1:IMessageEvent) : void
      {
         var _loc2_:NewConsoleMessageMessageParser = (param1 as NewConsoleMessageEvent).getParser();
         Logger.log("Received console msg: " + _loc2_.messageText + ", " + _loc2_.senderId);
         var _loc3_:Message = new Message(Message.const_711,_loc2_.senderId,_loc2_.messageText,Util.getFormattedNow());
         addMsg(_loc3_);
      }
      
      public function setFollowingAllowed(param1:int, param2:Boolean) : void
      {
         var_626.setFollowingAllowedAndUpdateView(param1,param2);
      }
      
      public function isEmbeddedMinimailEnabled() : Boolean
      {
         var _loc1_:String = var_148.getKey("client.minimail.embed.enabled");
         return _loc1_ == "KickUserMessageComposer";
      }
      
      public function refreshButtonDir(param1:IBitmapWrapperWindow, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         if(!param3)
         {
            param1.visible = false;
         }
         else
         {
            prepareButton(param1,param2,param4,param5);
            param1.visible = true;
         }
      }
      
      private function onInstantMessageError(param1:IMessageEvent) : void
      {
         var _loc2_:InstantMessageErrorMessageParser = (param1 as InstantMessageErrorEvent).getParser();
         var _loc3_:Message = new Message(Message.const_937,_loc2_.userId,getInstantMessageErrorText(_loc2_.errorCode),Util.getFormattedNow());
         var_626.addMessageAndUpdateView(_loc3_);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2) as IHabboToolbar;
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: localization " + [param1,param2]);
         _localization = param2 as IHabboLocalizationManager;
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function refreshButton(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         refreshButtonDir(_loc6_,param2,param3,param4,param5);
      }
      
      private function getVariable(param1:String, param2:Dictionary) : String
      {
         return var_148.getKey(param1,param1,param2);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId != HabboToolbarIconEnum.MESSENGER)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_57)
         {
            if(var_239.isMessengerOpen())
            {
               var_239.close();
            }
            else
            {
               var_239.openMessenger();
            }
            setHabboToolbarIcon(true,false);
         }
      }
      
      public function get messengerView() : MessengerView
      {
         return var_239;
      }
      
      private function getInstantMessageErrorText(param1:int) : String
      {
         if(param1 == 3)
         {
            return getText("messenger.error.receivermuted");
         }
         if(param1 == 4)
         {
            return getText("messenger.error.sendermuted");
         }
         if(param1 == 5)
         {
            return getText("messenger.error.offline");
         }
         if(param1 == 6)
         {
            return getText("messenger.error.notfriend");
         }
         if(param1 == 7)
         {
            return getText("messenger.error.busy");
         }
         return "Unknown im error " + param1;
      }
      
      public function openHabboWebPage(param1:String, param2:Dictionary, param3:WindowEvent) : void
      {
         var linkAlias:String = param1;
         var params:Dictionary = param2;
         var event:WindowEvent = param3;
         params["predefined"] = getPageParam("url.prefix");
         var url:String = getVariable(linkAlias,params);
         var webWindowName:String = "habboMain";
         try
         {
            HabboWebTools.navigateToURL(url,webWindowName);
         }
         catch(e:Error)
         {
            Logger.log("GOT ERROR: " + e);
         }
         var wme:WindowMouseEvent = event as WindowMouseEvent;
      }
   }
}
