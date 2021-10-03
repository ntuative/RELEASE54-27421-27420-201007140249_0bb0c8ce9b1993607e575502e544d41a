package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.communication.messages.incoming.avatar.OutfitData;
   
   public class WardrobeModel implements ISideContentModel
   {
       
      
      private var _view:WardrobeView;
      
      private var var_172:Boolean = false;
      
      private var _controller:HabboAvatarEditor;
      
      private var var_536:Map;
      
      public function WardrobeModel(param1:HabboAvatarEditor)
      {
         super();
         _controller = param1;
      }
      
      private function isSlotEnabled(param1:int) : Boolean
      {
         if(param1 <= 5)
         {
            return _controller.sessionData.hasUserRight("fuse_use_wardrobe");
         }
         return _controller.sessionData.hasUserRight("fuse_larger_wardrobe");
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_172)
         {
            init();
         }
         return _view.getWindowContainer();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         _controller = null;
         for each(_loc1_ in var_536)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         var_536 = null;
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
         var_172 = false;
      }
      
      public function updateView() : void
      {
         _view.update();
      }
      
      public function reset() : void
      {
         var_172 = false;
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         if(false)
         {
            _controller.handler.getWardrobe();
         }
         if(var_536)
         {
            for each(_loc2_ in var_536)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
         }
         var_536 = new Map();
         var _loc1_:int = 1;
         while(_loc1_ <= 10)
         {
            var_536.add(_loc1_,new WardrobeSlot(_controller,_loc1_,isSlotEnabled(_loc1_)));
            _loc1_++;
         }
         if(_view)
         {
            _view.dispose();
         }
         _view = new WardrobeView(this);
         var_172 = true;
         updateView();
      }
      
      public function get slots() : Array
      {
         return var_536.getValues();
      }
      
      public function updateSlots(param1:int, param2:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!var_172)
         {
            return;
         }
         for each(_loc4_ in param2)
         {
            _loc3_ = var_536.getValue(_loc4_.slotId) as WardrobeSlot;
            if(_loc3_)
            {
               _loc3_.update(_loc4_.figureString,_loc4_.gender,isSlotEnabled(_loc3_.id));
            }
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return _controller;
      }
   }
}
