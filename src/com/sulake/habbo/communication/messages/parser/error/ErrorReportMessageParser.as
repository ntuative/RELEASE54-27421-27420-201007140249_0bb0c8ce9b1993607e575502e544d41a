package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1229:int;
      
      private var var_1228:int;
      
      private var var_1227:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1229;
      }
      
      public function flush() : Boolean
      {
         var_1228 = 0;
         var_1229 = 0;
         var_1227 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1228;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1229 = param1.readInteger();
         var_1228 = param1.readInteger();
         var_1227 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1227;
      }
   }
}
