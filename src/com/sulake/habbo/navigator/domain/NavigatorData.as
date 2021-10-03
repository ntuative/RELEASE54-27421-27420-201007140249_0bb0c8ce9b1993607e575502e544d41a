package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1487:int = 10;
       
      
      private var var_2109:Boolean;
      
      private var var_2110:int;
      
      private var var_1376:int;
      
      private var var_2118:Boolean;
      
      private var var_1131:Array;
      
      private var var_922:Dictionary;
      
      private var var_1130:Array;
      
      private var var_2474:int;
      
      private var var_2112:int;
      
      private var var_2114:UserDefinedRoomEvents;
      
      private var var_1619:int;
      
      private var var_2117:int;
      
      private var var_2116:int;
      
      private var var_641:PublicRoomShortData;
      
      private var var_440:RoomEventData;
      
      private var var_140:MsgWithRequestId;
      
      private var var_2113:Boolean;
      
      private var var_2115:Array;
      
      private var _navigator:HabboNavigator;
      
      private var var_2111:Boolean;
      
      private var var_212:GuestRoomData;
      
      private var var_779:Boolean;
      
      private var var_642:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1131 = new Array();
         var_1130 = new Array();
         var_922 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_140 != null && var_140 as PopularRoomTagsData != null;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2111;
      }
      
      public function startLoading() : void
      {
         this.var_779 = true;
      }
      
      public function get createdFlatId() : int
      {
         return var_2110;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2111 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_440 != null)
         {
            var_440.dispose();
         }
         var_440 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function get homeRoomId() : int
      {
         return var_1619;
      }
      
      public function get stuffStates() : Array
      {
         return var_2115;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_140 != null && var_140 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_140 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_212;
      }
      
      public function get allCategories() : Array
      {
         return var_1131;
      }
      
      public function onRoomExit() : void
      {
         if(var_440 != null)
         {
            var_440.dispose();
            var_440 = null;
         }
         if(var_641 != null)
         {
            var_641.dispose();
            var_641 = null;
         }
         if(var_212 != null)
         {
            var_212.dispose();
            var_212 = null;
         }
         var_642 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_140 = param1;
         var_779 = false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_212 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1619 == _loc1_;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_140 = param1;
         var_779 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_641 = null;
         var_212 = null;
         var_642 = false;
         if(param1.guestRoom)
         {
            var_642 = param1.owner;
         }
         else
         {
            var_641 = param1.publicSpace;
            var_440 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_642;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2474 = param1.limit;
         this.var_1376 = param1.favouriteRoomIds.length;
         this.var_922 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_922[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_140 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_2109;
      }
      
      public function set stuffStates(param1:Array) : void
      {
         var_2115 = param1;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_641;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_140 = param1;
         var_779 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_2116 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_212 != null && var_642;
      }
      
      public function get userDefinedRoomEvents() : UserDefinedRoomEvents
      {
         return var_2114;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2118;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1131 = param1;
         var_1130 = new Array();
         for each(_loc2_ in var_1131)
         {
            if(_loc2_.visible)
            {
               var_1130.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2112;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2117;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1130;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_140 == null)
         {
            return;
         }
         var_140.dispose();
         var_140 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_2109 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_440;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_922[param1] = !!param2 ? "yes" : null;
         var_1376 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_140 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_2116;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_140 != null && var_140 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2118 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2112 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2113 = param1;
      }
      
      public function set userDefinedRoomEvents(param1:UserDefinedRoomEvents) : void
      {
         var_2114 = param1;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_779;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_1619 = param1;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1376 >= var_2474;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_212 != null)
         {
            var_212.dispose();
         }
         var_212 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2117 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2113;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_212 != null && !var_642;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2110 = param1;
      }
   }
}
