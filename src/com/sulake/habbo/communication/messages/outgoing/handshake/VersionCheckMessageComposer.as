package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2274:String;
      
      private var var_1377:String;
      
      private var var_2273:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2273 = param1;
         var_1377 = param2;
         var_2274 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2273,var_1377,var_2274];
      }
      
      public function dispose() : void
      {
      }
   }
}
