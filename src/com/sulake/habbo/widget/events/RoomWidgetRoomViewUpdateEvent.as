package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_633:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_701:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_287:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1574:Point;
      
      private var var_1575:Rectangle;
      
      private var var_155:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1575 = param2;
         var_1574 = param3;
         var_155 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1575 != null)
         {
            return var_1575.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_155;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1574 != null)
         {
            return var_1574.clone();
         }
         return null;
      }
   }
}
