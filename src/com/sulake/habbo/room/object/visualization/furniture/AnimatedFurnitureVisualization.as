package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.visualization.furniture.data.AnimationFrame;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   
   public class AnimatedFurnitureVisualization extends FurnitureVisualization
   {
       
      
      private var var_1649:int = 0;
      
      private var var_652:AnimatedFurnitureVisualizationData = null;
      
      private var var_2217:Number = 0;
      
      private var _lastFramePlayed:Array;
      
      private var var_553:int = 0;
      
      private var var_188:Array;
      
      private var var_653:Boolean = false;
      
      public function AnimatedFurnitureVisualization()
      {
         var_188 = [];
         _lastFramePlayed = [];
         super();
      }
      
      protected function setAnimation(param1:int) : void
      {
         var_1649 = param1;
         var_553 = 0;
         var_188 = [];
         _lastFramePlayed = [];
         var_653 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         if(!(param1 is AnimatedFurnitureVisualizationData))
         {
            return false;
         }
         var_652 = param1 as AnimatedFurnitureVisualizationData;
         return super.initialize(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_652 = null;
         var_188 = null;
         _lastFramePlayed = null;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:* = null;
         if(param1 >= 0 && param1 < var_188.length)
         {
            _loc3_ = var_188[param1] as AnimationFrame;
            if(_loc3_ != null)
            {
               return _loc3_.id;
            }
         }
         return super.getFrameNumber(param1,param2);
      }
      
      override protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(super.updateObject(param1,param2))
         {
            _loc3_ = object;
            if(_loc3_ == null)
            {
               return false;
            }
            _loc4_ = _loc3_.getState(0);
            if(_loc4_ != var_1649)
            {
               setAnimation(_loc4_);
            }
            return true;
         }
         return false;
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:* = null;
         var _loc4_:int = super.getSpriteYOffset(param1,param2,param3);
         if(param1 >= 0 && param1 < var_188.length)
         {
            _loc5_ = var_188[param1] as AnimationFrame;
            if(_loc5_ != null)
            {
               _loc4_ += _loc5_.y;
            }
         }
         return _loc4_;
      }
      
      protected function getLastFramePlayed(param1:int) : Boolean
      {
         if(param1 < 0 || param1 >= _lastFramePlayed.length)
         {
            return false;
         }
         return _lastFramePlayed[param1];
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:* = null;
         var _loc4_:int = super.getSpriteXOffset(param1,param2,param3);
         if(param1 >= 0 && param1 < var_188.length)
         {
            _loc5_ = var_188[param1] as AnimationFrame;
            if(_loc5_ != null)
            {
               _loc4_ += _loc5_.x;
            }
         }
         return _loc4_;
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(var_652 == null)
         {
            return false;
         }
         if(param1 != var_2217)
         {
            var_188 = [];
            _lastFramePlayed = [];
            var_653 = false;
         }
         if(var_653)
         {
            return false;
         }
         if(var_553 == 0)
         {
            var_553 = var_652.getStartFrame(animationId,param1);
         }
         var_553 += 1;
         var _loc3_:Boolean = false;
         var_653 = true;
         var _loc4_:int = var_652.getLayerCount(param1) - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = null;
            if(_loc4_ < var_188.length)
            {
               _loc5_ = var_188[_loc4_] as AnimationFrame;
            }
            _lastFramePlayed[_loc4_] = false;
            if(_loc5_ != null)
            {
               if(_loc5_.isLastFrame && _loc5_.remainingFrameRepeats <= 1)
               {
                  _lastFramePlayed[_loc4_] = true;
               }
            }
            if(_loc5_ == null || _loc5_.remainingFrameRepeats >= 0 && _loc7_ <= 0)
            {
               _loc6_ = 0;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.activeSequence;
               }
               if(_loc6_ == AnimationFrame.const_1021)
               {
                  _loc5_ = var_652.getFrame(_loc4_,animationId,var_553,param1);
               }
               else
               {
                  _loc5_ = var_652.getFrameFromSequence(_loc4_,animationId,_loc6_,_loc5_.activeSequenceOffset + 1,var_553,param1);
               }
               var_188[_loc4_] = _loc5_;
               if(_loc5_ != null)
               {
                  _loc3_ = true;
               }
            }
            if(_loc5_ == null || _loc5_.isLastFrame && _loc5_.remainingFrameRepeats <= 0)
            {
               _lastFramePlayed[_loc4_] = true;
            }
            else if(_loc5_.remainingFrameRepeats >= 0)
            {
               var_653 = false;
            }
            _loc4_--;
         }
         var_2217 = param1;
         return _loc3_;
      }
      
      public function get animationId() : int
      {
         return var_1649;
      }
   }
}
