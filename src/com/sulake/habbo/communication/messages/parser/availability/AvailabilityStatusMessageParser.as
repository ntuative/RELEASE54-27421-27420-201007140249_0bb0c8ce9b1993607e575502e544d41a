package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1070:Boolean;
      
      private var var_1459:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1070 = param1.readInteger() > 0;
         var_1459 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1070;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1459;
      }
      
      public function flush() : Boolean
      {
         var_1070 = false;
         var_1459 = false;
         return true;
      }
   }
}
