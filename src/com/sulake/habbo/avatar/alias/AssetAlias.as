package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1125:Boolean;
      
      private var _name:String;
      
      private var var_2076:String;
      
      private var var_1126:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2076 = String(param1.@link);
         var_1126 = Boolean(parseInt(param1.@fliph));
         var_1125 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1126;
      }
      
      public function get flipV() : Boolean
      {
         return var_1125;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2076;
      }
   }
}
