package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubOffersMessageEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class ClubBuyController
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var _visualization:ClubBuyCatalogWidget;
      
      private var var_614:Array;
      
      private var var_219:ClubBuyConfirmationDialog;
      
      public function ClubBuyController(param1:HabboCatalog)
      {
         super();
         _catalog = param1;
      }
      
      public function registerVisualization(param1:ClubBuyCatalogWidget) : void
      {
         _visualization = param1;
      }
      
      public function get assets() : IAssetLibrary
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.assets;
      }
      
      public function requestOffers() : void
      {
         _catalog.getHabboClubOffers();
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.getProductData(param1);
      }
      
      public function closeConfirmation() : void
      {
         if(var_219)
         {
            var_219.dispose();
            var_219 = null;
         }
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_614)
         {
            _loc1_.dispose();
         }
         var_614 = [];
      }
      
      public function showConfirmation(param1:ClubBuyOfferData, param2:ICatalogPage) : void
      {
         closeConfirmation();
         var_219 = new ClubBuyConfirmationDialog(this,param1,param2);
      }
      
      public function getClubType() : int
      {
         var _loc1_:int = 0;
         if(_catalog.getPurse().hasClubLeft)
         {
            _loc1_ = !!_catalog.getPurse().isVIP ? 0 : int(HabboClubLevelEnum.const_56);
         }
         return _loc1_;
      }
      
      public function onOffers(param1:HabboClubOffersMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:HabboClubOffersMessageParser = param1.getParser();
         reset();
         _visualization.reset();
         _visualization.initClubType(getClubType());
         var_614 = [];
         var _loc3_:int = 0;
         for each(_loc5_ in _loc2_.offers)
         {
            _loc7_ = new ClubBuyOfferData(_loc5_.offerId,_loc5_.productCode,_loc5_.price,_loc5_.upgrade,_loc5_.vip,_loc5_.periods,_loc5_.daysLeftAfterPurchase,_loc5_.year,_loc5_.month,_loc5_.day);
            var_614.push(_loc7_);
            if(_loc5_.vip)
            {
               _loc3_++;
               _loc4_ = _loc7_;
            }
         }
         if(_loc3_ == 1)
         {
            _loc4_.upgradeHcPeriodToVip = true;
         }
         var_614.sort(orderByPrecedence);
         for each(_loc6_ in var_614)
         {
            _visualization.showOffer(_loc6_);
         }
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.localization;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.windowManager;
      }
      
      public function dispose() : void
      {
         if(_visualization != null)
         {
            _visualization.dispose();
            _visualization = null;
         }
         reset();
         closeConfirmation();
      }
      
      public function getPurse() : IPurse
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.getPurse();
      }
      
      private function orderByPrecedence(param1:ClubBuyOfferData, param2:ClubBuyOfferData) : Number
      {
         var _loc3_:Number = param1.periods;
         var _loc4_:Number = param2.periods;
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      public function get hasClub() : Boolean
      {
         if(!_catalog || !_catalog.getPurse())
         {
            return false;
         }
         return _catalog.getPurse().clubDays > 0;
      }
      
      public function confirmSelection(param1:ClubBuyOfferData, param2:ICatalogPage) : void
      {
         if(!_catalog || true)
         {
            return;
         }
         _catalog.purchaseProduct(param2,param1);
         closeConfirmation();
      }
      
      public function get roomEngine() : IRoomEngine
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.roomEngine;
      }
   }
}
