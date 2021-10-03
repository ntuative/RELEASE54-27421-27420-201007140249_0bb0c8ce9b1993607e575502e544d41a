package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1485:String;
      
      private var var_1128:String;
      
      private var var_2176:Boolean;
      
      private var var_1502:int;
      
      private var var_1735:int;
      
      private var var_2177:Boolean;
      
      private var var_1517:String = "";
      
      private var var_2178:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1380:int;
      
      private var var_2179:Boolean;
      
      private var var_1785:int = -1;
      
      private var var_1836:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1735 = param1;
         var_1128 = param2;
         _objId = param3;
         var_1380 = param4;
         _category = param5;
         var_1485 = param6;
         var_2176 = param7;
         var_2178 = param8;
         var_2179 = param9;
         var_2177 = param10;
         var_1836 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1517;
      }
      
      public function get extra() : int
      {
         return var_1502;
      }
      
      public function get classId() : int
      {
         return var_1380;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2177;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2176;
      }
      
      public function get stripId() : int
      {
         return var_1735;
      }
      
      public function get stuffData() : String
      {
         return var_1485;
      }
      
      public function get songId() : int
      {
         return var_1785;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1517 = param1;
         var_1502 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1128;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1836;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2179;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2178;
      }
   }
}
