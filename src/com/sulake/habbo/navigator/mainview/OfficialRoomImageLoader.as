package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   
   public class OfficialRoomImageLoader implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_810:IBitmapWrapperWindow;
      
      private var var_696:String;
      
      private var var_978:String;
      
      private var _navigator:HabboNavigator;
      
      public function OfficialRoomImageLoader(param1:HabboNavigator, param2:String, param3:IBitmapWrapperWindow)
      {
         super();
         _navigator = param1;
         var_978 = param2;
         var_810 = param3;
         var _loc4_:String = _navigator.configuration.getKey("image.library.url");
         var_696 = _loc4_ + var_978;
         Logger.log("[OFFICIAL ROOM ICON IMAGE DOWNLOADER] : " + var_696);
      }
      
      private function onLoadError(param1:AssetLoaderEvent) : void
      {
         Logger.log("Error loading image: " + var_696 + ", " + param1);
         dispose();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_810 = null;
         _navigator = null;
      }
      
      private function onImageReady(param1:AssetLoaderEvent) : void
      {
         if(_disposed)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            Logger.log("Loading pic from url: " + var_696 + " failed. loaderStruct == null");
            return;
         }
         Logger.log("IMAGE READY: " + var_978 + ", " + _loc2_);
         setImage();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function startLoad() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.assets.hasAsset(var_978))
         {
            setImage();
         }
         else
         {
            _loc1_ = new URLRequest(var_696);
            _loc2_ = _navigator.assets.loadAssetFromFile(var_978,_loc1_,"image/gif");
            _loc2_.addEventListener(AssetLoaderEvent.const_29,onImageReady);
            _loc2_.addEventListener(AssetLoaderEvent.const_40,onLoadError);
         }
      }
      
      private function setImage() : void
      {
         var _loc1_:BitmapData = _navigator.getButtonImage(var_978,"");
         var_810.bitmap = _loc1_;
         var_810.width = _loc1_.width;
         var_810.height = _loc1_.height;
         var_810.visible = true;
         dispose();
      }
   }
}
