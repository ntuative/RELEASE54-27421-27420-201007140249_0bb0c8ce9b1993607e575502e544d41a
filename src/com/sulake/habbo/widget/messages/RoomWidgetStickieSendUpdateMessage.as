package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_510:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_736:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_734:String;
      
      private var var_167:int;
      
      private var var_218:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_167 = param2;
         var_218 = param3;
         var_734 = param4;
      }
      
      public function get objectId() : int
      {
         return var_167;
      }
      
      public function get text() : String
      {
         return var_218;
      }
      
      public function get colorHex() : String
      {
         return var_734;
      }
   }
}
