package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_959:Array;
      
      private var var_967:int;
      
      private var var_1433:String;
      
      private var _offerId:int;
      
      private var var_968:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1433 = param1.readString();
         var_967 = param1.readInteger();
         var_968 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_959 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_959.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_959;
      }
      
      public function get priceInCredits() : int
      {
         return var_967;
      }
      
      public function get localizationId() : String
      {
         return var_1433;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_968;
      }
   }
}
