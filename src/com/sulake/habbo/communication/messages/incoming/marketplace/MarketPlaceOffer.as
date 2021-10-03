package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1356:int;
      
      private var var_1962:int;
      
      private var var_1963:int = -1;
      
      private var var_152:int;
      
      private var var_1964:int;
      
      private var _offerId:int;
      
      private var var_1357:int;
      
      private var _furniId:int;
      
      private var var_1485:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1964 = param3;
         var_1485 = param4;
         var_1356 = param5;
         var_152 = param6;
         var_1963 = param7;
         var_1962 = param8;
         var_1357 = param9;
      }
      
      public function get status() : int
      {
         return var_152;
      }
      
      public function get price() : int
      {
         return var_1356;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1963;
      }
      
      public function get offerCount() : int
      {
         return var_1357;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1964;
      }
      
      public function get averagePrice() : int
      {
         return var_1962;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get stuffData() : String
      {
         return var_1485;
      }
   }
}
