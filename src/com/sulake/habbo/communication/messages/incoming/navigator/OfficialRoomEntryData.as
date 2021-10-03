package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1408:int = 4;
      
      public static const const_635:int = 3;
      
      public static const const_748:int = 2;
      
      public static const const_941:int = 1;
       
      
      private var var_2259:String;
      
      private var _disposed:Boolean;
      
      private var var_2106:int;
      
      private var var_2256:Boolean;
      
      private var var_978:String;
      
      private var var_963:PublicRoomData;
      
      private var var_2260:int;
      
      private var _index:int;
      
      private var var_2257:String;
      
      private var _type:int;
      
      private var var_1851:String;
      
      private var var_962:GuestRoomData;
      
      private var var_2258:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2259 = param1.readString();
         var_2258 = param1.readString();
         var_2256 = param1.readInteger() == 1;
         var_2257 = param1.readString();
         var_978 = param1.readString();
         var_2260 = param1.readInteger();
         var_2106 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_941)
         {
            var_1851 = param1.readString();
         }
         else if(_type == const_635)
         {
            var_963 = new PublicRoomData(param1);
         }
         else if(_type == const_748)
         {
            var_962 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2260;
      }
      
      public function get popupCaption() : String
      {
         return var_2259;
      }
      
      public function get userCount() : int
      {
         return var_2106;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2256;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_941)
         {
            return 0;
         }
         if(this.type == const_748)
         {
            return this.var_962.maxUserCount;
         }
         if(this.type == const_635)
         {
            return this.var_963.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2258;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_962 != null)
         {
            this.var_962.dispose();
            this.var_962 = null;
         }
         if(this.var_963 != null)
         {
            this.var_963.dispose();
            this.var_963 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_962;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2257;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_963;
      }
      
      public function get picRef() : String
      {
         return var_978;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1851;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
