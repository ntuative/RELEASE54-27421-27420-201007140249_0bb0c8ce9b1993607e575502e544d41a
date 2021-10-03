package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class IssuePickFailedMessageParser implements IMessageParser
   {
       
      
      private var var_2012:String;
      
      private var var_2252:int;
      
      private var var_1870:int;
      
      public function IssuePickFailedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1870 = param1.readInteger();
         var_2252 = param1.readInteger();
         var_2012 = param1.readString();
         return true;
      }
      
      public function get issueId() : int
      {
         return var_1870;
      }
      
      public function get pickerUserId() : int
      {
         return var_2252;
      }
      
      public function get pickerUserName() : String
      {
         return var_2012;
      }
   }
}
