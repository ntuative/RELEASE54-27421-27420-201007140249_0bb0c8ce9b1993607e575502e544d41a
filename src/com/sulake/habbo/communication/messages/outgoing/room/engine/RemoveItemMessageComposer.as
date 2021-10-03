package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RemoveItemMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_167:int;
      
      public function RemoveItemMessageComposer(param1:int, param2:int = 0, param3:int = 0)
      {
         super();
         var_167 = param1;
         _roomId = param2;
         _roomCategory = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_167];
      }
      
      public function dispose() : void
      {
      }
   }
}
