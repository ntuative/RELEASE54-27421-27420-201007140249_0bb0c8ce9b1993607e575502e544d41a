package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2272:Date;
      
      private var var_1428:Boolean = false;
      
      private var _type:int;
      
      private var var_396:BitmapData;
      
      private var var_268:Boolean = false;
      
      private var var_1240:int;
      
      private var var_662:int = 1;
      
      private var var_1157:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_396;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_662;
         if(var_662 < 0)
         {
            var_662 = 0;
         }
         var_1157 = var_1240;
         var_268 = false;
         var_1428 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1157 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_268;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_396 = param1;
      }
      
      public function get duration() : int
      {
         return var_1240;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1428;
      }
      
      public function get effectsInInventory() : int
      {
         return var_662;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_396;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_268)
         {
            var_2272 = new Date();
         }
         var_268 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_662 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_268)
         {
            _loc1_ = var_1157 - (new Date().valueOf() - var_2272.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1157;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1428 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1240 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
