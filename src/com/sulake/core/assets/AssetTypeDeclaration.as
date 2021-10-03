package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1754:Class;
      
      private var var_1752:Class;
      
      private var var_1753:String;
      
      private var var_1223:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1753 = param1;
         var_1752 = param2;
         var_1754 = param3;
         if(rest == null)
         {
            var_1223 = new Array();
         }
         else
         {
            var_1223 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1754;
      }
      
      public function get assetClass() : Class
      {
         return var_1752;
      }
      
      public function get mimeType() : String
      {
         return var_1753;
      }
      
      public function get fileTypes() : Array
      {
         return var_1223;
      }
   }
}
