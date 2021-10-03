package com.sulake.habbo.widget.events
{
   public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_360:String = "RWCCUE_SHOW_GENDER_SELECTION";
      
      public static const const_994:String = "RWCCUE_SHOW_CLOTHING_EDITOR";
      
      public static const const_324:String = "RWCCUE_HIDE_CLOTHING_EDITOR";
       
      
      private var _roomId:int = -1;
      
      private var var_167:int = -1;
      
      private var var_1871:int = -1;
      
      private var _roomCategory:int = -1;
      
      public function RoomWidgetClothingChangeUpdateEvent(param1:String, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_167 = param2;
         var_1871 = param3;
         _roomId = param4;
         _roomCategory = param5;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get objectId() : int
      {
         return var_167;
      }
      
      public function get objectCategory() : int
      {
         return var_1871;
      }
   }
}
