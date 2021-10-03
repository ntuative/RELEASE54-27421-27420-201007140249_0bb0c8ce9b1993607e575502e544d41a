package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   
   public class PurchaseOKMessageParser implements IMessageParser
   {
       
      
      private var var_80:CatalogPageMessageOfferData;
      
      public function PurchaseOKMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_80 = new CatalogPageMessageOfferData(param1);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get offer() : CatalogPageMessageOfferData
      {
         return var_80;
      }
   }
}
