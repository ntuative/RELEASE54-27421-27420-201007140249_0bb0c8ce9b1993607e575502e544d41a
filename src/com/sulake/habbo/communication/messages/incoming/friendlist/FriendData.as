package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_409:String;
      
      private var var_1231:String;
      
      private var var_1235:String;
      
      private var var_1233:int;
      
      private var var_599:int;
      
      private var var_1234:String;
      
      private var _name:String;
      
      private var var_1232:Boolean;
      
      private var var_728:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_599 = param1.readInteger();
         this.var_728 = param1.readBoolean();
         this.var_1232 = param1.readBoolean();
         this.var_409 = param1.readString();
         this.var_1233 = param1.readInteger();
         this.var_1235 = param1.readString();
         this.var_1231 = param1.readString();
         this.var_1234 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_599;
      }
      
      public function get realName() : String
      {
         return var_1234;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1235;
      }
      
      public function get categoryId() : int
      {
         return var_1233;
      }
      
      public function get online() : Boolean
      {
         return var_728;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1232;
      }
      
      public function get lastAccess() : String
      {
         return var_1231;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_409;
      }
   }
}
