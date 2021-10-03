package com.sulake.habbo.widget.furniture.credit
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetCreditFurniUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetCreditFurniRedeemMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public class CreditFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1085:Number = 100;
      
      private static const const_1086:Number = 100;
       
      
      private var var_951:int = -1;
      
      private var _window:IWindowContainer;
      
      private var var_1401:Number;
      
      public function CreditFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager)
      {
         super(param1,param2,param3);
      }
      
      private function sendRedeemMessage() : void
      {
         var _loc1_:* = null;
         if(var_951 == -1)
         {
            return;
         }
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetCreditFurniRedeemMessage(RoomWidgetCreditFurniRedeemMessage.const_686,var_951);
            messageListener.processWidgetMessage(_loc1_);
            hideInterface();
         }
      }
      
      override public function dispose() : void
      {
         hideInterface();
         super.dispose();
      }
      
      private function onObjectUpdate(param1:RoomWidgetCreditFurniUpdateEvent) : void
      {
         hideInterface();
         var_951 = param1.objectId;
         var_1401 = param1.creditValue;
         showInterface();
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInterface();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetCreditFurniUpdateEvent.const_740,onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      private function hideInterface() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         var_951 = -1;
         var_1401 = 0;
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "link":
               _loc4_ = localizations.getKey("widget.furni.info.url");
               if(_loc4_.indexOf("http") == 0)
               {
                  HabboWebTools.navigateToURL(_loc4_,"habboMain");
               }
               break;
            case "exchange":
               sendRedeemMessage();
               break;
            case "cancel":
            case "close":
               hideInterface();
         }
      }
      
      private function showInterface() : void
      {
         var _loc3_:* = null;
         if(var_951 == -1)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         windowManager.registerLocalizationParameter("widgets.furniture.credit.redeem.value","value",String(var_1401));
         var _loc1_:IAsset = assets.getAssetByName("credit_redeem");
         var _loc2_:XmlAsset = XmlAsset(_loc1_);
         if(_loc2_ == null)
         {
            return;
         }
         _window = windowManager.createWindow("creditfurniui_container","",HabboWindowType.const_52,HabboWindowStyle.const_37,0 | 0,new Rectangle(const_1085,const_1086,2,2),null,0) as IWindowContainer;
         _window.buildFromXML(XML(_loc2_.content));
         _window.background = true;
         _window.color = 33554431;
         _loc3_ = _window.findChildByName("cancel");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
         }
         _loc3_ = _window.findChildByName("exchange");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
         }
         _loc3_ = _window.findChildByName("link");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
         }
         _loc3_ = _window.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.procedure = onWindowClose;
         }
         _window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetCreditFurniUpdateEvent.const_740,onObjectUpdate);
      }
   }
}
