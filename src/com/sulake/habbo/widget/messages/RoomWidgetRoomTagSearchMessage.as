package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_531:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1851:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_531);
         var_1851 = param1;
      }
      
      public function get tag() : String
      {
         return var_1851;
      }
   }
}
