package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_882:String = "price_type_none";
      
      public static const const_446:String = "pricing_model_multi";
      
      public static const const_322:String = "price_type_credits";
      
      public static const const_503:String = "price_type_credits_and_pixels";
      
      public static const const_460:String = "pricing_model_bundle";
      
      public static const const_495:String = "pricing_model_single";
      
      public static const const_663:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1219:String = "pricing_model_unknown";
      
      public static const const_469:String = "price_type_pixels";
       
      
      private var var_2286:int;
      
      private var var_967:int;
      
      private var _offerId:int;
      
      private var var_968:int;
      
      private var var_455:String;
      
      private var var_666:String;
      
      private var var_430:ICatalogPage;
      
      private var var_456:IProductContainer;
      
      private var var_1433:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1433 = param1.localizationId;
         var_967 = param1.priceInCredits;
         var_968 = param1.priceInPixels;
         var_430 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_455;
      }
      
      public function get page() : ICatalogPage
      {
         return var_430;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2286 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_456;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_968;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1433 = "";
         var_967 = 0;
         var_968 = 0;
         var_430 = null;
         if(var_456 != null)
         {
            var_456.dispose();
            var_456 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2286;
      }
      
      public function get priceInCredits() : int
      {
         return var_967;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_455 = const_495;
            }
            else
            {
               var_455 = const_446;
            }
         }
         else if(param1.length > 1)
         {
            var_455 = const_460;
         }
         else
         {
            var_455 = const_1219;
         }
      }
      
      public function get priceType() : String
      {
         return var_666;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_455)
         {
            case const_495:
               var_456 = new SingleProductContainer(this,param1);
               break;
            case const_446:
               var_456 = new MultiProductContainer(this,param1);
               break;
            case const_460:
               var_456 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_455);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1433;
      }
      
      private function analyzePriceType() : void
      {
         if(var_967 > 0 && var_968 > 0)
         {
            var_666 = const_503;
         }
         else if(var_967 > 0)
         {
            var_666 = const_322;
         }
         else if(var_968 > 0)
         {
            var_666 = const_469;
         }
         else
         {
            var_666 = const_882;
         }
      }
   }
}
