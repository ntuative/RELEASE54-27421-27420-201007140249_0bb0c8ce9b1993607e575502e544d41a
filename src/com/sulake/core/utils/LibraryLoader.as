package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class LibraryLoader extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1448:uint = 2;
      
      protected static const const_1450:uint = 1;
      
      public static const const_955:int = 5;
      
      protected static const name_2:uint = 7;
      
      protected static const const_1451:uint = 4;
      
      protected static const const_1449:uint = 3;
       
      
      protected var var_303:int;
      
      protected var var_2417:String = "";
      
      protected var var_152:int = 0;
      
      protected var var_542:XML;
      
      protected var var_1198:Boolean = true;
      
      protected var var_585:Boolean = false;
      
      protected var var_835:int;
      
      protected var var_479:uint = 0;
      
      protected var var_17:Loader;
      
      protected var var_2416:String = "";
      
      protected var var_478:Boolean = false;
      
      protected var var_42:URLRequest;
      
      protected var var_697:Boolean = false;
      
      protected var var_195:int;
      
      protected var _name:String;
      
      protected var var_376:Class;
      
      protected var var_2544:uint = 0;
      
      protected var _context:LoaderContext;
      
      public function LibraryLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         if(param1 == null)
         {
            _context = new LoaderContext();
            _context.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            _context = param1;
         }
         var_478 = param2;
         var_697 = param3;
         var_152 = 0;
         var_17 = new Loader();
         var_17.contentLoaderInfo.addEventListener(Event.INIT,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         super();
      }
      
      protected static function parseNameFromUrl(param1:String) : String
      {
         var _loc2_:int = 0;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(_loc2_ + 1,param1.length);
         }
         return param1;
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2417;
      }
      
      protected function addRequestCounterToUrlRequest(param1:URLRequest, param2:int) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc11_:* = null;
         if(param1.url == null || param1.url == "")
         {
            return;
         }
         var _loc3_:Array = param1.url.split("?");
         var _loc4_:String = _loc3_[0];
         var _loc5_:String = "";
         if(_loc3_.length > 1)
         {
            _loc5_ = _loc3_[1];
         }
         var _loc7_:Array = _loc5_.split("&");
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc11_ = _loc7_[_loc9_];
            if(_loc11_.indexOf("counterparameter=") >= 0)
            {
               _loc11_ = "counterparameter=" + param2.toString();
               _loc7_[_loc9_] = _loc11_;
               _loc8_ = true;
            }
            _loc9_++;
         }
         if(!_loc8_)
         {
            _loc7_.push("counterparameter=" + param2);
         }
         var _loc10_:String = _loc4_;
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(_loc9_ == 0)
            {
               _loc10_ = _loc10_ + "?" + _loc7_[_loc9_];
            }
            else
            {
               _loc10_ = _loc10_ + "&" + _loc7_[_loc9_];
            }
            _loc9_++;
         }
         param1.url = _loc10_;
      }
      
      protected function failure(param1:String) : void
      {
         var_2416 = param1;
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,var_152,bytesTotal,bytesLoaded,elapsedTime));
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get resource() : Class
      {
         return var_376;
      }
      
      public function get request() : URLRequest
      {
         return var_42;
      }
      
      public function getLastErrorMessage() : String
      {
         return var_2416;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         return var_17.contentLoaderInfo.applicationDomain.hasDefinition(param1);
      }
      
      public function get bytesTotal() : uint
      {
         return var_17.contentLoaderInfo.bytesTotal;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,var_152,bytesTotal,bytesLoaded,elapsedTime));
            try
            {
               var_17.close();
               var_17.unload();
            }
            catch(e:Error)
            {
            }
            var_17 = null;
            _context = null;
            var_376 = null;
            var_542 = null;
            super.dispose();
         }
      }
      
      public function get ready() : Boolean
      {
         return var_585;
      }
      
      public function resume() : void
      {
         if(var_478 && !_disposed)
         {
            var_478 = false;
            if(!var_585 && var_42)
            {
               var_195 = -1;
               var_835 = getTimer();
               var_17.load(var_42);
            }
         }
      }
      
      public function get paused() : Boolean
      {
         return var_478;
      }
      
      protected function prepareLibrary() : void
      {
         var xmlClass:Class = null;
         debug("Preparing library \"" + _name + "\"");
         var_376 = this.getDefinition(_name) as Class;
         if(var_376 == null)
         {
            failure("Failed to find resource class \"" + _name + "\" in library " + var_42.url + "!");
            return;
         }
         try
         {
            xmlClass = var_376.manifest as Class;
            if(xmlClass == null)
            {
               return;
            }
         }
         catch(e:Error)
         {
            failure("Failed to find embedded manifest.xml in library undefined!");
            return;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         var_542 = new XML(bytes.readUTFBytes(bytes.length));
      }
      
      public function get manifest() : XML
      {
         return var_542;
      }
      
      public function get domain() : ApplicationDomain
      {
         return var_17.contentLoaderInfo.applicationDomain;
      }
      
      public function getDefinition(param1:String) : Object
      {
         if(var_17.contentLoaderInfo.applicationDomain.hasDefinition(param1))
         {
            return var_17.contentLoaderInfo.applicationDomain.getDefinition(param1);
         }
         return null;
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:DisplayObject = var_17.content;
         debug("Analyzing library \"" + _name + "\", content " + (_loc1_ is MovieClip ? "is" : "is not") + " a MovieClip");
         debug("\tBytes loaded: " + var_17.contentLoaderInfo.bytesLoaded + "/" + var_17.contentLoaderInfo.bytesTotal);
         if(_loc1_ is MovieClip)
         {
            _loc2_ = _loc1_ as MovieClip;
            _loc4_ = _loc2_.currentLabels;
            debug("\tLibrary \"" + _name + "\" is in frame " + _loc2_.currentFrame + "(" + _loc2_.currentLabel + ")");
            if(_loc4_.length > 1)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc3_ = _loc4_[_loc5_] as FrameLabel;
                  if(_loc3_.name == _name)
                  {
                     if(_loc3_.frame != _loc2_.currentFrame)
                     {
                        _loc2_.addEventListener(Event.ENTER_FRAME,loadEventHandler);
                        return false;
                     }
                  }
                  _loc5_++;
               }
            }
         }
         return true;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_17.contentLoaderInfo.bytesLoaded;
      }
      
      protected function debug(param1:String) : void
      {
         var_2417 = param1;
         if(var_697)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,var_152,bytesTotal,bytesLoaded,elapsedTime));
         }
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case Event.INIT:
               debug("Load event INIT for file \"" + var_17.contentLoaderInfo.url + "\"");
               var_479 |= 0;
               break;
            case Event.COMPLETE:
               debug("Load event COMPLETE for file \"" + var_17.contentLoaderInfo.url + "\"");
               var_479 |= 0;
               break;
            case Event.ENTER_FRAME:
               break;
            case HTTPStatusEvent.HTTP_STATUS:
               var_152 = HTTPStatusEvent(param1).status;
               debug("Load event STATUS " + var_152 + " for file \"" + var_17.contentLoaderInfo.url + "\"");
               break;
            case Event.UNLOAD:
               debug("Load event UNLOAD for file \"" + var_17.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD,var_152,bytesTotal,bytesLoaded,elapsedTime));
               break;
            case ProgressEvent.PROGRESS:
               debug("Load event PROGRESS for file \"" + var_17.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,var_152,bytesTotal,bytesLoaded,elapsedTime));
               break;
            case IOErrorEvent.IO_ERROR:
               debug("Load event IO ERROR for file \"" + var_17.contentLoaderInfo.url + "\"");
               if(!handleHttpStatus(var_152))
               {
                  var_195 = getTimer();
                  failure("IO Error, send or load operation failed for file \"" + var_17.contentLoaderInfo.url + "\"");
                  removeEventListeners();
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               var_195 = getTimer();
               failure("Security Error, security violation with file \"" + var_17.contentLoaderInfo.url + "\"");
               removeEventListeners();
               break;
            default:
               Logger.log("LibraryLoader::loadEventHandler(" + param1 + ")");
         }
         if(var_479 == LibraryLoader.const_1449)
         {
            if(analyzeLibrary())
            {
               var_479 |= 0;
            }
         }
         if(var_479 == LibraryLoader.name_2)
         {
            var_585 = true;
            var_195 = getTimer();
            prepareLibrary();
            removeEventListeners();
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,var_152,bytesTotal,bytesLoaded,elapsedTime));
         }
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         var statusCode:int = param1;
         if(statusCode == 0 || statusCode >= 400)
         {
            if(var_303 > 0)
            {
               try
               {
                  var_17.close();
                  var_17.unload();
               }
               catch(e:Error)
               {
               }
               addRequestCounterToUrlRequest(var_42,const_955 - var_303);
               if(var_1198)
               {
                  var_42.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
                  var_42.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
                  var_1198 = false;
               }
               var_17.load(var_42,_context);
               --var_303;
               return true;
            }
            failure("HTTP Error " + statusCode + " \"" + var_17.contentLoaderInfo.url + "\"");
            removeEventListeners();
         }
         return false;
      }
      
      public function get elapsedTime() : uint
      {
         return !!var_585 ? uint(var_195 - var_835) : uint(getTimer() - var_835);
      }
      
      public function get url() : String
      {
         return !!var_42 ? "null" : null;
      }
      
      public function get status() : int
      {
         return var_152;
      }
      
      public function load(param1:URLRequest, param2:int = 5) : void
      {
         var_585 = false;
         var_42 = param1;
         var_303 = param2;
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         _name = parseNameFromUrl(var_42.url);
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         if(!var_478)
         {
            var_195 = -1;
            var_835 = getTimer();
            var_17.load(var_42,_context);
         }
      }
      
      protected function removeEventListeners() : void
      {
         if(var_17)
         {
            if(false)
            {
               var_17.content.removeEventListener(Event.ENTER_FRAME,loadEventHandler);
            }
            var_17.contentLoaderInfo.removeEventListener(Event.INIT,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         }
      }
   }
}
