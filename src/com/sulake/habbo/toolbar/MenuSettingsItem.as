package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2108:Array;
      
      private var var_1736:String;
      
      private var var_2107:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1736 = param1;
         var_2108 = param2;
         var_2107 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1736;
      }
      
      public function get yieldList() : Array
      {
         return var_2108;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_2107;
      }
   }
}
