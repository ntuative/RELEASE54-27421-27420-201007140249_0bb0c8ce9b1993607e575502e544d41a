package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2060:String;
      
      private var var_409:String;
      
      private var var_599:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_409 = param1;
         var_599 = param2;
         var_2060 = param3;
      }
      
      public function get race() : String
      {
         return var_2060;
      }
      
      public function get figure() : String
      {
         return var_409;
      }
      
      public function get gender() : String
      {
         return var_599;
      }
   }
}
