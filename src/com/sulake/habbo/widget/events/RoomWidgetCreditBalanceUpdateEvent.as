package com.sulake.habbo.widget.events
{
   public class RoomWidgetCreditBalanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_156:String = "RWCBUE_CREDIT_BALANCE";
       
      
      private var var_2342:int;
      
      public function RoomWidgetCreditBalanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_156,param2,param3);
         var_2342 = param1;
      }
      
      public function get balance() : int
      {
         return var_2342;
      }
   }
}
