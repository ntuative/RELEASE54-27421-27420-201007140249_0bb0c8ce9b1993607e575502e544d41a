package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class StuffStatesMessageParser implements IMessageParser
   {
       
      
      private var var_1562:Array;
      
      public function StuffStatesMessageParser()
      {
         super();
      }
      
      public function get states() : Array
      {
         return var_1562;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = param1.readInteger();
         var_1562 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1562.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
