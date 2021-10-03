package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetAvatarEditorMessage;
   
   public class MeMenuClothesView implements IMeMenuView
   {
       
      
      private var _widget:MeMenuWidget;
      
      private var _window:IWindowContainer;
      
      public function MeMenuClothesView()
      {
         super();
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc2_:XmlAsset = _widget.assets.getAssetByName("memenu_clothes") as XmlAsset;
         _window = _widget.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         _window.name = param1;
         _widget.mainContainer.addChild(_window);
         _window.addEventListener(WindowEvent.const_263,onChildResized);
         _widget.messageListener.processWidgetMessage(new RoomWidgetAvatarEditorMessage(RoomWidgetAvatarEditorMessage.const_330,_window));
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
      
      private function onChildResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = _window.getChildAt(0);
         if(!_loc2_)
         {
            return;
         }
         _window.width = _loc2_.width;
         _widget.updateSize();
      }
      
      public function dispose() : void
      {
         if(_widget && false)
         {
            _widget.messageListener.processWidgetMessage(new RoomWidgetAvatarEditorMessage(RoomWidgetAvatarEditorMessage.const_594));
         }
         _widget = null;
         if(false)
         {
            _window.removeChildAt(0);
         }
         _window.dispose();
         _window = null;
      }
   }
}
