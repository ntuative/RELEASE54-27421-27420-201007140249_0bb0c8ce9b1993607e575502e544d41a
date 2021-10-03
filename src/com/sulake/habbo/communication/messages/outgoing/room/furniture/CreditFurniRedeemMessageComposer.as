package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class CreditFurniRedeemMessageComposer implements IMessageComposer
   {
       
      
      private var var_167:int;
      
      public function CreditFurniRedeemMessageComposer(param1:int)
      {
         super();
         var_167 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_167];
      }
   }
}
