package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   import flash.net.SharedObject;
   
   public class HabboLoginDemoView extends EventDispatcher
   {
      
      public static const const_529:String = "InitConnection";
       
      
      private const const_1494:String = "fuselogin";
      
      public var name:String = "";
      
      private var _window:IWindowContainer;
      
      private var var_191:HabboCommunicationDemo;
      
      public var password:String = "";
      
      private var var_124:SSOTicket;
      
      public function HabboLoginDemoView(param1:HabboCommunicationDemo)
      {
         super();
         var_191 = param1;
         createWindow();
      }
      
      public function closeLoginWindow() : void
      {
         var_191.windowManager.removeWindow("habbo_login_window");
      }
      
      public function get useSSOTicket() : Boolean
      {
         var _loc1_:ISelectableWindow = _window.findChildByName("useTicket") as ISelectableWindow;
         if(_loc1_ != null)
         {
            return _loc1_.isSelected;
         }
         return false;
      }
      
      private function onParsedTicketSuccess(param1:Event) : void
      {
         Logger.log("Got ticket: undefined");
         var_191.shockwaveClientUrl = var_124.shockwaveClientUrl;
         var_191.ssoTicket = var_124.ticket;
         var_124.removeEventListener(SSOTicket.const_306,onParsedTicketSuccess);
         var_124.removeEventListener(SSOTicket.const_260,onParsedTicketFailure);
         var_124 = null;
         dispatchEvent(new Event(const_529));
      }
      
      private function windowEventProcessor(param1:Event = null, param2:IWindow = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:IWindowContainer = param1.target.parent as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.findChildByName("input001") as ITextFieldWindow;
            _loc5_ = _loc3_.findChildByName("input002") as ITextFieldWindow;
            if(_loc4_ != null)
            {
               name = _loc4_.text;
            }
            if(_loc5_ != null)
            {
               password = _loc5_.text;
            }
            _loc6_ = SharedObject.getLocal(const_1494,"/");
            _loc6_.data.login = name;
            _loc6_.data.password = password;
            _loc6_.flush();
         }
         if(useSSOTicket)
         {
            initSSOTicket();
         }
         else
         {
            dispatchEvent(new Event(const_529));
         }
      }
      
      private function createWindow() : void
      {
         var _loc8_:* = null;
         var _loc1_:XmlAsset = (var_191 as Component).assets.getAssetByName("login_window") as XmlAsset;
         if(_loc1_ == null)
         {
            Logger.log("Could  not find embedded Window XML for Login Window, login_window");
            return;
         }
         _window = var_191.windowManager.createWindow("habbo_login_window","Login",HabboWindowType.const_103,HabboWindowStyle.const_35,0 | 0,new Rectangle(10,10,320,240),null) as IFrameWindow;
         var _loc2_:XML = _loc1_.content as XML;
         var _loc3_:IWindowContainer = var_191.windowManager.buildFromXML(_loc2_) as IWindowContainer;
         _window.addChild(_loc3_);
         _window.width = _loc3_.width + 20;
         _window.height = _loc3_.height + 40;
         _loc3_.x = 10;
         _loc3_.y = 30;
         _window.center();
         var _loc4_:IButtonWindow = _loc3_.findChildByName("button001") as IButtonWindow;
         var _loc5_:ITextFieldWindow = _loc3_.findChildByName("input001") as ITextFieldWindow;
         var _loc6_:ITextFieldWindow = _loc3_.findChildByName("input002") as ITextFieldWindow;
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.const_91,windowEventProcessor);
         }
         else
         {
            Logger.log("Could not find the button");
         }
         var _loc7_:SharedObject = SharedObject.getLocal(const_1494,"/");
         if(_loc5_ != null)
         {
            _loc5_.textBackground = true;
            _loc5_.textBackgroundColor = 16777215;
            if(_loc7_.data.login != null)
            {
               _loc5_.text = _loc7_.data.login;
            }
         }
         if(_loc6_ != null)
         {
            _loc6_.textBackground = true;
            _loc6_.textBackgroundColor = 16777215;
            if(_loc7_.data.password != null)
            {
               _loc6_.text = _loc7_.data.password;
            }
         }
         if(false)
         {
            if(var_191.habboConfiguration.getKey("use.sso","false") == "KickUserMessageComposer")
            {
               _loc8_ = _window.findChildByName("useTicket") as ISelectableWindow;
               _loc8_.select();
            }
         }
      }
      
      public function displayResults(param1:String) : void
      {
         var _loc2_:ITextWindow = _window.findChildByName("text002") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = param1;
         }
      }
      
      private function listEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_191.sendTryLogin(name,password,param2.id);
      }
      
      private function initSSOTicket() : void
      {
         if(var_124 != null)
         {
            var_124.removeEventListener(SSOTicket.const_306,onParsedTicketSuccess);
            var_124.removeEventListener(SSOTicket.const_260,onParsedTicketFailure);
            var_124 = null;
         }
         var _loc1_:String = "";
         if(false)
         {
            _loc1_ = var_191.habboConfiguration.getKey("url.prefix",_loc1_);
            _loc1_ = _loc1_.replace("http://","");
            _loc1_ = _loc1_.replace("https://","");
         }
         var _loc2_:IHabboWebLogin = var_191.habboCommunication.habboWebLogin(name,password);
         var_124 = new SSOTicket(var_191.assets,_loc2_,_loc1_);
         var_124.addEventListener(SSOTicket.const_306,onParsedTicketSuccess);
         var_124.addEventListener(SSOTicket.const_260,onParsedTicketFailure);
      }
      
      private function onParsedTicketFailure(param1:Event) : void
      {
         Logger.log("Could not get a ticket! ");
         var_124.removeEventListener(SSOTicket.const_306,onParsedTicketSuccess);
         var_124.removeEventListener(SSOTicket.const_260,onParsedTicketFailure);
         var_124 = null;
         dispatchEvent(new Event(const_529));
      }
      
      public function populateUserList(param1:Map) : void
      {
         var _loc5_:* = null;
         var _loc2_:IItemListWindow = _window.findChildByName("list") as IItemListWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:XmlAsset = var_191.assets.getAssetByName("login_user_list_item") as XmlAsset;
         var _loc4_:IWindow = var_191.windowManager.buildFromXML(_loc3_.content as XML);
         _loc4_.procedure = listEventHandler;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc5_ = _loc4_.clone();
            _loc5_.id = param1.getKey(_loc6_);
            _loc5_.caption = param1.getWithIndex(_loc6_);
            _loc2_.addListItem(_loc5_);
            _loc6_++;
         }
         _loc4_.dispose();
      }
      
      public function dispose() : void
      {
      }
   }
}
