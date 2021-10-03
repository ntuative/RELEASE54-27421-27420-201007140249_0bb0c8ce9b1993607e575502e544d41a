package com.sulake.habbo.avatar.hotlooks
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.wardrobe.Outfit;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class HotLooksView implements IAvatarEditorCategoryView
   {
       
      
      private var _model:HotLooksModel;
      
      private var var_639:IItemGridWindow;
      
      private var _window:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      public function HotLooksView(param1:HotLooksModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         _model = param1;
         _assetLibrary = param3;
         _windowManager = param2;
      }
      
      private function hotLooksEventProc(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = var_639.getGridItemIndex(param2.parent);
            _model.selectHotLook(_loc3_);
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var_639.removeGridItems();
         for each(_loc2_ in _model.hotLooks)
         {
            _loc1_ = _loc2_.view.window;
            var_639.addGridItem(_loc1_);
            _loc1_.procedure = hotLooksEventProc;
         }
      }
      
      public function init() : void
      {
         if(var_639)
         {
            var_639.removeGridItems();
         }
         if(_window)
         {
            _window.dispose();
         }
         var _loc1_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_hotlooks_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc1_.content as XML));
         var_639 = _window.findChildByName("hotlooks") as IItemGridWindow;
         _window.visible = false;
         update();
      }
      
      public function switchCategory(param1:String) : void
      {
      }
      
      public function showPalettes(param1:String, param2:int) : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function dispose() : void
      {
         while(false)
         {
            var_639.removeGridItemAt(0);
         }
         _window.dispose();
         _window = null;
         _model = null;
         _assetLibrary = null;
         _windowManager = null;
      }
   }
}
