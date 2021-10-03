package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectDataUpdateMessage extends RoomObjectUpdateMessage
   {
       
      
      private var var_1502:Number = NaN;
      
      private var var_38:int;
      
      private var _data:String;
      
      public function RoomObjectDataUpdateMessage(param1:int, param2:String, param3:Number = NaN)
      {
         super(null,null);
         var_38 = param1;
         _data = param2;
         var_1502 = param3;
      }
      
      public function get extra() : Number
      {
         return var_1502;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function get data() : String
      {
         return _data;
      }
   }
}
