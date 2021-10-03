package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_755:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2127:int;
      
      private var var_2126:int;
      
      private var var_2125:Boolean;
      
      private var var_1180:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_755);
         var_2126 = param1;
         var_2127 = param2;
         _color = param3;
         var_1180 = param4;
         var_2125 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_2127;
      }
      
      public function get presetNumber() : int
      {
         return var_2126;
      }
      
      public function get brightness() : int
      {
         return var_1180;
      }
      
      public function get apply() : Boolean
      {
         return var_2125;
      }
   }
}
