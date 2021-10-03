package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1974:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_133:TutorialUI;
      
      private var var_757:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_61:HelpUI;
      
      private var var_758:IHabboConfigurationManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_628:HotelMergeUI;
      
      private var var_323:IHabboCommunicationManager;
      
      private var var_894:FaqIndex;
      
      private var var_1975:String = "";
      
      private var var_1181:IncomingMessages;
      
      private var var_1336:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1336 = new CallForHelpData();
         var_1974 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_894 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_61 != null)
         {
            var_61.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_61 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_61.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_133 != null)
         {
            var_133.dispose();
            var_133 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1975;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_61 != null)
         {
            var_61.dispose();
            var_61 = null;
         }
         if(var_133 != null)
         {
            var_133.dispose();
            var_133 = null;
         }
         if(var_628)
         {
            var_628.dispose();
            var_628 = null;
         }
         if(var_894 != null)
         {
            var_894.dispose();
            var_894 = null;
         }
         var_1181 = null;
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_757)
         {
            var_757.release(new IIDHabboLocalizationManager());
            var_757 = null;
         }
         if(var_323)
         {
            var_323.release(new IIDHabboCommunicationManager());
            var_323 = null;
         }
         if(var_758)
         {
            var_758.release(new IIDHabboConfigurationManager());
            var_758 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_757;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_99:
               if(var_61 != null)
               {
                  var_61.setRoomSessionStatus(true);
               }
               if(var_133 != null)
               {
                  var_133.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_101:
               if(var_61 != null)
               {
                  var_61.setRoomSessionStatus(false);
               }
               if(var_133 != null)
               {
                  var_133.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_61 != null)
         {
            var_61.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_1974;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_61 != null)
         {
            var_61.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_628)
         {
            var_628 = new HotelMergeUI(this);
         }
         var_628.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_133 == null && _assetLibrary != null && _windowManager != null)
         {
            var_133 = new TutorialUI(this);
         }
         return var_133 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_61 == null && _assetLibrary != null && _windowManager != null)
         {
            var_61 = new HelpUI(this,_assetLibrary,_windowManager,var_757,_toolbar);
         }
         return var_61 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1336;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1336.reportedUserId = param1;
         var_1336.reportedUserName = param2;
         var_61.showUI(HabboHelpViewEnum.const_332);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1975 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(_toolbar != null)
         {
            _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_119,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_757 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_133 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_133.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_323 = IHabboCommunicationManager(param2);
         var_1181 = new IncomingMessages(this,var_323);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_61 != null)
         {
            var_61.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_61 != null)
         {
            var_61.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_323 != null && param1 != null)
         {
            var_323.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_894;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_61 != null)
         {
            var_61.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_758 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_133;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_86)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_57)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_628;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_99,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_101,onRoomSessionEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_86,onHabboToolbarEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_57,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_61 != null)
         {
            var_61.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_758 == null)
         {
            return param1;
         }
         return var_758.getKey(param1,param2,param3);
      }
   }
}
