package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var var_22:Sound = null;
      
      private var _disposed:Boolean = false;
      
      private var var_1226:AssetTypeDeclaration;
      
      private var var_696:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
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
         if(param1 is Sound)
         {
            if(var_22)
            {
               var_22.close();
            }
            var_22 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(var_22)
            {
               var_22.close();
            }
            var_22 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(var_22)
            {
               var_22.close();
            }
            var_22 = SoundAsset(param1).var_22;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_22 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            var_22 = SoundAsset(param1).var_22;
         }
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
