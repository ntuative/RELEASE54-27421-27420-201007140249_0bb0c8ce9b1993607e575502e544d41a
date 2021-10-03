package com.sulake.habbo.friendlist.events
{
   import flash.events.Event;
   
   public class FriendRequestEvent extends Event
   {
      
      public static const const_262:String = "FRE_DECLINED";
      
      public static const const_53:String = "FRE_ACCEPTED";
       
      
      private var var_1140:int;
      
      public function FriendRequestEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         var_1140 = param2;
      }
      
      public function get requestId() : int
      {
         return var_1140;
      }
   }
}
