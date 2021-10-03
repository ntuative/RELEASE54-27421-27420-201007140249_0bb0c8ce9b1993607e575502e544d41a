package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_1243:String;
      
      private var var_1612:String;
      
      private var var_1931:int;
      
      private var var_1930:int;
      
      private var var_309:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         super();
         var_309 = param1.readInteger();
         var_1243 = param1.readString();
         var_1612 = param1.readString();
         var_1930 = param1.readInteger();
         var_1931 = param1.readInteger();
      }
      
      public function get params() : String
      {
         return var_1612;
      }
      
      public function get cooldownPeriod() : int
      {
         return var_1931;
      }
      
      public function get performCount() : int
      {
         return var_1930;
      }
      
      public function get stuffId() : int
      {
         return var_309;
      }
      
      public function get stuffName() : String
      {
         return var_1243;
      }
   }
}
