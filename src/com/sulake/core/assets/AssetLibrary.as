package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.assets.loaders.BinaryFileLoader;
   import com.sulake.core.assets.loaders.BitmapFileLoader;
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.assets.loaders.SoundFileLoader;
   import com.sulake.core.assets.loaders.ZipFileLoader;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.ZipLoader;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class AssetLibrary extends EventDispatcher implements IAssetLibrary
   {
      
      private static var var_1136:Array = new Array();
      
      private static var _sharedListOfTypesByMime:Dictionary;
      
      private static var var_648:uint = 0;
      
      public static const const_655:String = "AssetLibraryReady";
      
      public static const const_1282:String = "AssetLibraryUnloaded";
      
      public static const const_487:String = "AssetLibraryLoaded";
      
      public static const const_1418:String = "AssetLibraryLoadError";
       
      
      private var var_542:XML;
      
      private var var_447:Dictionary;
      
      private var var_375:Array;
      
      private var var_214:uint;
      
      private var var_17:LibraryLoader;
      
      private var var_446:Dictionary;
      
      private var var_144:Dictionary;
      
      private var var_331:Boolean;
      
      private var _file:String;
      
      private var var_697:Boolean = false;
      
      private var var_785:Dictionary;
      
      private var _name:String;
      
      private var var_543:Boolean = true;
      
      private var var_376:Class;
      
      public function AssetLibrary(param1:String)
      {
         super();
         _name = param1;
         var_542 = new XML();
         var_214 = 0;
         var_375 = new Array();
         if(_sharedListOfTypesByMime == null)
         {
            _sharedListOfTypesByMime = new Dictionary(false);
            registerAssetTypeDeclaration(new AssetTypeDeclaration("application/octet-stream",UnknownAsset,BinaryFileLoader));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-shockwave-flash",DisplayAsset,BitmapFileLoader,"swf"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-font-truetype",ClassAsset,BinaryFileLoader,"ttf"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("application/zip",UnknownAsset,ZipFileLoader,"zip"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("text/xml",XmlAsset,BinaryFileLoader,"xml"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("text/html",XmlAsset,BinaryFileLoader,"htm","html"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("text/plain",TextAsset,BinaryFileLoader,"txt"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("image/jpeg",BitmapDataAsset,BitmapFileLoader,"jpg","jpeg"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("image/gif",BitmapDataAsset,BitmapFileLoader,"gif"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("image/png",BitmapDataAsset,BitmapFileLoader,"png"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("image/tiff",BitmapDataAsset,BitmapFileLoader,"tif","tiff"));
            registerAssetTypeDeclaration(new AssetTypeDeclaration("sound/mp3",SoundAsset,SoundFileLoader,"mp3"));
         }
         ++var_648;
         var_447 = new Dictionary(false);
         var_446 = new Dictionary(false);
         var_785 = new Dictionary(false);
         var_144 = new Dictionary(false);
         var_1136.push(this);
      }
      
      public static function get numAssetLibraryInstances() : uint
      {
         return var_648;
      }
      
      public static function get assetLibraryRefArray() : Array
      {
         return var_1136;
      }
      
      private static function fetchLibraryContents(param1:AssetLibrary, param2:XML, param3:Class) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(param3 == null)
         {
            throw new Error("Library " + param1._file + " doesn\'t contain valid resource class!");
         }
         var _loc4_:XMLList = param2.child("library");
         if(_loc4_ == null)
         {
            throw Error("Provided manifest doesn\'t contain library node!");
         }
         _loc4_ = _loc4_[0].assets;
         if(_loc4_ != null)
         {
            _loc4_ = _loc4_.child("asset");
            _loc9_ = 0;
            while(_loc9_ < _loc4_.length())
            {
               _loc5_ = _loc4_[_loc9_];
               _loc6_ = _loc5_.attribute("name");
               _loc7_ = param1.getAssetTypeDeclarationByMimeType(_loc5_.attribute("mimeType"));
               if(_loc7_ != null)
               {
                  _loc8_ = new _loc7_.assetClass(_loc7_) as IAsset;
                  _loc8_.setUnknownContent(param3[_loc6_]);
                  if(_loc5_.child("param").length())
                  {
                     _loc8_.setParamsDesc(_loc5_.child("param"));
                  }
                  param1.setAsset(_loc6_,_loc8_);
               }
               else
               {
                  Logger.log("Failed to extract asset " + _loc6_ + " from Library " + param1._file + "!");
               }
               _loc9_++;
            }
         }
         return true;
      }
      
      public function getAssetTypeDeclarationByFileName(param1:String, param2:Boolean = true) : AssetTypeDeclaration
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:String = param1.substr(param1.lastIndexOf(".") + 1,param1.length);
         if(_loc3_.indexOf("?"))
         {
            _loc3_ = _loc3_.substr(0,_loc3_.indexOf("?") - 1);
         }
         if(param2)
         {
            for(_loc5_ in _sharedListOfTypesByMime)
            {
               _loc4_ = AssetTypeDeclaration(_sharedListOfTypesByMime[_loc5_]);
               if(_loc4_ != null)
               {
                  if(_loc4_.fileTypes.indexOf(_loc3_))
                  {
                     return _loc4_;
                  }
               }
            }
         }
         for(_loc5_ in var_447)
         {
            _loc4_ = AssetTypeDeclaration(var_447[_loc5_]);
            if(_loc4_ != null)
            {
               if(_loc4_.fileTypes.indexOf(_loc3_))
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function unload() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for(_loc1_ in var_446)
         {
            _loc2_ = var_446[_loc1_];
            _loc2_.assetLoader.dispose();
            delete var_446[_loc1_];
         }
         for(_loc1_ in var_144)
         {
            delete var_144[_loc1_];
         }
         for(_loc1_ in var_785)
         {
            delete var_785[_loc1_];
         }
         if(var_17 != null)
         {
            var_17.dispose();
            var_17 = null;
         }
         var_214 = 0;
         var_331 = false;
         _file = null;
         dispatchEvent(new Event(AssetLibrary.const_1282));
      }
      
      public function getAssetByContent(param1:Object) : IAsset
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc2_ in var_144)
         {
            _loc3_ = var_144[_loc2_];
            if(_loc3_.content === param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function libraryLoadedHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         if(_loc2_.manifest == null)
         {
            throw new Error("loader.manifest was null, which would have caused error 1009 anyway. See HL-22347.");
         }
         var_542 = _loc2_.manifest.copy();
         var_376 = _loc2_.resource;
         _file = _loc2_.url;
         if(var_543)
         {
            AssetLibrary.fetchLibraryContents(this,var_542,var_376);
         }
         var_331 = true;
         dispatchEvent(new Event(AssetLibrary.const_487));
         dispatchEvent(new Event(AssetLibrary.const_655));
         if(var_543)
         {
            var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,libraryLoadedHandler);
            var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler);
            if(!var_17.hasEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE))
            {
               var_17.dispose();
            }
            var_17 = null;
            var_376 = null;
         }
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function loadAssetFromFile(param1:String, param2:URLRequest, param3:String = null) : AssetLoaderStruct
      {
         var _loc5_:* = null;
         if(getAssetByName(param1) != null)
         {
            throw new Error("Asset with name " + param1 + " already exists!");
         }
         var _loc4_:AssetLoaderStruct = var_446[param2.url];
         if(_loc4_ != null)
         {
            if(_loc4_.assetName == param1)
            {
               return _loc4_;
            }
         }
         if(param3 == null)
         {
            _loc5_ = solveAssetTypeDeclarationFromUrl(param2.url);
            if(_loc5_ == null)
            {
               throw new Error("Couldn\'t solve asset type for file " + param2.url + "!");
            }
         }
         else
         {
            _loc5_ = getAssetTypeDeclarationByMimeType(param3,true);
            if(_loc5_ == null)
            {
               throw new Error("Asset type declaration for mime type " + param3 + "not found!");
            }
         }
         var _loc6_:IAssetLoader = new _loc5_.loaderClass(_loc5_.mimeType,param2);
         if(_loc6_ == null)
         {
            throw new Error("Invalid file loader class defined for mime type " + param3 + "!");
         }
         _loc6_.addEventListener(AssetLoaderEvent.const_29,assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_40,assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_840,assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_964,assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_973,assetLoadEventHandler);
         _loc6_.addEventListener(AssetLoaderEvent.const_967,assetLoadEventHandler);
         _loc4_ = new AssetLoaderStruct(param1,_loc6_);
         var_446[param2.url] = _loc4_;
         return _loc4_;
      }
      
      public function registerAssetTypeDeclaration(param1:AssetTypeDeclaration, param2:Boolean = true) : Boolean
      {
         if(param2)
         {
            if(_sharedListOfTypesByMime.hasOwnProperty(param1.mimeType))
            {
               throw new Error("Asset type " + param1.mimeType + " already registered!");
            }
            _sharedListOfTypesByMime[param1.mimeType] = param1;
         }
         else
         {
            if(var_447.hasOwnProperty(param1.mimeType))
            {
               throw new Error("Asset type " + param1.mimeType + " already registered!");
            }
            var_447[param1.mimeType] = param1;
         }
         return true;
      }
      
      public function get nameArray() : Array
      {
         return var_375;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            unload();
            super.dispose();
            var_1136.splice(var_1136.indexOf(this),1);
            --var_648;
            var_446 = null;
            var_785 = null;
            var_144 = null;
            var_375 = null;
            var_542 = null;
            var_214 = 0;
            var_331 = false;
            _name = null;
         }
      }
      
      public function get isReady() : Boolean
      {
         return var_331;
      }
      
      public function getAssetByIndex(param1:uint) : IAsset
      {
         return param1 < var_375.length ? getAssetByName(var_375[param1]) : null;
      }
      
      public function get manifest() : XML
      {
         return var_542;
      }
      
      public function get numAssets() : uint
      {
         return var_214;
      }
      
      public function setAsset(param1:String, param2:IAsset, param3:Boolean = true) : Boolean
      {
         var _loc4_:Boolean = true;
         if((param3 || _loc4_) && param2)
         {
            if(_loc4_)
            {
               ++var_214;
               var_375.push(param1);
            }
            var_144[param1] = param2;
            return true;
         }
         return false;
      }
      
      private function loadErrorHandler(param1:Event) : void
      {
         var_331 = false;
         Logger.log("Cannot load the specified file:" + _file);
         dispatchEvent(new Event(AssetLibrary.const_1418));
         var_17 = null;
      }
      
      public function getAssetIndex(param1:IAsset) : int
      {
         var _loc2_:* = null;
         for(_loc2_ in var_144)
         {
            if(var_144[_loc2_] == param1)
            {
               return var_375.indexOf(_loc2_);
            }
         }
         return -1;
      }
      
      public function getAssetTypeDeclarationByClass(param1:Class, param2:Boolean = true) : AssetTypeDeclaration
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2)
         {
            for(_loc4_ in _sharedListOfTypesByMime)
            {
               _loc3_ = AssetTypeDeclaration(_sharedListOfTypesByMime[_loc4_]);
               if(_loc3_ != null)
               {
                  if(_loc3_.assetClass == param1)
                  {
                     return _loc3_;
                  }
               }
            }
         }
         for(_loc4_ in var_447)
         {
            _loc3_ = AssetTypeDeclaration(var_447[_loc4_]);
            if(_loc3_ != null)
            {
               if(_loc3_.assetClass == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function getClass(param1:String) : Class
      {
         var _loc2_:Class = var_785[param1];
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         if(var_17 != null)
         {
            if(var_17.hasDefinition(param1))
            {
               _loc2_ = var_17.getDefinition(param1) as Class;
               if(_loc2_ != null)
               {
                  var_785[param1] = _loc2_;
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      private function solveAssetTypeDeclarationFromUrl(param1:String) : AssetTypeDeclaration
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > 0)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ == -1)
         {
            return null;
         }
         param1 = param1.slice(_loc2_ + 1,param1.length);
         for(_loc5_ in var_447)
         {
            _loc3_ = var_447[_loc5_];
            _loc4_ = _loc3_.fileTypes;
            if(_loc4_ != null)
            {
               if(_loc4_.indexOf(param1,0) > -1)
               {
                  return _loc3_;
               }
            }
         }
         for(_loc5_ in _sharedListOfTypesByMime)
         {
            _loc3_ = _sharedListOfTypesByMime[_loc5_];
            _loc4_ = _loc3_.fileTypes;
            if(_loc4_ != null)
            {
               if(_loc4_.indexOf(param1,0) > -1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function loadFromFile(param1:LibraryLoader, param2:Boolean = true) : void
      {
         if(param1 is ZipLoader)
         {
            loadFromArchive(param1 as ZipLoader,param2);
            return;
         }
         if(_file == param1.url && var_331)
         {
            if(!var_543 && param2)
            {
               AssetLibrary.fetchLibraryContents(this,var_542,var_376);
            }
            var_543 = param2;
            dispatchEvent(new Event(AssetLibrary.const_655));
         }
         else
         {
            if(var_17 == null)
            {
               var_17 = param1;
               var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,libraryLoadedHandler);
               var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler);
            }
            var_543 = param2;
            _file = var_17.url;
         }
      }
      
      private function fetchAssetFromResource(param1:String) : IAsset
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(!var_376)
         {
            return null;
         }
         var _loc2_:XMLList = var_542.child("library");
         if(_loc2_ == null)
         {
            throw new Error("Provided manifest doesn\'t contain library node!");
         }
         if(_loc2_.length() == 0)
         {
            return null;
         }
         _loc2_ = _loc2_[0].assets;
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.child("asset");
            _loc5_ = null;
            _loc6_ = 0;
            while(_loc6_ < _loc2_.length())
            {
               _loc3_ = _loc2_[_loc6_];
               if(_loc3_.attribute("name") == param1)
               {
                  _loc4_ = getAssetTypeDeclarationByMimeType(_loc3_.attribute("mimeType"));
                  if(_loc4_ == null)
                  {
                     throw new Error("Failed to extract asset " + param1 + " from Library " + _file + "!");
                  }
                  _loc5_ = new _loc4_.assetClass(_loc4_) as IAsset;
                  _loc5_.setUnknownContent(var_376[param1]);
                  if(_loc3_.child("param").length())
                  {
                     _loc5_.setParamsDesc(_loc3_.child("param"));
                  }
                  setAsset(param1,_loc5_);
                  return _loc5_;
               }
               _loc6_++;
            }
         }
         return null;
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         var _loc2_:IAsset = var_144[param1];
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         if(var_543)
         {
            return null;
         }
         return fetchAssetFromResource(param1);
      }
      
      private function onLoadProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      public function loadFromResource(param1:XML, param2:Class) : Boolean
      {
         return AssetLibrary.fetchLibraryContents(this,param1,param2);
      }
      
      private function assetLoadEventHandler(param1:AssetLoaderEvent) : void
      {
         var loader:IAssetLoader = null;
         var type:String = null;
         var decl:AssetTypeDeclaration = null;
         var asset:IAsset = null;
         var e:AssetLoaderEvent = param1;
         var remove:Boolean = false;
         loader = e.target as IAssetLoader;
         if(loader == null)
         {
            throw new Error("Failed to downcast object to asset loader!");
         }
         var struct:AssetLoaderStruct = var_446[loader.url];
         if(struct == null)
         {
            throw new Error("Asset loader structure was lost!");
         }
         switch(e.type)
         {
            case AssetLoaderEvent.const_29:
               type = loader.mimeType;
               decl = getAssetTypeDeclarationByMimeType(type);
               remove = true;
               if(decl != null)
               {
                  asset = new decl.assetClass(decl,loader.url);
                  try
                  {
                     asset.setUnknownContent(loader.content);
                  }
                  catch(error:Error)
                  {
                     asset.dispose();
                     e = new AssetLoaderEvent(AssetLoaderEvent.const_40,e.status);
                     break;
                  }
                  if(true)
                  {
                     ++var_214;
                     var_375.push(struct.assetName);
                  }
                  var_144[struct.assetName] = asset;
               }
               else
               {
                  e = new AssetLoaderEvent(AssetLoaderEvent.const_40,e.status);
               }
               break;
            case AssetLoaderEvent.const_40:
               remove = true;
         }
         struct.dispatchEvent(new AssetLoaderEvent(e.type,e.status));
         if(remove)
         {
            if(loader)
            {
               delete var_446[loader.url];
            }
            if(struct)
            {
               struct.dispose();
            }
         }
      }
      
      public function createAsset(param1:String, param2:AssetTypeDeclaration) : IAsset
      {
         if(hasAsset(param1) || !param2)
         {
            return null;
         }
         var _loc3_:* = new param2.assetClass(param2);
         if(!setAsset(param1,_loc3_))
         {
            _loc3_.dispose();
            _loc3_ = null;
         }
         return _loc3_;
      }
      
      public function removeAsset(param1:IAsset) : IAsset
      {
         var _loc2_:* = null;
         if(param1)
         {
            for(_loc2_ in var_144)
            {
               if(var_144[_loc2_] == param1)
               {
                  var_375.splice(var_375.indexOf(_loc2_),1);
                  delete var_144[_loc2_];
                  --var_214;
                  return param1;
               }
            }
         }
         return null;
      }
      
      public function loadFromArchive(param1:ZipLoader, param2:Boolean = true) : LibraryLoader
      {
         if(!(_file == param1.url && var_331))
         {
            if(var_17)
            {
               var_17.dispose();
               var_17 = null;
            }
            var_17 = param1;
            var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,archiveLoadedHandler);
            var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler);
            var_17.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
            var_543 = true;
            _file = param1.url;
         }
         return var_17;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + _name;
      }
      
      public function get url() : String
      {
         return _file;
      }
      
      public function getAssetTypeDeclarationByMimeType(param1:String, param2:Boolean = true) : AssetTypeDeclaration
      {
         var _loc3_:* = null;
         if(param2)
         {
            _loc3_ = AssetTypeDeclaration(_sharedListOfTypesByMime[param1]);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         _loc3_ = AssetTypeDeclaration(var_447[param1]);
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return null;
      }
      
      private function archiveLoadedHandler(param1:LibraryLoaderEvent) : void
      {
         var cls:Class = null;
         var xmlClass:Class = null;
         var bytes:ByteArray = null;
         var xml:XML = null;
         var event:LibraryLoaderEvent = param1;
         var loader:ZipLoader = event.target as ZipLoader;
         var array:Array = loader.resources;
         for each(cls in array)
         {
            try
            {
               xmlClass = cls.manifest as Class;
               if(xmlClass)
               {
                  bytes = new xmlClass() as ByteArray;
                  xml = new XML(bytes.readUTFBytes(bytes.length));
                  AssetLibrary.fetchLibraryContents(this,xml,cls);
               }
            }
            catch(error:Error)
            {
               Logger.log("Failed to extract library from zip archive!");
               continue;
            }
         }
         var_331 = true;
         dispatchEvent(new Event(AssetLibrary.const_487));
         dispatchEvent(new Event(AssetLibrary.const_655));
         var_376 = null;
         var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,archiveLoadedHandler);
         var_17.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler);
         if(!var_17.hasEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE))
         {
            var_17.dispose();
         }
         var_17 = null;
      }
      
      public function hasAsset(param1:String) : Boolean
      {
         return var_376 != null ? false : false;
      }
   }
}
