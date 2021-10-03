package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.UserDefinedRoomEventsMessageParser;
   
   public class UserDefinedRoomEventsEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function UserDefinedRoomEventsEvent(param1:Function)
      {
         super(param1,UserDefinedRoomEventsMessageParser);
      }
      
      public function getParser() : UserDefinedRoomEventsMessageParser
      {
         return this.var_10 as UserDefinedRoomEventsMessageParser;
      }
   }
}
