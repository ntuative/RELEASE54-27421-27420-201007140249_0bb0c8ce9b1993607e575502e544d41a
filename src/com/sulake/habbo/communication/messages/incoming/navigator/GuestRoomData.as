package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2106:int;
      
      private var var_2386:String;
      
      private var var_2387:int;
      
      private var var_2383:int;
      
      private var var_739:Boolean;
      
      private var var_2147:Boolean;
      
      private var var_451:int;
      
      private var var_1344:String;
      
      private var var_2148:int;
      
      private var var_1233:int;
      
      private var _ownerName:String;
      
      private var var_802:String;
      
      private var var_2384:int;
      
      private var var_2385:RoomThumbnailData;
      
      private var var_2159:Boolean;
      
      private var var_693:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_693 = new Array();
         super();
         var_451 = param1.readInteger();
         var_739 = param1.readBoolean();
         var_802 = param1.readString();
         _ownerName = param1.readString();
         var_2148 = param1.readInteger();
         var_2106 = param1.readInteger();
         var_2384 = param1.readInteger();
         var_1344 = param1.readString();
         var_2387 = param1.readInteger();
         var_2159 = param1.readBoolean();
         var_2383 = param1.readInteger();
         var_1233 = param1.readInteger();
         var_2386 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_693.push(_loc4_);
            _loc3_++;
         }
         var_2385 = new RoomThumbnailData(param1);
         var_2147 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2384;
      }
      
      public function get roomName() : String
      {
         return var_802;
      }
      
      public function get userCount() : int
      {
         return var_2106;
      }
      
      public function get score() : int
      {
         return var_2383;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2386;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2159;
      }
      
      public function get tags() : Array
      {
         return var_693;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2147;
      }
      
      public function get event() : Boolean
      {
         return var_739;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1233;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2387;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2385;
      }
      
      public function get doorMode() : int
      {
         return var_2148;
      }
      
      public function get flatId() : int
      {
         return var_451;
      }
      
      public function get description() : String
      {
         return var_1344;
      }
   }
}
