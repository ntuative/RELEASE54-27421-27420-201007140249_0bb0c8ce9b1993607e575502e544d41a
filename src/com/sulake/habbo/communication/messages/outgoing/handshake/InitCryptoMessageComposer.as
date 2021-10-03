package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class InitCryptoMessageComposer implements IMessageComposer
   {
       
      
      private var var_22:Array;
      
      public function InitCryptoMessageComposer(param1:int)
      {
         super();
         var_22 = new Array();
         var_22.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_22;
      }
   }
}
