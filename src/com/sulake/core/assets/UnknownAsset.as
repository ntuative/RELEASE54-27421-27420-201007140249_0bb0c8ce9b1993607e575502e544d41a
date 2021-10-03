package com.sulake.core.assets
{
   import flash.utils.getQualifiedClassName;
   
   public class UnknownAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1226:AssetTypeDeclaration;
      
      private var var_696:String;
      
      private var var_22:Object = null;
      
      public function UnknownAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1226 = param1;
         var_696 = param2;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1226;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var_22 = param1;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         var_22 = param1.content as Object;
      }
      
      public function get content() : Object
      {
         return var_22;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_22 = null;
            var_1226 = null;
            var_696 = null;
         }
      }
      
      public function get url() : String
      {
         return var_696;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + var_22;
      }
   }
}
