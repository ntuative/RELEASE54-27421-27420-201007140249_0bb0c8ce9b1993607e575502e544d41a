package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1672:Array;
      
      private var var_1962:int;
      
      private var var_2232:int;
      
      private var var_2233:int;
      
      private var var_2231:int;
      
      private var _dayOffsets:Array;
      
      private var var_2230:int;
      
      private var var_1671:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return var_2232;
      }
      
      public function get historyLength() : int
      {
         return var_2231;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2233;
      }
      
      public function get offerCount() : int
      {
         return var_2230;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1671;
      }
      
      public function get averagePrice() : int
      {
         return var_1962;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1962 = param1.readInteger();
         var_2230 = param1.readInteger();
         var_2231 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1672 = [];
         var_1671 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1672.push(param1.readInteger());
            var_1671.push(param1.readInteger());
            _loc3_++;
         }
         var_2233 = param1.readInteger();
         var_2232 = param1.readInteger();
         return true;
      }
   }
}
