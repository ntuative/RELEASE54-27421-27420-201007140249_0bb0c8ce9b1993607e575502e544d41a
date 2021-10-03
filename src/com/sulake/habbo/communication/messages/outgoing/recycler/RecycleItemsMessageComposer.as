package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_858:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_858 = new Array();
         var_858.push(param1.length);
         var_858 = var_858.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_858;
      }
   }
}
