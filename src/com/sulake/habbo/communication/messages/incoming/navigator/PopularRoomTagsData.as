package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PopularRoomTagsData implements IDisposable, MsgWithRequestId
   {
       
      
      private var _disposed:Boolean;
      
      private var var_693:Array;
      
      public function PopularRoomTagsData(param1:IMessageDataWrapper)
      {
         var_693 = new Array();
         super();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_693.push(new PopularTagData(param1));
            _loc3_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_693 = null;
      }
      
      public function get tags() : Array
      {
         return var_693;
      }
   }
}
