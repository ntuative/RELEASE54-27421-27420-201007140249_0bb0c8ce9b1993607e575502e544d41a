package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2376:String;
      
      private var var_974:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2376 = param1;
         var_974 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2376;
      }
      
      public function get parameter() : String
      {
         return var_974;
      }
   }
}
