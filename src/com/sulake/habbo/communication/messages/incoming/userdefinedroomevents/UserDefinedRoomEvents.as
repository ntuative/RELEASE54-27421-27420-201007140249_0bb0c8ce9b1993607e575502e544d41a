package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class UserDefinedRoomEvents implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var _events:Array;
      
      public function UserDefinedRoomEvents(param1:IMessageDataWrapper)
      {
         _events = new Array();
         super();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _events.push(new UserDefinedRoomEvent(param1));
            _loc3_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         for each(_loc1_ in _events)
         {
            _loc1_.dispose();
         }
         _events = null;
      }
      
      public function get events() : Array
      {
         return _events;
      }
   }
}
