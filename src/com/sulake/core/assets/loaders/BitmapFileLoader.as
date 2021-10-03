package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_1028:LoaderContext;
      
      protected var var_696:String;
      
      protected var var_17:Loader;
      
      protected var _type:String;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_696 = param2 == null ? "" : param2.url;
         _type = param1;
         var_17 = new Loader();
         var_1028 = new LoaderContext();
         var_1028.checkPolicyFile = true;
         var_17.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            var_17.load(param2,var_1028);
         }
      }
      
      public function get content() : Object
      {
         return !!var_17 ? var_17.content : null;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!var_17 ? uint(var_17.contentLoaderInfo.bytesLoaded) : uint(0);
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_17 ? uint(var_17.contentLoaderInfo.bytesTotal) : uint(0);
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_1028;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_17.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_17.close();
            }
            catch(e:*)
            {
            }
            var_17.unload();
            var_17 = null;
            _type = null;
            var_696 = null;
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_696 = param1.url;
         var_397 = 0;
         var_17.load(param1,var_1028);
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_397 < var_2497)
            {
               try
               {
                  var_17.close();
                  var_17.unload();
               }
               catch(e:Error)
               {
               }
               var_17.load(new URLRequest(var_696 + (var_696.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_397),var_1028);
               return true;
            }
         }
         return false;
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      public function get url() : String
      {
         return var_696;
      }
   }
}
