package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_716:IAssetLoader;
      
      private var var_1305:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1305 = param1;
         var_716 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_716;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_716 != null)
            {
               if(true)
               {
                  var_716.dispose();
                  var_716 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1305;
      }
   }
}
