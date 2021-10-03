package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_409:String;
      
      private var var_1757:int;
      
      private var var_2077:String;
      
      private var var_1153:int;
      
      private var var_1363:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1363;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1363 = param1.readInteger();
         var_2077 = param1.readString();
         var_1757 = param1.readInteger();
         var_409 = param1.readString();
         var_1153 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2077;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_409;
      }
      
      public function get petType() : int
      {
         return var_1153;
      }
      
      public function get level() : int
      {
         return var_1757;
      }
   }
}
