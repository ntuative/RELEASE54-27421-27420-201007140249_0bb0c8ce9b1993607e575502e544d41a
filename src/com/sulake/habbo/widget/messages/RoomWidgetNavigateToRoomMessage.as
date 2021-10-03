package com.sulake.habbo.widget.messages
{
   public class RoomWidgetNavigateToRoomMessage extends RoomWidgetMessage
   {
      
      public static const const_1050:String = "RWGOI_MESSAGE_NAVIGATE_HOME";
      
      public static const const_1193:String = "RWGOI_MESSAGE_NAVIGATE_TO_ROOM";
       
      
      private var _roomId:int;
      
      public function RoomWidgetNavigateToRoomMessage(param1:String, param2:int = -1)
      {
         super(param1);
         _roomId = param2;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
