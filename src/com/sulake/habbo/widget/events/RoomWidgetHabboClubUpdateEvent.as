package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_242:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2082:Boolean = false;
      
      private var var_2081:int = 0;
      
      private var var_2080:int = 0;
      
      private var var_1907:int;
      
      private var var_2079:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_242,param6,param7);
         var_2079 = param1;
         var_2080 = param2;
         var_2081 = param3;
         var_2082 = param4;
         var_1907 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1907;
      }
      
      public function get pastPeriods() : int
      {
         return var_2081;
      }
      
      public function get periodsLeft() : int
      {
         return var_2080;
      }
      
      public function get daysLeft() : int
      {
         return var_2079;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2082;
      }
   }
}
