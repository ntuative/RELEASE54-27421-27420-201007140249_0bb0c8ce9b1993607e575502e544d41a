package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   import flash.events.Event;
   
   public class RoomObjectRoomAdEvent extends RoomObjectEvent
   {
      
      public static const const_301:String = "RORAE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_395:String = "RORAE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_317:String = "RORAE_ROOM_AD_TOOLTIP_HIDE";
      
      public static const const_256:String = "RORAE_ROOM_AD_FURNI_CLICK";
       
      
      private var var_1658:String = "";
      
      public function RoomObjectRoomAdEvent(param1:String, param2:int, param3:String, param4:String = "", param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param2,param3,param5,param6);
         var_1658 = param4;
      }
      
      override public function clone() : Event
      {
         return new RoomObjectRoomAdEvent(type,objectId,objectType,clickUrl,bubbles,cancelable);
      }
      
      public function get clickUrl() : String
      {
         return var_1658;
      }
   }
}
