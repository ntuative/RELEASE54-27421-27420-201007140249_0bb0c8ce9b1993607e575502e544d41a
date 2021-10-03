package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_642:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_218:String;
      
      private var var_734:String;
      
      private var var_1549:String;
      
      private var var_167:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_167 = param2;
         var_1549 = param3;
         var_218 = param4;
         var_734 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1549;
      }
      
      public function get colorHex() : String
      {
         return var_734;
      }
      
      public function get text() : String
      {
         return var_218;
      }
      
      public function get objectId() : int
      {
         return var_167;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
