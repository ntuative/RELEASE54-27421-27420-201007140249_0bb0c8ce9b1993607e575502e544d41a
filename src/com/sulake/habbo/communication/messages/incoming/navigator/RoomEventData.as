package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1876:String;
      
      private var var_451:int;
      
      private var var_2210:String;
      
      private var var_2213:String;
      
      private var var_2212:int;
      
      private var var_2211:String;
      
      private var var_2209:int;
      
      private var var_693:Array;
      
      private var var_1082:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_693 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1082 = false;
            return;
         }
         this.var_1082 = true;
         var_2212 = int(_loc2_);
         var_2210 = param1.readString();
         var_451 = int(param1.readString());
         var_2209 = param1.readInteger();
         var_1876 = param1.readString();
         var_2213 = param1.readString();
         var_2211 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_693.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2209;
      }
      
      public function get eventName() : String
      {
         return var_1876;
      }
      
      public function get eventDescription() : String
      {
         return var_2213;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2210;
      }
      
      public function get tags() : Array
      {
         return var_693;
      }
      
      public function get creationTime() : String
      {
         return var_2211;
      }
      
      public function get exists() : Boolean
      {
         return var_1082;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2212;
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
      
      public function get flatId() : int
      {
         return var_451;
      }
   }
}
