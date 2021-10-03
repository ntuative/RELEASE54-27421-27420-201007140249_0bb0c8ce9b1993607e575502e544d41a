package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.StuffStatesMessageParser;
   
   public class StuffStatesEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function StuffStatesEvent(param1:Function)
      {
         super(param1,StuffStatesMessageParser);
      }
      
      public function getParser() : StuffStatesMessageParser
      {
         return this.var_10 as StuffStatesMessageParser;
      }
   }
}
