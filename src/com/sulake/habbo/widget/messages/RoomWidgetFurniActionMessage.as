package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_254:String = "RWFAM_MOVE";
      
      public static const const_688:String = "RWFUAM_ROTATE";
      
      public static const const_641:String = "RWFAM_PICKUP";
       
      
      private var _furniId:int = 0;
      
      private var var_2346:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         _furniId = param2;
         var_2346 = param3;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get furniCategory() : int
      {
         return var_2346;
      }
   }
}
