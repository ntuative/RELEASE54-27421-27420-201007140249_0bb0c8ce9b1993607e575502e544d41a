package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class LibraryLoaderQueue extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1453:int = 4;
       
      
      private var var_262:Array;
      
      private var var_623:Array;
      
      private var var_697:Boolean = false;
      
      public function LibraryLoaderQueue(param1:Boolean = false)
      {
         var_623 = new Array();
         var_262 = new Array();
         var_697 = param1;
         super();
      }
      
      public function findLibraryLoaderByURL(param1:String, param2:Boolean = true) : LibraryLoader
      {
         var _loc3_:* = null;
         if(!disposed)
         {
            if(param2 && param1.indexOf("?") > -1)
            {
               param1 = param1.slice(0,param1.indexOf("?"));
            }
            for each(_loc3_ in var_262)
            {
               if(param2)
               {
                  if(_loc3_.url.indexOf(param1) == 0)
                  {
                     return _loc3_;
                  }
               }
               else if(_loc3_.url == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function get length() : int
      {
         return NaN;
      }
      
      private function isUrlInQueue(param1:String, param2:Boolean = true) : Boolean
      {
         var _loc3_:* = null;
         if(!disposed)
         {
            if(param2 && param1.indexOf("?") > -1)
            {
               param1 = param1.slice(0,param1.indexOf("?"));
            }
            for each(_loc3_ in var_623)
            {
               if(param2)
               {
                  if(_loc3_.url.indexOf(param1) == 0)
                  {
                     return true;
                  }
               }
               else if(_loc3_.url == param1)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function push(param1:LibraryLoader) : void
      {
         if(!disposed && !isUrlInQueue(param1.url) && !findLibraryLoaderByURL(param1.url))
         {
            if(param1.paused)
            {
               var_623.push(param1);
            }
            else
            {
               var_262.push(param1);
            }
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,libraryLoadedHandler);
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,loadProgressHandler);
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,loaderDisposeHandler);
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler);
            next();
         }
      }
      
      private function libraryLoadedHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         if(_loc2_)
         {
            removeLoader(_loc2_);
         }
         next();
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            super.dispose();
         }
      }
      
      private function loadErrorHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         if(_loc2_)
         {
            Logger.log("Failed to download  specified file: " + _loc2_.url);
            removeLoader(_loc2_);
         }
         next();
      }
      
      private function loadProgressHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
      }
      
      private function removeLoader(param1:LibraryLoader) : void
      {
         var _loc2_:int = 0;
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,libraryLoadedHandler);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,loadProgressHandler);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,loaderDisposeHandler);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler);
         _loc2_ = var_623.indexOf(param1);
         if(_loc2_ > -1)
         {
            var_623.splice(_loc2_,1);
         }
         _loc2_ = var_262.indexOf(param1);
         if(_loc2_ > -1)
         {
            var_262.splice(_loc2_,1);
         }
      }
      
      private function next() : void
      {
         var _loc1_:* = null;
         if(!disposed)
         {
            while(var_262.length < const_1453 && false)
            {
               _loc1_ = var_623.shift();
               var_262.push(_loc1_);
               _loc1_.resume();
            }
         }
      }
      
      private function loaderDisposeHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         removeLoader(_loc2_);
         next();
      }
   }
}
