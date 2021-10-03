package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2068:int;
      
      private var var_2072:int;
      
      private var var_2070:int;
      
      private var _userName:String;
      
      private var var_2071:int;
      
      private var var_2069:int;
      
      private var var_2073:int;
      
      private var _userId:int;
      
      private var var_728:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2069 = param1.readInteger();
         var_2071 = param1.readInteger();
         var_728 = param1.readBoolean();
         var_2070 = param1.readInteger();
         var_2072 = param1.readInteger();
         var_2068 = param1.readInteger();
         var_2073 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2073;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_728;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2071;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2072;
      }
      
      public function get cautionCount() : int
      {
         return var_2068;
      }
      
      public function get cfhCount() : int
      {
         return var_2070;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2069;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
