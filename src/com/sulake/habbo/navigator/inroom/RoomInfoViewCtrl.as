package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetEventsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.navigator.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_732:IWindowContainer;
      
      private var var_1065:ITextWindow;
      
      private var var_178:RoomSettingsCtrl;
      
      private var var_1288:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_203:Timer;
      
      private var var_1875:IWindowContainer;
      
      private var var_1284:ITextWindow;
      
      private var var_358:IWindowContainer;
      
      private var var_1874:ITextWindow;
      
      private var var_867:IWindowContainer;
      
      private var var_204:UserDefinedRoomEventsCtrl;
      
      private var var_1545:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_802:ITextWindow;
      
      private var var_1544:IWindowContainer;
      
      private var var_1290:IWindowContainer;
      
      private var var_868:ITextWindow;
      
      private var var_1066:ITextFieldWindow;
      
      private var var_269:IWindowContainer;
      
      private var var_866:ITextWindow;
      
      private var var_1547:IButtonWindow;
      
      private var var_1067:ITextWindow;
      
      private var var_2451:int;
      
      private var var_1285:IContainerButtonWindow;
      
      private var var_869:IWindowContainer;
      
      private var var_1287:ITextWindow;
      
      private var var_1289:IContainerButtonWindow;
      
      private var var_1543:ITextWindow;
      
      private var var_901:TagRenderer;
      
      private var var_1546:IButtonWindow;
      
      private var var_1876:ITextWindow;
      
      private var var_313:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_731:ITextWindow;
      
      private var var_234:RoomThumbnailCtrl;
      
      private var var_1286:IContainerButtonWindow;
      
      private var var_1873:IWindowContainer;
      
      private var var_270:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_313 = new RoomEventViewCtrl(_navigator);
         var_178 = new RoomSettingsCtrl(_navigator,this,true);
         var_234 = new RoomThumbnailCtrl(_navigator);
         var_204 = new UserDefinedRoomEventsCtrl(_navigator);
         var_901 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_178);
         var_203 = new Timer(6000,1);
         var_203.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_178.active = true;
         this.var_313.active = false;
         this.var_234.active = false;
         this.var_204.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1545.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1546.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1544.visible = Util.hasVisibleChildren(var_1544);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_802.text = param1.roomName;
         var_802.height = NaN;
         _ownerName.text = param1.ownerName;
         var_868.text = param1.description;
         var_901.refreshTags(var_358,param1.tags);
         var_868.visible = false;
         if(param1.description != "")
         {
            var_868.height = NaN;
            var_868.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_358,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_358,"thumb_down",_loc3_,onThumbDown,0);
         var_1874.visible = _loc3_;
         var_866.visible = !_loc3_;
         var_1543.visible = !_loc3_;
         var_1543.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_358,"home",param2,null,0);
         _navigator.refreshButton(var_358,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_358,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_802.y,0);
         var_358.visible = true;
         var_358.height = Util.getLowestPoint(var_358);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function startUserDefinedRoomEventsEdit() : void
      {
         this.var_203.reset();
         this.var_178.active = false;
         this.var_313.active = false;
         this.var_234.active = false;
         this.var_204.active = true;
         _navigator.send(new GetEventsMessageComposer());
      }
      
      public function dispose() : void
      {
         if(var_203)
         {
            var_203.removeEventListener(TimerEvent.TIMER,hideInfo);
            var_203.reset();
            var_203 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_404,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false || false)
         {
            return;
         }
         var_1547.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1288.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1286.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1285.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1289.visible = _navigator.data.canEditRoomSettings && param1;
         var_1290.visible = Util.hasVisibleChildren(var_1290);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_203.reset();
         this.var_313.active = false;
         this.var_178.active = false;
         this.var_234.active = false;
         this.var_204.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_203.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_203.reset();
         this.var_313.active = false;
         this.var_178.active = false;
         this.var_234.active = false;
         this.var_204.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_404,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_269);
         var_269.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == _navigator.data.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_178.refresh(var_269);
         this.var_234.refresh(var_269);
         this.var_204.refresh(var_269);
         Util.moveChildrenToColumn(var_269,["room_details","room_buttons"],0,2);
         var_269.height = Util.getLowestPoint(var_269);
         var_269.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1066.setSelection(0,var_1066.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_270);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_313.refresh(var_270);
         if(Util.hasVisibleChildren(var_270) && !(this.var_234.active || this.var_204.active))
         {
            Util.moveChildrenToColumn(var_270,["event_details","event_buttons"],0,2);
            var_270.height = Util.getLowestPoint(var_270);
            var_270.visible = true;
         }
         else
         {
            var_270.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_203.reset();
         this.var_313.active = true;
         this.var_178.active = false;
         this.var_234.active = false;
         this.var_204.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_203.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_1065.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1065.height = NaN;
         var_1284.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1284.height = NaN;
         Util.moveChildrenToColumn(var_732,["public_space_name","public_space_desc"],var_1065.y,0);
         var_732.visible = true;
         var_732.height = Math.max(86,Util.getLowestPoint(var_732));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_204;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "KickUserMessageComposer";
         if(_loc1_ && true && true && true && true)
         {
            var_869.visible = true;
            var_1066.text = this.getEmbedData();
         }
         else
         {
            var_869.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_203.reset();
         this.var_178.load(param1);
         this.var_178.active = true;
         this.var_313.active = false;
         this.var_234.active = false;
         this.var_204.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_203.reset();
         this.var_178.active = false;
         this.var_313.active = false;
         this.var_234.active = true;
         this.var_204.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_70,false);
         _window.setParamFlag(HabboWindowParam.const_1306,true);
         _window.visible = false;
         var_269 = IWindowContainer(find("room_info"));
         var_358 = IWindowContainer(find("room_details"));
         var_732 = IWindowContainer(find("public_space_details"));
         var_1873 = IWindowContainer(find("owner_name_cont"));
         var_1875 = IWindowContainer(find("rating_cont"));
         var_1290 = IWindowContainer(find("room_buttons"));
         var_802 = ITextWindow(find("room_name"));
         var_1065 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_868 = ITextWindow(find("room_desc"));
         var_1284 = ITextWindow(find("public_space_desc"));
         var_1067 = ITextWindow(find("owner_caption"));
         var_866 = ITextWindow(find("rating_caption"));
         var_1874 = ITextWindow(find("rate_caption"));
         var_1543 = ITextWindow(find("rating_txt"));
         var_270 = IWindowContainer(find("event_info"));
         var_867 = IWindowContainer(find("event_details"));
         var_1544 = IWindowContainer(find("event_buttons"));
         var_1876 = ITextWindow(find("event_name"));
         var_731 = ITextWindow(find("event_desc"));
         var_1288 = IContainerButtonWindow(find("add_favourite_button"));
         var_1286 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1285 = IContainerButtonWindow(find("make_home_button"));
         var_1289 = IContainerButtonWindow(find("unmake_home_button"));
         var_1547 = IButtonWindow(find("room_settings_button"));
         var_1545 = IButtonWindow(find("create_event_button"));
         var_1546 = IButtonWindow(find("edit_event_button"));
         var_869 = IWindowContainer(find("embed_info"));
         var_1287 = ITextWindow(find("embed_info_txt"));
         var_1066 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1288,onAddFavouriteClick);
         Util.setProcDirectly(var_1286,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1547,onRoomSettingsClick);
         Util.setProcDirectly(var_1285,onMakeHomeClick);
         Util.setProcDirectly(var_1289,onUnmakeHomeClick);
         Util.setProcDirectly(var_1545,onEventSettingsClick);
         Util.setProcDirectly(var_1546,onEventSettingsClick);
         Util.setProcDirectly(var_1066,onEmbedSrcClick);
         _navigator.refreshButton(var_1288,"favourite",true,null,0);
         _navigator.refreshButton(var_1286,"favourite",true,null,0);
         _navigator.refreshButton(var_1285,"home",true,null,0);
         _navigator.refreshButton(var_1289,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_269,onHover);
         Util.setProcDirectly(var_270,onHover);
         var_1067.width = var_1067.textWidth;
         Util.moveChildrenToRow(var_1873,["owner_caption","owner_name"],var_1067.x,var_1067.y,3);
         var_866.width = var_866.textWidth;
         Util.moveChildrenToRow(var_1875,["rating_caption","rating_txt"],var_866.x,var_866.y,3);
         var_1287.height = NaN;
         Util.moveChildrenToColumn(var_869,["embed_info_txt","embed_src_txt"],var_1287.y,2);
         var_869.height = Util.getLowestPoint(var_869) + 5;
         var_2451 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1876.text = param1.eventName;
         var_731.text = param1.eventDescription;
         var_901.refreshTags(var_867,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_731.visible = false;
         if(param1.eventDescription != "")
         {
            var_731.height = NaN;
            var_731.y = Util.getLowestPoint(var_867) + 2;
            var_731.visible = true;
         }
         var_867.visible = true;
         var_867.height = Util.getLowestPoint(var_867);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_939,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
