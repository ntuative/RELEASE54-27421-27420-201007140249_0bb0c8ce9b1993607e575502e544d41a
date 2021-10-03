package
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.ICore;
   import com.sulake.core.runtime.events.LibraryProgressEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   
   public class HabboMain extends Sprite
   {
      
      private static const const_771:Number = 0.71;
       
      
      private var var_1210:Boolean = false;
      
      private var var_1:DisplayObjectContainer;
      
      private var var_1211:HabboTracking;
      
      private var var_30:ICore;
      
      public function HabboMain(param1:DisplayObjectContainer)
      {
         super();
         var_1 = param1;
         var_1.addEventListener(Event.COMPLETE,onCompleteEvent);
         var_1.addEventListener(ProgressEvent.PROGRESS,onProgressEvent);
         addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         addEventListener(Event.ENTER_FRAME,onEnterFrame);
         Logger.log("Core version: undefined");
      }
      
      private function updateLoadingBar(param1:DisplayObjectContainer, param2:Number) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc7_:Sprite = param1.getChildByName(Habbo.const_2) as Sprite;
         var _loc8_:Sprite = _loc7_.getChildByName(Habbo.const_7) as Sprite;
         var _loc11_:int = var_30.getNumberOfFilesPending() + var_30.getNumberOfFilesLoaded();
         var _loc12_:Number = 1 - const_771 + var_30.getNumberOfFilesLoaded() / _loc11_ * const_771;
         _loc8_.x = 1 + 1;
         _loc8_.y = 1 + 1;
         _loc8_.graphics.clear();
         _loc9_ = 16;
         _loc10_ = 196 * _loc12_;
         _loc8_.graphics.beginFill(12241619);
         _loc8_.graphics.drawRect(0,0,_loc10_,_loc9_ / 2);
         _loc8_.graphics.endFill();
         _loc8_.graphics.beginFill(9216429);
         _loc8_.graphics.drawRect(0,_loc9_ / 2,_loc10_,_loc9_ / 2 + 1);
         _loc8_.graphics.endFill();
      }
      
      public function unloading() : void
      {
         if(var_30 && true)
         {
            var_30.events.dispatchEvent(new Event(Event.UNLOAD));
         }
      }
      
      private function prepareCore() : void
      {
         Habbo.trackLoginStep(Habbo.const_21);
         var_30 = Core.instantiate(stage,0);
         var_30.events.addEventListener(Component.COMPONENT_EVENT_ERROR,onCoreError);
         var_30.prepareComponent(CoreCommunicationFrameworkLib);
         var_30.prepareComponent(HabboRoomObjectLogicLib);
         var_30.prepareComponent(HabboRoomObjectVisualizationLib);
         var_30.prepareComponent(RoomManagerLib);
         var_30.prepareComponent(RoomSpriteRendererLib);
         var_30.prepareComponent(HabboRoomSessionManagerLib);
         var_30.prepareComponent(HabboAvatarRenderLib);
         var_30.prepareComponent(HabboRoomWidgetLib);
         var_30.prepareComponent(HabboSessionDataManagerLib);
         var_30.prepareComponent(HabboTrackingLib);
         var_30.prepareComponent(HabboConfigurationCom);
         var_30.prepareComponent(HabboLocalizationCom);
         var_30.prepareComponent(HabboWindowManagerCom);
         var_30.prepareComponent(HabboCommunicationCom);
         var_30.prepareComponent(HabboCommunicationDemoCom);
         var_30.prepareComponent(HabboNavigatorCom);
         var_30.prepareComponent(HabboFriendListCom);
         var_30.prepareComponent(HabboMessengerCom);
         var_30.prepareComponent(HabboInventoryCom);
         var_30.prepareComponent(HabboToolbarCom);
         var_30.prepareComponent(HabboCatalogCom);
         var_30.prepareComponent(HabboRoomEngineCom);
         var_30.prepareComponent(HabboRoomUICom);
         var_30.prepareComponent(HabboAvatarEditorCom);
         var_30.prepareComponent(HabboNotificationsCom);
         var_30.prepareComponent(HabboHelpCom);
         var_30.prepareComponent(HabboAdManagerCom);
         var_30.prepareComponent(HabboModerationCom);
         Logger.log("Trying to embed Flash 9 version");
         var_30.prepareComponent(HabboSoundManagerCom);
         var_1211 = HabboTracking.getInstance();
         var _loc1_:AssetLoaderStruct = var_30.assets.loadAssetFromFile("config.xml",new URLRequest("config_habbo.xml"));
         if(_loc1_.assetLoader.ready)
         {
            setupCoreConfigFromLoader(_loc1_);
         }
         else
         {
            _loc1_.addEventListener(AssetLoaderEvent.const_29,configLoadedHandler);
            _loc1_.addEventListener(AssetLoaderEvent.const_40,configLoadedHandler);
         }
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_29,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_40,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_29)
         {
            setupCoreConfigFromLoader(_loc2_);
         }
         else
         {
            Habbo.reportCrash("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",Core.const_167,null);
         }
      }
      
      private function onProgressEvent(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_1)
         {
            _loc2_ = param1.bytesLoaded / param1.bytesTotal;
            updateLoadingBar(var_1,_loc2_);
            _loc3_ = var_1.getChildByName("background") as Sprite;
            if(_loc3_)
            {
               _loc3_.alpha = Math.min(1 - _loc2_,_loc3_.alpha);
            }
            if(param1 is LibraryProgressEvent)
            {
               _loc4_ = param1 as LibraryProgressEvent;
               if(_loc4_.fileName == "hh_human_fx.swf" || _loc4_.fileName == "hh_human_body.swf")
               {
                  if(var_1211 && true)
                  {
                     var_1211.track("libraryLoaded",_loc4_.fileName,_loc4_.elapsedTime);
                  }
               }
            }
         }
      }
      
      private function initializeCore() : void
      {
         try
         {
            var_30.initialize();
            if(false)
            {
               ExternalInterface.addCallback("unloading",unloading);
            }
         }
         catch(error:Error)
         {
            Habbo.trackLoginStep(Habbo.const_23);
            Core.crash("Failed to initialize the core: " + error.message,Core.const_949,error);
         }
      }
      
      protected function onAddedToStage(param1:Event = null) : void
      {
         var event:Event = param1;
         try
         {
            prepareCore();
         }
         catch(error:Error)
         {
            Habbo.trackLoginStep(Habbo.const_23);
            Habbo.reportCrash("Failed to prepare the core: " + error.message,Core.const_949,error);
            Core.dispose();
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:* = null;
         if(var_1)
         {
            _loc2_ = var_1.getChildByName("background") as Sprite;
            if(_loc2_)
            {
               _loc2_.alpha -= 0.01;
               if(_loc2_.alpha <= 0)
               {
               }
            }
            if(var_1210)
            {
               if(true)
               {
                  dispose();
                  var_1210 = false;
               }
               else
               {
                  var_1.alpha = -0.1;
               }
            }
         }
      }
      
      public function onCoreError(param1:Event) : void
      {
         Habbo.trackLoginStep(Habbo.const_23);
      }
      
      private function onCompleteEvent(param1:Event) : void
      {
         updateLoadingBar(var_1,1);
         initializeCore();
         var_1210 = true;
      }
      
      private function setupCoreConfigFromLoader(param1:AssetLoaderStruct) : void
      {
         var _loc2_:XmlAsset = var_30.assets.getAssetByName(param1.assetName) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            Habbo.reportCrash("Download external configuration document is null!",Core.const_167,null);
         }
         if(var_30)
         {
            var_30.readConfigDocument(XML(_loc2_.content),var_1);
         }
         else
         {
            Habbo.reportCrash("Core vanished while downloading config document!",Core.const_167,null);
         }
      }
      
      private function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         if(var_1)
         {
            var_1.removeEventListener(Event.COMPLETE,onCompleteEvent);
            var_1.removeEventListener(ProgressEvent.PROGRESS,onProgressEvent);
            var_1 = null;
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}
