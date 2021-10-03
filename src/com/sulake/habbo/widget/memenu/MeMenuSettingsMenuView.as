package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.external.ExternalInterface;
   
   public class MeMenuSettingsMenuView implements IMeMenuView
   {
       
      
      private var _widget:MeMenuWidget;
      
      private var _window:IWindowContainer;
      
      public function MeMenuSettingsMenuView()
      {
         super();
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc2_:XmlAsset = _widget.assets.getAssetByName("memenu_settings_menu") as XmlAsset;
         _window = _widget.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         _window.name = param1;
         _window.procedure = eventHandler;
         if(true || _widget.config.getKey("has.identity") != "1")
         {
            _window.findChildByName("character_settings").disable();
         }
         else
         {
            _window.findChildByName("identity_text").visible = false;
         }
         _widget.mainContainer.addChild(_window);
      }
      
      public function init(param1:MeMenuWidget, param2:String) : void
      {
         _widget = param1;
         createWindow(param2);
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "character_settings":
               ExternalInterface.call("FlashExternalInterface.openHabblet","avatars");
               _widget.hide();
               break;
            case "sound_settings":
               _widget.changeView(MeMenuWidget.const_528);
               break;
            case "back":
               _widget.changeView(MeMenuWidget.const_105);
         }
      }
      
      public function dispose() : void
      {
         _widget = null;
         _window.dispose();
         _window = null;
      }
   }
}
