package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserBadgesUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_137:String = "RWUBUE_USER_BADGES";
       
      
      private var _userId:int;
      
      private var var_271:Array;
      
      public function RoomWidgetUserBadgesUpdateEvent(param1:int, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_137,param3,param4);
         _userId = param1;
         var_271 = param2;
      }
      
      public function get badges() : Array
      {
         return var_271;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
