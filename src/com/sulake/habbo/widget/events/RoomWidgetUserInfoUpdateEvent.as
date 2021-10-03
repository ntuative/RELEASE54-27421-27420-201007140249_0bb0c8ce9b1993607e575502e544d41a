package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_204:String = "RWUIUE_PEER";
      
      public static const const_198:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1202:String = "BOT";
      
      public static const const_861:int = 2;
      
      public static const const_1191:int = 0;
      
      public static const const_901:int = 3;
       
      
      private var var_409:String = "";
      
      private var var_1235:String = "";
      
      private var var_2236:Boolean = false;
      
      private var var_2134:int = 0;
      
      private var var_2216:int = 0;
      
      private var var_2241:Boolean = false;
      
      private var var_1234:String = "";
      
      private var var_2235:Boolean = false;
      
      private var var_999:int = 0;
      
      private var var_2237:Boolean = true;
      
      private var var_1171:int = 0;
      
      private var var_2242:Boolean = false;
      
      private var var_1274:Boolean = false;
      
      private var var_2238:Boolean = false;
      
      private var var_2215:int = 0;
      
      private var var_2234:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_271:Array;
      
      private var var_1275:Boolean = false;
      
      private var _name:String = "";
      
      private var var_2135:int = 0;
      
      private var var_2240:Boolean = false;
      
      private var var_2239:int = 0;
      
      private var var_2214:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_271 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_2216;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_2216 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2236;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2237;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2237 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2235 = param1;
      }
      
      public function get motto() : String
      {
         return var_1235;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2242 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1274;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1235 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2240;
      }
      
      public function get groupBadgeId() : String
      {
         return var_2214;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1274 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2234;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_2215 = param1;
      }
      
      public function get badges() : Array
      {
         return var_271;
      }
      
      public function get amIController() : Boolean
      {
         return var_2241;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2241 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2240 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2239 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_2214 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1234 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2235;
      }
      
      public function set figure(param1:String) : void
      {
         var_409 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_2215;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1275;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2242;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_999 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2239;
      }
      
      public function get realName() : String
      {
         return var_1234;
      }
      
      public function get figure() : String
      {
         return var_409;
      }
      
      public function set webID(param1:int) : void
      {
         var_2135 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_271 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2238 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2234 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_999;
      }
      
      public function get webID() : int
      {
         return var_2135;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1171 = param1;
      }
      
      public function get xp() : int
      {
         return var_2134;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2236 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1171;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2238;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1275 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_2134 = param1;
      }
   }
}
