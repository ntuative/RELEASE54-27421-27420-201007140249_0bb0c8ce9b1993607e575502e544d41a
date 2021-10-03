package com.sulake.habbo.configuration
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.TextAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.configuration.enum.HabboConfigurationFlags;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   import flash.utils.Dictionary;
   
   public class HabboConfigurationManager extends Component implements IHabboConfigurationManager
   {
      
      private static var var_1540:String = "%";
       
      
      private var var_2001:Boolean = false;
      
      private var var_525:String = "";
      
      private var var_970:Boolean = false;
      
      private var var_1590:Array;
      
      private var var_1109:Dictionary;
      
      public function HabboConfigurationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var_1590 = [];
         super(param1,param2,param3);
         var_970 = (param2 & 0) > 0;
         var_1109 = new Dictionary();
         var _loc4_:TextAsset = _assets.getAssetByName("default_configuration") as TextAsset;
         parseConfiguration(_loc4_.content.toString());
         var _loc5_:Stage = param1.displayObjectContainer.stage;
         var _loc6_:String = _loc5_.loaderInfo.url;
         var _loc7_:int = _loc6_.lastIndexOf("/");
         _loc6_ = _loc6_.substring(0,_loc7_ + 1);
         setKey("flash.client.url",_loc6_);
         for(_loc8_ in _loc5_.loaderInfo.parameters)
         {
            ErrorReportStorage.addDebugData("Parsing flashvars","Parsing flasvars");
            _loc9_ = _loc5_.loaderInfo.parameters[_loc8_];
            _loc8_ = _loc8_.replace(/[_]/g,".");
            Logger.log("Habbo Configuration: Register HTML Parameter: " + _loc8_ + " = " + _loc9_);
            setKey(_loc8_,_loc9_);
            var_1590.push(_loc8_);
         }
         ErrorReportStorage.addDebugData("Flashvars/host","Host: " + getKey("connection.info.host","not found!"));
         ErrorReportStorage.addDebugData("Flashvars/port","Port: " + getKey("connection.info.port","not found!"));
         var_525 = getKey("url_prefix");
         if(var_525 != null && false)
         {
            setKey("client.fatal.error.url",var_525 + "/flash_client_error");
         }
         if(!keyExists("external.hash"))
         {
            _loc10_ = "";
            while(_loc11_ < 40)
            {
               _loc10_ += int(Math.random() * 9).toString();
               _loc11_++;
            }
            setKey("external.hash",_loc10_);
         }
         param1.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         init();
      }
      
      private function onConfigurationError(param1:Event = null) : void
      {
         var _loc2_:AssetLoaderEvent = param1 as AssetLoaderEvent;
         var _loc3_:int = 0;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.status;
         }
         Core.error("Could not load external variables. HTTP status " + _loc3_ + ". Client startup failed!",true,Core.const_1358);
      }
      
      public function keyExists(param1:String) : Boolean
      {
         var _loc2_:String = var_1109[param1] as String;
         return _loc2_ != null;
      }
      
      private function parseConfiguration(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc2_:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/mg;
         var _loc3_:RegExp = /^\s+|\s+$/g;
         var _loc4_:Array = param1.split(_loc2_);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.substr(0,1) != "#")
            {
               _loc6_ = _loc5_.split("=");
               if(_loc6_[0].length > 0 && _loc6_[1].length > 0)
               {
                  _loc7_ = _loc6_.shift();
                  _loc8_ = _loc6_.join("=");
                  _loc7_ = _loc7_.replace(_loc3_,"");
                  _loc8_ = _loc8_.replace(_loc3_,"");
                  this.setKey(_loc7_,_loc8_);
               }
            }
         }
         if(getKey("local.environment") == "KickUserMessageComposer")
         {
            setKey("url.prefix",getKey("url.prefix.local"));
         }
         var_525 = getKey("url.prefix");
         if(false)
         {
            _loc9_ = var_525.replace("http://","");
            _loc10_ = _loc9_.indexOf(":");
            if(_loc10_ != -1)
            {
               _loc9_ = _loc9_.substring(0,_loc10_);
            }
            Logger.log("Allowing external access from domain: " + _loc9_);
            Security.allowDomain(_loc9_);
         }
      }
      
      public function setKey(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(param3)
         {
            if(true)
            {
               Logger.log(param1 + "=" + param2);
            }
         }
         if(var_1590.indexOf(param1) < 0)
         {
            var_1109[param1] = param2;
         }
      }
      
      private function onInitConfiguration(param1:Event = null) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = _loc2_.assetLoader.content as String;
         if(_loc3_ != null)
         {
            parseConfiguration(_loc3_);
         }
         Logger.log("Configuration check: " + this.getKey("connection.info.host"));
         var_970 = true;
         events.dispatchEvent(new Event(HabboConfigurationEvent.const_162));
         if(var_2001)
         {
            events.dispatchEvent(new Event(HabboConfigurationEvent.INIT));
         }
      }
      
      public function getKey(param1:String, param2:String = "", param3:Dictionary = null) : String
      {
         var _loc4_:String = var_1109[param1] as String;
         if(_loc4_ == null)
         {
            _loc4_ = param2;
         }
         if(_loc4_ != null)
         {
            if(_loc4_.indexOf("%predefined%") > -1)
            {
               _loc4_ = _loc4_.replace("%predefined%",var_525);
               _loc4_ = _loc4_.replace("http://http://","http://");
            }
         }
         if(param3 != null)
         {
            _loc4_ = this.fillParams(_loc4_,param3);
         }
         return _loc4_;
      }
      
      private function fillParams(param1:String, param2:Dictionary) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < 10)
         {
            _loc4_ = param1.indexOf(var_1540);
            if(_loc4_ < 0)
            {
               break;
            }
            _loc5_ = param1.indexOf(var_1540,_loc4_ + 1);
            if(_loc5_ < 0)
            {
               break;
            }
            _loc6_ = param1.substring(_loc4_ + 1,_loc5_);
            _loc7_ = param2[_loc6_];
            param1 = param1.replace("%" + _loc6_ + "%",_loc7_);
            _loc3_++;
         }
         return param1;
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!var_970)
         {
            _loc1_ = this.getKey("external.variables.txt","external_variables.txt");
            Logger.log("Configuration External Variables: " + _loc1_);
            _loc2_ = _loc1_;
            if(assets.hasAsset(_loc2_))
            {
               Logger.log("[HabboConfigurationManager] reload configuration for url: " + _loc1_);
            }
            _loc3_ = new URLRequest(_loc1_);
            _loc4_ = assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
            _loc4_.addEventListener(AssetLoaderEvent.const_29,onInitConfiguration);
            _loc4_.addEventListener(AssetLoaderEvent.const_40,onConfigurationError);
         }
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         var_2001 = true;
         if(var_970)
         {
            events.dispatchEvent(new Event(HabboConfigurationEvent.INIT));
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
