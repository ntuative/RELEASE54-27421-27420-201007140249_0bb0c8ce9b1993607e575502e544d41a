package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_738:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2332:BitmapData;
      
      private var var_1945:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_738,param3,param4);
         var_1945 = param1;
         var_2332 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_2332;
      }
      
      public function get badgeID() : String
      {
         return var_1945;
      }
   }
}
