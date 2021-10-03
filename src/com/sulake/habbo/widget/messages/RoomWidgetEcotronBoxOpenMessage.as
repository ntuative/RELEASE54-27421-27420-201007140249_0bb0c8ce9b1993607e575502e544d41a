package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_593:String = "RWEBOM_OPEN_ECOTRONBOX";
       
      
      private var var_167:int;
      
      public function RoomWidgetEcotronBoxOpenMessage(param1:String, param2:int)
      {
         super(param1);
         var_167 = param2;
      }
      
      public function get objectId() : int
      {
         return var_167;
      }
   }
}
