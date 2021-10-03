package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1792:Number = 0.0;
      
      private var var_1791:Number = 0.0;
      
      private var var_1789:Number = 0.0;
      
      private var var_1790:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1791 = param1;
         var_1789 = param2;
         var_1792 = param3;
         var_1790 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1791;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1792;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1789;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1790;
      }
   }
}
