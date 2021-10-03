package com.sulake.room.events
{
   import flash.events.Event;
   
   public class RoomContentLoadedEvent extends Event
   {
      
      public static const const_300:String = "RCLE_SUCCESS";
      
      public static const const_488:String = "RCLE_FAILURE";
      
      public static const const_656:String = "RCLE_CANCEL";
       
      
      private var var_2061:String;
      
      public function RoomContentLoadedEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         var_2061 = param2;
      }
      
      public function get contentType() : String
      {
         return var_2061;
      }
   }
}
