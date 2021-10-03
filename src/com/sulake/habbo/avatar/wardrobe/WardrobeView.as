package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.habbo.avatar.common.ISideContentView;
   
   public class WardrobeView implements ISideContentView
   {
       
      
      private var var_741:IItemListWindow;
      
      private var _model:WardrobeModel;
      
      private var _window:IWindowContainer;
      
      private var var_1090:IItemListWindow;
      
      public function WardrobeView(param1:WardrobeModel)
      {
         super();
         _model = param1;
         var _loc2_:XmlAsset = _model.controller.assets.getAssetByName("avatareditor_wardrobe_base") as XmlAsset;
         _window = _model.controller.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         var_741 = _window.findChildByName("hc_slots") as IItemListWindow;
         var_1090 = _window.findChildByName("vip_slots") as IItemListWindow;
         _window.visible = false;
         update();
      }
      
      public function update() : void
      {
         var _loc2_:* = null;
         if(var_741)
         {
            var_741.removeListItems();
         }
         if(var_1090)
         {
            var_1090.removeListItems();
         }
         var _loc1_:Array = _model.slots;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_ = _loc1_[_loc3_];
            if(_loc3_ < 5)
            {
               if(var_741)
               {
                  var_741.addListItem(_loc2_.view);
                  _loc2_.view.visible = true;
               }
            }
            else if(var_1090)
            {
               var_1090.addListItem(_loc2_.view);
               _loc2_.view.visible = true;
            }
            _loc3_++;
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
      
      public function dispose() : void
      {
         _model = null;
         var_741 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
   }
}
