package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1989:int;
      
      private var var_1988:String;
      
      private var var_1140:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1140 = param1.readInteger();
         this.var_1988 = param1.readString();
         this.var_1989 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1140;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1989;
      }
      
      public function get requesterName() : String
      {
         return this.var_1988;
      }
   }
}
