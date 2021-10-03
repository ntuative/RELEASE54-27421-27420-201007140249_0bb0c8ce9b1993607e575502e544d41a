package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1983:int;
      
      private var var_1071:int;
      
      private var var_1984:int;
      
      private var var_1582:int;
      
      private var var_118:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1582 = param1.readInteger();
         var_1984 = param1.readInteger();
         var_1071 = param1.readInteger();
         var_1983 = param1.readInteger();
         var_118 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1582);
      }
      
      public function get chatRecordId() : int
      {
         return var_1983;
      }
      
      public function get reportedUserId() : int
      {
         return var_1071;
      }
      
      public function get callerUserId() : int
      {
         return var_1984;
      }
      
      public function get callId() : int
      {
         return var_1582;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_118;
      }
   }
}
