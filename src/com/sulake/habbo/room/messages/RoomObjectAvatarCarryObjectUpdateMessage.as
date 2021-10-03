package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1128:int;
      
      private var var_1375:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1128 = param1;
         var_1375 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1128;
      }
      
      public function get itemName() : String
      {
         return var_1375;
      }
   }
}
