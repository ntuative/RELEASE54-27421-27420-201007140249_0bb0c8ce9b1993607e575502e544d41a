package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1280:int;
      
      private var var_1058:String;
      
      private var var_735:Array;
      
      private var var_1063:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_735.slice();
      }
      
      public function flush() : Boolean
      {
         var_1058 = "";
         var_1063 = [];
         var_735 = [];
         var_1280 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1280;
      }
      
      public function get question() : String
      {
         return var_1058;
      }
      
      public function get choices() : Array
      {
         return var_1063.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1058 = param1.readString();
         var_1063 = [];
         var_735 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1063.push(param1.readString());
            var_735.push(param1.readInteger());
            _loc3_++;
         }
         var_1280 = param1.readInteger();
         return true;
      }
   }
}
