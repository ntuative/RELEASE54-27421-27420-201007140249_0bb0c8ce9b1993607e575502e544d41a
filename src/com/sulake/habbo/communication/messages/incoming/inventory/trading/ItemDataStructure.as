package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1128:String;
      
      private var var_1741:int;
      
      private var var_1745:int;
      
      private var var_1502:int;
      
      private var var_1746:int;
      
      private var _category:int;
      
      private var var_2519:int;
      
      private var var_1742:int;
      
      private var var_1743:int;
      
      private var var_1748:int;
      
      private var var_1747:int;
      
      private var var_1744:Boolean;
      
      private var var_1485:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1741 = param1;
         var_1128 = param2;
         var_1745 = param3;
         var_1748 = param4;
         _category = param5;
         var_1485 = param6;
         var_1502 = param7;
         var_1743 = param8;
         var_1742 = param9;
         var_1747 = param10;
         var_1746 = param11;
         var_1744 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1748;
      }
      
      public function get extra() : int
      {
         return var_1502;
      }
      
      public function get stuffData() : String
      {
         return var_1485;
      }
      
      public function get groupable() : Boolean
      {
         return var_1744;
      }
      
      public function get creationMonth() : int
      {
         return var_1747;
      }
      
      public function get roomItemID() : int
      {
         return var_1745;
      }
      
      public function get itemType() : String
      {
         return var_1128;
      }
      
      public function get itemID() : int
      {
         return var_1741;
      }
      
      public function get songID() : int
      {
         return var_1502;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1743;
      }
      
      public function get creationYear() : int
      {
         return var_1746;
      }
      
      public function get creationDay() : int
      {
         return var_1742;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
