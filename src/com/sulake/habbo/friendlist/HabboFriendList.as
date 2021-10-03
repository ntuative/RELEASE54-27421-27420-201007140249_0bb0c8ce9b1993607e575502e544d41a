package com.sulake.habbo.friendlist
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
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptBuddyFailureData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptBuddyResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.BuddyRequestsEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FollowFriendFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewBuddyRequestEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.FriendListUpdateMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.GetBuddyRequestsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.MessengerInitMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.RequestBuddyMessageComposer;
   import com.sulake.habbo.communication.messages.parser.friendlist.AcceptBuddyResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.BuddyRequestsMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.FollowFriendFailedMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.MessengerErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.NewBuddyRequestMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.domain.AvatarSearchDeps;
   import com.sulake.habbo.friendlist.domain.AvatarSearchResults;
   import com.sulake.habbo.friendlist.domain.Friend;
   import com.sulake.habbo.friendlist.domain.FriendCategories;
   import com.sulake.habbo.friendlist.domain.FriendCategoriesDeps;
   import com.sulake.habbo.friendlist.domain.FriendCategory;
   import com.sulake.habbo.friendlist.domain.FriendListTab;
   import com.sulake.habbo.friendlist.domain.FriendListTabs;
   import com.sulake.habbo.friendlist.domain.FriendListTabsDeps;
   import com.sulake.habbo.friendlist.domain.FriendRequest;
   import com.sulake.habbo.friendlist.domain.FriendRequests;
   import com.sulake.habbo.friendlist.domain.FriendRequestsDeps;
   import com.sulake.habbo.friendlist.events.HabboFriendListTrackingEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.messenger.IHabboMessenger;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboMessenger;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendList extends Component implements IHabboFriendList, IAvatarImageListener
   {
      
      public static const const_154:String = "face";
       
      
      private var var_555:Timer;
      
      private var var_148:IHabboConfigurationManager;
      
      private var var_1661:OpenedToWebPopup;
      
      private var var_889:IAvatarRenderManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_457:FriendListTabs;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _view:FriendListView;
      
      private var var_143:IHabboMessenger;
      
      private var var_1660:AvatarSearchResults;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_657:ISessionDataManager;
      
      private var var_385:FriendRequests;
      
      private var var_2116:int;
      
      var var_95:FriendCategories;
      
      private var var_2228:FriendListLookAndFeel;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_958:IHabboNotifications;
      
      public function HabboFriendList(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_2228 = new FriendListLookAndFeel();
         super(param1,param2,param3);
         var_95 = new FriendCategories(new FriendCategoriesDeps(this));
         var_1660 = new AvatarSearchResults(new AvatarSearchDeps(this));
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationComponentInit);
      }
      
      private function onBuddyRequests(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:BuddyRequestsMessageParser = (param1 as BuddyRequestsEvent).getParser();
         var_385.clearAndUpdateView(false);
         for each(_loc3_ in _loc2_.reqs)
         {
            var_385.addRequest(new FriendRequest(_loc3_));
         }
         if(_loc2_.reqs.length > 0)
         {
            var_457.findTab(FriendListTab.const_89).setNewMessageArrived(true);
            refreshToolBarIcon();
         }
         _view.refresh("buddyRequests");
      }
      
      public function showLimitReachedAlert() : void
      {
         registerParameter("friendlist.listfull.text","mylimit","undefined");
         registerParameter("friendlist.listfull.text","clublimit","undefined");
         registerParameter("friendlist.listfull.text","viplimit","undefined");
         new SimpleAlertView(this,"${friendlist.listfull.title}","${friendlist.listfull.text}").show();
      }
      
      private function onFollowFriendFailed(param1:IMessageEvent) : void
      {
         var _loc2_:FollowFriendFailedMessageParser = (param1 as FollowFriendFailedEvent).getParser();
         var _loc3_:String = getFollowFriendErrorText(_loc2_.errorCode);
         Logger.log("Received follow friend failed: " + _loc2_.errorCode + ", " + _loc3_);
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
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
      
      public function getFriendNames() : Array
      {
         if(var_95 == null)
         {
            return [];
         }
         return var_95.getFriendNames();
      }
      
      public function get messenger() : IHabboMessenger
      {
         return var_143;
      }
      
      public function get categories() : FriendCategories
      {
         return var_95;
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
      
      private function onSessionDataReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_657 = param2 as ISessionDataManager;
      }
      
      private function onMessengerInit(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         _view = new FriendListView(this);
         var _loc2_:MessengerInitMessageParser = (param1 as MessengerInitEvent).getParser();
         var_385 = new FriendRequests(new FriendRequestsDeps(this),_loc2_.userFriendLimit,_loc2_.method_6,_loc2_.evenMoreExtendedFriendLimit);
         for each(_loc3_ in _loc2_.categories)
         {
            var_95.addCategory(new FriendCategory(_loc3_.id,_loc3_.name));
         }
         var_95.addCategory(new FriendCategory(FriendCategory.const_979,getText("friendlist.friends")));
         var_95.addCategory(new FriendCategory(FriendCategory.const_418,getText("friendlist.friends.offlinecaption")));
         for each(_loc4_ in getSortedFriends(_loc2_.friends))
         {
            var_95.addFriend(new Friend(_loc4_));
         }
         var_457 = new FriendListTabs(new FriendListTabsDeps(this));
         if(!var_555)
         {
            var_555 = new Timer(120000);
            var_555.addEventListener(TimerEvent.TIMER,sendFriendListUpdate);
            var_555.start();
         }
         getBuddyRequests();
         registerListeners();
         _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_119,HabboToolbarIconEnum.FRIENDLIST));
         _toolbar.events.addEventListener(HabboToolbarEvent.const_57,onHabboToolbarEvent);
         Logger.log("FRIENDLIST INITIALIZED SUCCESSFULLY");
      }
      
      override public function dispose() : void
      {
         if(var_555)
         {
            var_555.stop();
            var_555.removeEventListener(TimerEvent.TIMER,sendFriendListUpdate);
            var_555 = null;
         }
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
         if(var_143)
         {
            var_143.release(new IIDHabboMessenger());
            var_143 = null;
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
         if(var_889)
         {
            var_889.release(new IIDAvatarRenderManager());
            var_889 = null;
         }
         if(var_958)
         {
            var_958.release(new IIDHabboNotifications());
            var_958 = null;
         }
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_657)
         {
            var_657.release(new IIDSessionDataManager());
            var_657 = null;
         }
         super.dispose();
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectMessageParser = (param1 as UserObjectEvent).getParser();
         var_2116 = int(_loc2_.id);
      }
      
      public function get searchResults() : AvatarSearchResults
      {
         return var_1660;
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : IBitmapWrapperWindow
      {
         var _loc7_:BitmapData = getButtonImage(param2);
         var _loc8_:IBitmapWrapperWindow = _windowManager.createWindow(param1,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_35,0 | 0,new Rectangle(param4,param5,_loc7_.width,_loc7_.height),param3,param6) as IBitmapWrapperWindow;
         _loc8_.bitmap = _loc7_;
         return _loc8_;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content));
      }
      
      private function onMessengerComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: messenger available " + [param1,param2]);
         var_143 = param2 as IHabboMessenger;
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderedReady);
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Dictionary = var_95.getAllFriends();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ && !_loc3_.disposed && _loc3_.figure == param1)
            {
               _loc3_.face = getAvatarFaceBitmap(_loc3_.figure);
               if(_loc3_.face)
               {
                  _loc4_ = _loc3_.view.getChildByName(const_154) as IBitmapWrapperWindow;
                  _loc4_.bitmap.fillRect(_loc4_.bitmap.rect,0);
                  _loc4_.bitmap.copyPixels(_loc3_.face,_loc3_.face.rect,new Point(0,0),null,null,true);
                  _loc4_.invalidate();
               }
            }
         }
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var_95.onFriendListUpdate(param1);
         _view.refresh("friendListUpdate");
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: window manager " + [param1,param2]);
         _windowManager = param2 as IHabboWindowManager;
         _communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(onAuthOK));
         _communication.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
         queueInterface(new IIDSessionDataManager(),onSessionDataReady);
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : void
      {
         _localization.registerParameter(param1,param2,param3);
      }
      
      private function onAuthOK(param1:IMessageEvent) : void
      {
         _communication.addHabboConnectionMessageEvent(new MessengerInitEvent(onMessengerInit));
         send(new MessengerInitMessageComposer());
      }
      
      private function onAcceptBuddyResult(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AcceptBuddyResultMessageParser = (param1 as AcceptBuddyResultEvent).getParser();
         for each(_loc3_ in _loc2_.failures)
         {
            friendRequests.acceptFailed(_loc3_.senderName);
         }
      }
      
      public function openFriendList() : void
      {
         if(_view == null)
         {
            Logger.log("Cannot open friendlist. Friendlist not initialized.");
            return;
         }
         _view.openFriendList();
         var _loc1_:FriendListTab = tabs.findTab(FriendListTab.const_84);
         if(_loc1_ != tabs.findSelectedTab())
         {
            tabs.toggleSelected(_loc1_);
            view.refresh("openFriendList");
         }
         _view.mainWindow.activate();
      }
      
      public function get avatarId() : int
      {
         return var_2116;
      }
      
      public function isEmbeddedMinimailEnabled() : Boolean
      {
         var _loc1_:String = var_148.getKey("client.minimail.embed.enabled");
         return _loc1_ == "KickUserMessageComposer";
      }
      
      private function getSortedFriends(param1:Array) : Array
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Array = new Array();
         var _loc3_:Dictionary = new Dictionary();
         for each(_loc4_ in param1)
         {
            _loc2_.push(_loc4_.name.toLowerCase());
            _loc3_[_loc4_.name.toLowerCase()] = _loc4_;
         }
         _loc2_.sort();
         _loc5_ = new Array();
         for each(_loc6_ in _loc2_)
         {
            _loc5_.push(_loc3_[_loc6_]);
         }
         return _loc5_;
      }
      
      private function toggleWindow() : void
      {
         var _loc1_:* = null;
         if(_view.isFriendListOpen())
         {
            _view.close();
            trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED);
         }
         else
         {
            _view.openFriendList();
            _loc1_ = var_457.findSelectedTab();
            if(_loc1_ == null)
            {
               events.dispatchEvent(new Event(HabboFriendListTrackingEvent.const_340));
            }
            else
            {
               switch(_loc1_.id)
               {
                  case FriendListTab.const_84:
                     trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_FRIENDS);
                     break;
                  case FriendListTab.const_327:
                     trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_SEARCH);
                     break;
                  case FriendListTab.const_89:
                     trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_REQUEST);
               }
            }
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2) as IHabboToolbar;
         queueInterface(new IIDHabboNotifications(),onNotificationsReady);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: localization " + [param1,param2]);
         _localization = param2 as IHabboLocalizationManager;
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      private function onMessengerError(param1:IMessageEvent) : void
      {
         var _loc2_:MessengerErrorMessageParser = (param1 as MessengerErrorEvent).getParser();
         var _loc3_:String = "";
         switch(_loc2_.errorCode)
         {
            case 1:
               _loc3_ = "${friendlist.error.friendlistownlimit}";
               break;
            case 2:
               _loc3_ = "${friendlist.error.friendlistlimitofrequester}";
               break;
            case 3:
               _loc3_ = "${friendlist.error.friend_requests_disabled}";
               break;
            case 4:
               _loc3_ = "${friendlist.error.requestnotfound}";
               break;
            default:
               _loc3_ = "Received messenger error: msg: " + _loc2_.clientMessageId + ", errorCode: " + _loc2_.errorCode;
         }
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId != HabboToolbarIconEnum.FRIENDLIST)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_57)
         {
            toggleWindow();
         }
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      private function onHabboSearchResult(param1:IMessageEvent) : void
      {
         var _loc2_:HabboSearchResultMessageParser = (param1 as HabboSearchResultEvent).getParser();
         var_1660.searchReceived(_loc2_.friends,_loc2_.others);
         _view.refresh("search");
      }
      
      public function get tabs() : FriendListTabs
      {
         return var_457;
      }
      
      public function get friendRequests() : FriendRequests
      {
         return var_385;
      }
      
      public function send(param1:IMessageComposer) : void
      {
         _communication.getHabboMainConnection(null).send(param1);
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: configuration " + [param1,param2]);
         var_148 = param2 as IHabboConfigurationManager;
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
      }
      
      public function get laf() : FriendListLookAndFeel
      {
         return var_2228;
      }
      
      public function refreshToolBarIcon() : void
      {
         var _loc1_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_165,HabboToolbarIconEnum.FRIENDLIST);
         _loc1_.iconState = String(var_385.getCountOfOpenRequests() > 0 ? "2" : "0");
         _toolbar.events.dispatchEvent(_loc1_);
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function canBeAskedForAFriend(param1:int) : Boolean
      {
         if(_view == null)
         {
            Logger.log("Cannot process canBeAskedForAFriend. Friendlist not initialized.");
            return false;
         }
         return this.getFriend(param1) == null && !searchResults.isFriendRequestSent(param1) && categories.getFriendCount(false) < friendRequests.limit;
      }
      
      public function getFriend(param1:int) : IFriend
      {
         if(_view == null)
         {
            Logger.log("Cannot process getFriend. Friendlist not initialized.");
            return null;
         }
         return var_95.findFriend(param1);
      }
      
      public function get view() : FriendListView
      {
         return _view;
      }
      
      public function getText(param1:String) : String
      {
         return _localization.getKey(param1);
      }
      
      public function askForAFriend(param1:int, param2:String) : Boolean
      {
         if(_view == null)
         {
            Logger.log("Cannot ask for friend. Friendlist not initialized.");
            return false;
         }
         if(!canBeAskedForAFriend(param1))
         {
            return false;
         }
         send(new RequestBuddyMessageComposer(param2));
         searchResults.setFriendRequestSent(param1);
         return true;
      }
      
      private function getFollowFriendErrorText(param1:int) : String
      {
         if(param1 == 0)
         {
            return "${friendlist.followerror.notfriend}";
         }
         if(param1 == 1)
         {
            return "${friendlist.followerror.offline}";
         }
         if(param1 == 2)
         {
            return "${friendlist.followerror.hotelview}";
         }
         if(param1 == 3)
         {
            return "${friendlist.followerror.prevented}";
         }
         return "Unknown follow friend error " + param1;
      }
      
      public function refreshText(param1:IWindowContainer, param2:String, param3:Boolean, param4:String) : void
      {
         var _loc5_:ITextWindow = ITextWindow(param1.getChildByName(param2));
         if(!param3)
         {
            _loc5_.visible = false;
         }
         else
         {
            _loc5_.visible = true;
            _loc5_.text = param4;
         }
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         if(!var_657 || !var_385)
         {
            return;
         }
         var _loc2_:int = 0;
         if(var_657.hasUserRight("fuse_super_extended_buddylist"))
         {
            _loc2_ = 0;
         }
         else if(var_657.hasUserRight("fuse_extended_buddylist"))
         {
            _loc2_ = 0;
         }
         if(_loc2_ > var_385.limit)
         {
            var_385.limit = _loc2_;
         }
      }
      
      public function declineFriendRequest(param1:int) : void
      {
         var _loc2_:FriendListTab = var_457.findTab(FriendListTab.const_89);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IFriendRequestsView = _loc2_.tabView as IFriendRequestsView;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.declineRequest(param1);
      }
      
      private function onRoomInviteError(param1:IMessageEvent) : void
      {
         var _loc2_:RoomInviteErrorMessageParser = (param1 as RoomInviteErrorEvent).getParser();
         var _loc3_:String = "Received room invite error: errorCode: " + _loc2_.errorCode + ", recipients: " + Util.arrayToString(_loc2_.failedRecipients);
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:IAvatarImage = var_889.createAvatarImage(param1,AvatarScaleType.SMALL,null,this);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:BitmapData = _loc2_.getCroppedImage(AvatarSetType.const_41);
         _loc2_.dispose();
         return _loc3_;
      }
      
      private function onNewBuddyRequest(param1:IMessageEvent) : void
      {
         Logger.log("Received new buddy request");
         var _loc2_:NewBuddyRequestMessageParser = (param1 as NewBuddyRequestEvent).getParser();
         var _loc3_:FriendRequest = new FriendRequest(_loc2_.req);
         var_385.addRequestAndUpdateView(_loc3_);
         var _loc4_:FriendListTab = var_457.findTab(FriendListTab.const_89);
         _loc4_.setNewMessageArrived(true);
         refreshToolBarIcon();
         _view.refresh("newBuddyRequest");
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: communication available " + [param1,param2]);
         _communication = param2 as IHabboCommunicationManager;
         queueInterface(new IIDHabboMessenger(),onMessengerComponentInit);
      }
      
      public function trackFriendListEvent(param1:String) : void
      {
         events.dispatchEvent(new Event(param1));
      }
      
      private function onAvatarRenderedReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Messenger: avatar renderer " + [param1,param2]);
         var_889 = param2 as IAvatarRenderManager;
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_958 = param2 as IHabboNotifications;
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function getFriendCount(param1:Boolean, param2:Boolean) : int
      {
         if(_view == null)
         {
            Logger.log("Cannot get friend count. Friendlist not initialized.");
            return 0;
         }
         return this.var_95.getFriendCount(param1,param2);
      }
      
      private function registerListeners() : void
      {
         _communication.addHabboConnectionMessageEvent(new FollowFriendFailedEvent(onFollowFriendFailed));
         _communication.addHabboConnectionMessageEvent(new FriendListUpdateEvent(onFriendListUpdate));
         _communication.addHabboConnectionMessageEvent(new BuddyRequestsEvent(onBuddyRequests));
         _communication.addHabboConnectionMessageEvent(new NewBuddyRequestEvent(onNewBuddyRequest));
         _communication.addHabboConnectionMessageEvent(new AcceptBuddyResultEvent(onAcceptBuddyResult));
         _communication.addHabboConnectionMessageEvent(new MessengerErrorEvent(onMessengerError));
         _communication.addHabboConnectionMessageEvent(new HabboSearchResultEvent(onHabboSearchResult));
         _communication.addHabboConnectionMessageEvent(new RoomInviteErrorEvent(onRoomInviteError));
         _communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(onUserRights));
      }
      
      public function get notifications() : IHabboNotifications
      {
         return var_958;
      }
      
      public function refreshButton(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            prepareButton(_loc6_,param2,param4,param5);
            _loc6_.visible = true;
         }
      }
      
      private function getVariable(param1:String, param2:Dictionary) : String
      {
         return var_148.getKey(param1,param1,param2);
      }
      
      public function refreshIcon(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:IWindow = param1.findChildByName(param2);
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            _loc6_.id = param5;
            _loc6_.procedure = param4;
            _loc6_.visible = true;
         }
      }
      
      public function openHabboWebPage(param1:String, param2:Dictionary, param3:int, param4:int) : void
      {
         var linkAlias:String = param1;
         var params:Dictionary = param2;
         var x:int = param3;
         var y:int = param4;
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
         if(var_1661 == null)
         {
            var_1661 = new OpenedToWebPopup(this);
         }
         var_1661.show(x,y);
      }
      
      public function acceptFriendRequest(param1:int) : void
      {
         var _loc2_:FriendListTab = var_457.findTab(FriendListTab.const_89);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IFriendRequestsView = _loc2_.tabView as IFriendRequestsView;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.acceptRequest(param1);
      }
      
      private function getBuddyRequests() : void
      {
         Logger.log("Sending buddy requests request");
         send(new GetBuddyRequestsMessageComposer());
      }
      
      protected function sendFriendListUpdate(param1:Event) : void
      {
         Logger.log("Sending update request");
         send(new FriendListUpdateMessageComposer());
      }
   }
}
