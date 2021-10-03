package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class AddActionMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_34:Array;
      
      public function AddActionMessageComposer(param1:int, param2:int, param3:int, param4:String, param5:String)
      {
         var_34 = new Array();
         super();
         var_34.push(param1);
         var_34.push(param2);
         var_34.push(param3);
         var_34.push(param4);
         var_34.push(param5);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_34;
      }
      
      public function dispose() : void
      {
         this.var_34 = null;
      }
   }
}
