package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1052:String = "select_outfit";
       
      
      private var var_1903:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1052);
         var_1903 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1903;
      }
   }
}
