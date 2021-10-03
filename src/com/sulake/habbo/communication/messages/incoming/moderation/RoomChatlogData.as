package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_802:String;
      
      private var var_1694:Array;
      
      private var var_1693:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1694 = new Array();
         super();
         var_1693 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_802 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1694.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1693 + ", " + _roomId + ", " + var_802 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1693;
      }
      
      public function get roomName() : String
      {
         return var_802;
      }
      
      public function get chatlog() : Array
      {
         return var_1694;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
