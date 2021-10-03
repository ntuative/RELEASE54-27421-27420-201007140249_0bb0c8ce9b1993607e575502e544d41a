package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1735:int;
      
      private var var_2178:Boolean;
      
      private var var_1785:int;
      
      private var var_1485:String;
      
      private var var_2320:Boolean = false;
      
      private var var_1836:int;
      
      private var var_481:int;
      
      private var var_1128:String;
      
      private var var_1517:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1380:int;
      
      private var var_2179:Boolean;
      
      private var var_2321:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1735 = param1;
         var_1128 = param2;
         _objId = param3;
         var_1380 = param4;
         var_1485 = param5;
         var_2178 = param6;
         var_2179 = param7;
         var_1836 = param8;
         var_1517 = param9;
         var_1785 = param10;
         var_481 = -1;
      }
      
      public function get songId() : int
      {
         return var_1785;
      }
      
      public function get iconCallbackId() : int
      {
         return var_481;
      }
      
      public function get expiryTime() : int
      {
         return var_1836;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2321 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2320 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_481 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2179;
      }
      
      public function get slotId() : String
      {
         return var_1517;
      }
      
      public function get classId() : int
      {
         return var_1380;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2178;
      }
      
      public function get stuffData() : String
      {
         return var_1485;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1735;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2320;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2321;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1128;
      }
   }
}
