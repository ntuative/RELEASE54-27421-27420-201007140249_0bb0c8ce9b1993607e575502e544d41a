package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_993:String = "inventory_badges";
      
      public static const const_1436:String = "inventory_clothes";
      
      public static const const_1389:String = "inventory_furniture";
      
      public static const const_767:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_864:String = "inventory_effects";
       
      
      private var var_2097:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_767);
         var_2097 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2097;
      }
   }
}
