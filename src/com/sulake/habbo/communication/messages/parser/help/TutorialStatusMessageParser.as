package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1159:Boolean;
      
      private var var_1160:Boolean;
      
      private var var_1161:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1159;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1160;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1161 = param1.readBoolean();
         var_1160 = param1.readBoolean();
         var_1159 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1161;
      }
      
      public function flush() : Boolean
      {
         var_1161 = false;
         var_1160 = false;
         var_1159 = false;
         return true;
      }
   }
}
