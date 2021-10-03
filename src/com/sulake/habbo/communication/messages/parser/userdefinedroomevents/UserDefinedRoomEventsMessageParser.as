package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   
   public class UserDefinedRoomEventsMessageParser implements IMessageParser
   {
       
      
      private var _events:UserDefinedRoomEvents;
      
      public function UserDefinedRoomEventsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _events = new UserDefinedRoomEvents(param1);
         return true;
      }
      
      public function get events() : UserDefinedRoomEvents
      {
         return _events;
      }
      
      public function flush() : Boolean
      {
         if(_events != null)
         {
            _events.dispose();
            _events = null;
         }
         return true;
      }
   }
}
