package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_118:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_2106:int;
      
      private var var_451:int;
      
      private var var_739:RoomData;
      
      private var var_1763:int;
      
      private var _ownerName:String;
      
      private var var_2146:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_451 = param1.readInteger();
         var_2106 = param1.readInteger();
         var_2146 = param1.readBoolean();
         var_1763 = param1.readInteger();
         _ownerName = param1.readString();
         var_118 = new RoomData(param1);
         var_739 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_2106;
      }
      
      public function get event() : RoomData
      {
         return var_739;
      }
      
      public function get room() : RoomData
      {
         return var_118;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_118 != null)
         {
            var_118.dispose();
            var_118 = null;
         }
         if(var_739 != null)
         {
            var_739.dispose();
            var_739 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_451;
      }
      
      public function get ownerId() : int
      {
         return var_1763;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2146;
      }
   }
}
