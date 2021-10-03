package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1905:Number = 1.0;
      
      private var var_155:Number = 1.0;
      
      private var var_2140:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2140 = param1;
         var_155 = param2;
         var_1905 = param3;
      }
      
      public function get scale() : Number
      {
         return var_155;
      }
      
      public function get heightScale() : Number
      {
         return var_1905;
      }
   }
}
