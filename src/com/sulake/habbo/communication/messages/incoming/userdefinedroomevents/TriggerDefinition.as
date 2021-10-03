package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class TriggerDefinition extends Triggerable
   {
       
      
      private var var_199:int;
      
      public function TriggerDefinition(param1:IMessageDataWrapper)
      {
         super(param1);
         var_199 = param1.readInteger();
      }
      
      public function get triggerConf() : int
      {
         return var_199;
      }
   }
}
