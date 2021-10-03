package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_769:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_297:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_769,param2,param3);
         var_297 = param1;
      }
      
      public function get effects() : Array
      {
         return var_297;
      }
   }
}
