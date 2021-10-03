package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class AvatarAssetDownloadLibrary extends EventDispatcher
   {
      
      private static var name_1:int = 0;
      
      private static var name_2:int = 2;
      
      private static var var_2326:int = 1;
       
      
      private var _assets:IAssetLibrary;
      
      private var var_980:String;
      
      private var var_1168:String;
      
      private var var_38:int;
      
      private var _revision:String;
      
      public function AvatarAssetDownloadLibrary(param1:String, param2:String, param3:String, param4:IAssetLibrary)
      {
         super();
         var_38 = name_1;
         _assets = param4;
         var_980 = String(param1);
         _revision = String(param2);
         var_1168 = param3 + var_980 + ".swf";
         var_1168 = var_1168.replace("%revision%",_revision);
         var _loc5_:AssetLibraryCollection = _assets as AssetLibraryCollection;
         var _loc6_:IAssetLibrary = _loc5_.getAssetLibraryByUrl(var_980 + ".swf");
         if(_loc6_ != null)
         {
            Logger.log("[AvatarAssetDownloadLibrary] Already Downloaded by Core: " + var_980);
            var_38 = name_2;
         }
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
         var_38 = name_2;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function toString() : String
      {
         var _loc1_:String = var_980;
         return _loc1_ + (!!isReady ? "[x]" : "[ ]");
      }
      
      public function get libraryName() : String
      {
         return var_980;
      }
      
      public function startDownloading() : void
      {
         var_38 = var_2326;
         var _loc1_:URLRequest = new URLRequest(var_1168);
         var _loc2_:LibraryLoader = new LibraryLoader();
         _assets.loadFromFile(_loc2_,true);
         _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
         _loc2_.load(_loc1_);
      }
      
      public function get isReady() : Boolean
      {
         return var_38 == name_2;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
