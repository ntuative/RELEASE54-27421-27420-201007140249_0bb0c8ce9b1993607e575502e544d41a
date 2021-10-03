package com.sulake.core.assets
{
   import flash.utils.ByteArray;
   
   public class XmlAsset implements IAsset
   {
       
      
      private var var_22:XML;
      
      private var _disposed:Boolean = false;
      
      private var var_1226:AssetTypeDeclaration;
      
      private var var_696:String;
      
      public function XmlAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1226 = param1;
         var_696 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1226;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return var_696;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = new param1() as ByteArray;
            var_22 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is ByteArray)
         {
            _loc2_ = param1 as ByteArray;
            var_22 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is String)
         {
            var_22 = new XML(param1 as String);
            return;
         }
         if(param1 is XML)
         {
            var_22 = param1 as XML;
            return;
         }
         if(param1 is XmlAsset)
         {
            var_22 = XmlAsset(param1).var_22;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_22 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is XmlAsset)
         {
            var_22 = XmlAsset(param1).var_22;
            return;
         }
         throw Error("Provided asset is not of type XmlAsset!");
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
   }
}
