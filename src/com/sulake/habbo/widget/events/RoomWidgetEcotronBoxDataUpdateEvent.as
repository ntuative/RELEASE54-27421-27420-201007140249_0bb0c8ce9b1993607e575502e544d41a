package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetEcotronBoxDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_78:String = "RWEBDUE_CONTENTS";
      
      public static const const_61:String = "RWEBDUE_PACKAGEINFO";
       
      
      private var var_218:String;
      
      private var var_1915:BitmapData;
      
      private var var_167:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetEcotronBoxDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_167 = param2;
         var_218 = param3;
         _controller = param4;
         var_1915 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1915;
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
