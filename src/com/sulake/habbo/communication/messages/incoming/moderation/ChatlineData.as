package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1538:String;
      
      private var var_2289:int;
      
      private var var_2288:int;
      
      private var var_2287:int;
      
      private var var_2290:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2289 = param1.readInteger();
         var_2287 = param1.readInteger();
         var_2288 = param1.readInteger();
         var_2290 = param1.readString();
         var_1538 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1538;
      }
      
      public function get hour() : int
      {
         return var_2289;
      }
      
      public function get minute() : int
      {
         return var_2287;
      }
      
      public function get chatterName() : String
      {
         return var_2290;
      }
      
      public function get chatterId() : int
      {
         return var_2288;
      }
   }
}
