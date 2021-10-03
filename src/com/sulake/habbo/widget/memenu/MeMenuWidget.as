package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_528:String = "me_menu_sound_settings";
      
      public static const const_684:String = "me_menu_settings_view";
      
      public static const const_105:String = "me_menu_top_view";
      
      public static const const_1255:String = "me_menu_rooms_view";
      
      public static const const_866:String = "me_menu_dance_moves_view";
      
      public static const const_265:String = "me_menu_my_clothes_view";
      
      public static const const_585:String = "me_menu_effects_view";
       
      
      private var var_1867:Boolean = false;
      
      private var var_407:Boolean = false;
      
      private var var_1541:int = 0;
      
      private var var_68:IEventDispatcher;
      
      private var var_1542:int = 0;
      
      private var var_1868:int = 0;
      
      private var var_1866:Boolean = false;
      
      private var var_268:Boolean = false;
      
      private var var_1865:int = 0;
      
      private var var_1864:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_607:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1283:int = 0;
      
      private var var_1869:Boolean = false;
      
      private var var_1064:Point;
      
      private var var_35:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1064 = new Point(0,0);
         var_68 = param4;
         if(param5 != null && false)
         {
            var_1869 = param5.getKey("client.news.embed.enabled","false") == "KickUserMessageComposer";
         }
         changeView(const_105);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_697,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_534,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_769,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_603,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_353,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_732,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_626,onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_214,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_242,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_614,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_198,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_308,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_106,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_375,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_156,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_35 != null && var_35.window.name == const_265)
         {
            changeView(const_105);
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!var_407)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_607;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_268)
         {
            return;
         }
         if(var_35.window.name == const_528)
         {
            (var_35 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1283 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1542 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1542.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_268 && var_35.window.name == const_265))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_568);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_697,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_534,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_769,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_603,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_353,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_214,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_242,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_614,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_732,onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_626,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_198,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_308,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_375,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_106,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_156,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         var_68 = null;
         if(var_35 != null)
         {
            var_35.dispose();
            var_35 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1867;
      }
      
      public function get creditBalance() : int
      {
         return var_1542;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1864 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_375:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_268 + " view: " + var_35.window.name);
               if(var_268 != true || var_35.window.name != const_105)
               {
                  return;
               }
               (var_35 as MeMenuMainView).setIconAssets("clothes_icon",const_105,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_106:
               hide();
         }
      }
      
      public function get isDancing() : Boolean
      {
         return var_1866;
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1864 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1868;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_607 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_607 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != var_1283;
         var_1283 = param1.daysLeft;
         var_1868 = param1.periodsLeft;
         var_1865 = param1.pastPeriods;
         var_1867 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != var_1541);
         var_1541 = param1.clubLevel;
         if(_loc2_)
         {
            if(var_35 != null)
            {
               changeView(var_35.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1866 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_35 != null && var_35.window.name != const_265)
         {
            hide();
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1317,HabboWindowStyle.const_1042,HabboWindowParam.const_35,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_607 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_607 = true;
            }
         }
         if(var_35 != null && var_35.window.name == const_585)
         {
            (var_35 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1865;
      }
      
      public function get habboClubDays() : int
      {
         return var_1283;
      }
      
      public function updateSize() : void
      {
         if(var_35 != null)
         {
            var_1064.x = var_35.window.width + 10;
            var_1064.y = var_35.window.height;
            var_35.window.x = 5;
            var_35.window.y = 0;
            _mainContainer.width = var_1064.x;
            _mainContainer.height = var_1064.y;
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_268 = !var_268;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_268 = false;
               break;
            default:
               return;
         }
         if(var_268)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_764);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_35 != null)
         {
            _mainContainer.removeChild(var_35.window);
            var_35.dispose();
            var_35 = null;
         }
         var_268 = false;
         var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_35 != null && var_35.window.name == const_265)
         {
            changeView(const_105);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1869;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_105:
               _loc2_ = new MeMenuMainView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_585:
               _loc2_ = new MeMenuEffectsView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_866:
               _loc2_ = new MeMenuDanceView();
               var_68.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_265:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1255:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_684:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_528:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_35 != null)
            {
               _mainContainer.removeChild(var_35.window);
               var_35.dispose();
               var_35 = null;
            }
            var_35 = _loc2_;
            var_35.init(this,param1);
         }
         updateSize();
      }
      
      public function get habboClubLevel() : int
      {
         return var_1541;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_105);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_640);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_268 = true;
      }
   }
}
