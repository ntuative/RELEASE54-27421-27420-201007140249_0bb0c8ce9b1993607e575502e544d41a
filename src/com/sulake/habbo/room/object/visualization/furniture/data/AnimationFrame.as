package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_703:int = -1;
      
      public static const const_1021:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2174:int = -1;
      
      private var var_86:int = 0;
      
      private var var_1395:int = 1;
      
      private var var_938:int = 1;
      
      private var var_2175:Boolean = false;
      
      private var var_2173:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_86 = param2;
         _y = param3;
         var_2175 = param5;
         if(param4 < 0)
         {
            param4 = const_703;
         }
         var_938 = param4;
         var_1395 = param4;
         if(param6 >= 0)
         {
            var_2174 = param6;
            var_2173 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_938 > 0 && param1 > var_938)
         {
            param1 = var_938;
         }
         var_1395 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_938;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2173;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_938 < 0)
         {
            return const_703;
         }
         return var_1395;
      }
      
      public function get activeSequence() : int
      {
         return var_2174;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2175;
      }
      
      public function get x() : int
      {
         return var_86;
      }
   }
}
