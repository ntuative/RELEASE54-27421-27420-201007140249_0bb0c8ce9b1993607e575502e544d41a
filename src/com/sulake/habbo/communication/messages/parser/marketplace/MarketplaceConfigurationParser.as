package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1823:int;
      
      private var var_1527:int;
      
      private var var_1825:int;
      
      private var var_1820:int;
      
      private var var_1824:int;
      
      private var var_1526:int;
      
      private var var_1821:int;
      
      private var var_1241:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1823;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1527;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1821;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1820;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1824;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1526;
      }
      
      public function get commission() : int
      {
         return var_1825;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1241 = param1.readBoolean();
         var_1825 = param1.readInteger();
         var_1527 = param1.readInteger();
         var_1526 = param1.readInteger();
         var_1820 = param1.readInteger();
         var_1823 = param1.readInteger();
         var_1824 = param1.readInteger();
         var_1821 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1241;
      }
   }
}
