package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_121:int = 0;
      
      public static const const_123:int = 1;
      
      public static const const_111:int = 2;
      
      public static const const_741:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1314:int = 0;
      
      private var var_2322:String = "";
      
      private var var_218:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_218 = param2;
         var_1314 = param3;
         var_2322 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_2322;
      }
      
      public function get chatType() : int
      {
         return var_1314;
      }
      
      public function get text() : String
      {
         return var_218;
      }
   }
}
