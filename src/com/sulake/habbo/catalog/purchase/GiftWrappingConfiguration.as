package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_603:Array;
      
      private var var_1356:int;
      
      private var var_1516:Array;
      
      private var var_604:Array;
      
      private var var_1241:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1241 = _loc2_.isWrappingEnabled;
         var_1356 = _loc2_.wrappingPrice;
         var_1516 = _loc2_.stuffTypes;
         var_604 = _loc2_.boxTypes;
         var_603 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_603;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1516;
      }
      
      public function get price() : int
      {
         return var_1356;
      }
      
      public function get boxTypes() : Array
      {
         return var_604;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1241;
      }
   }
}
