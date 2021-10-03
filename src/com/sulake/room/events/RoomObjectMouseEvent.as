package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1580:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1693:String = "ROE_MOUSE_ENTER";
      
      public static const const_407:String = "ROE_MOUSE_MOVE";
      
      public static const const_1617:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_229:String = "ROE_MOUSE_CLICK";
      
      public static const const_508:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2264:Boolean;
      
      private var var_2265:Boolean;
      
      private var var_2263:Boolean;
      
      private var var_2262:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2263 = param4;
         var_2262 = param5;
         var_2264 = param6;
         var_2265 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2265;
      }
      
      public function get altKey() : Boolean
      {
         return var_2263;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2262;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2264;
      }
   }
}
