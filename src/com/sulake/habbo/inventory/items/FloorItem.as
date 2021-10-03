package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2425:Boolean;
      
      protected var var_1502:Number;
      
      protected var var_2424:Boolean;
      
      protected var _type:int;
      
      protected var var_2423:Boolean;
      
      protected var var_1785:int;
      
      protected var var_2426:Boolean;
      
      protected var var_1485:String;
      
      protected var var_1746:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1517:String;
      
      protected var var_1744:Boolean;
      
      protected var _category:int;
      
      protected var var_1747:int;
      
      protected var var_2430:int;
      
      protected var var_1742:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_1744 = param5;
         var_2426 = param6;
         var_2425 = param7;
         var_2424 = param8;
         var_1485 = param9;
         var_1502 = param10;
         var_2430 = param11;
         var_1742 = param12;
         var_1747 = param13;
         var_1746 = param14;
         var_1517 = param15;
         var_1785 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2423;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1502;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2423 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1785;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2424;
      }
      
      public function get slotId() : String
      {
         return var_1517;
      }
      
      public function get expires() : int
      {
         return var_2430;
      }
      
      public function get creationYear() : int
      {
         return var_1746;
      }
      
      public function get creationDay() : int
      {
         return var_1742;
      }
      
      public function get stuffData() : String
      {
         return var_1485;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2426;
      }
      
      public function get groupable() : Boolean
      {
         return var_1744;
      }
      
      public function get creationMonth() : int
      {
         return var_1747;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2425;
      }
   }
}
