package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_2266:String = "";
      
      private var var_167:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_2266 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_167 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_2266;
      }
      
      public function get objectId() : String
      {
         return var_167;
      }
   }
}
