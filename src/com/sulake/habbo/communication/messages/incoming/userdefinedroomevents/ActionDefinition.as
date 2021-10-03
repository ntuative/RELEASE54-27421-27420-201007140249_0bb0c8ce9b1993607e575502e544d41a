package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ActionDefinition extends Triggerable
   {
       
      
      private var _type:int;
      
      public function ActionDefinition(param1:IMessageDataWrapper)
      {
         super(param1);
         _type = param1.readInteger();
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
