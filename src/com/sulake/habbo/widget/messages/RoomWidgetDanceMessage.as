package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_582:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_926:int = 0;
      
      public static const const_1311:Array = [2,3,4];
       
      
      private var var_82:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_582);
         var_82 = param1;
      }
      
      public function get style() : int
      {
         return var_82;
      }
   }
}
