package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1672:Array;
      
      private var var_1962:int;
      
      private var var_2232:int;
      
      private var var_2231:int;
      
      private var var_2233:int;
      
      private var _dayOffsets:Array;
      
      private var var_2230:int;
      
      private var var_1671:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1672;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1672 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_2232;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1671 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1962 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_2231;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2233;
      }
      
      public function get offerCount() : int
      {
         return var_2230;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_2230 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1671;
      }
      
      public function get averagePrice() : int
      {
         return var_1962;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_2233 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_2231 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_2232 = param1;
      }
   }
}
