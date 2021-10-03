package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   
   public class ClubBuyItem
   {
       
      
      private var var_80:ClubBuyOfferData;
      
      private var var_430:ICatalogPage;
      
      private var _window:IWindowContainer;
      
      public function ClubBuyItem(param1:ClubBuyOfferData, param2:ICatalogPage)
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc7_:int = 0;
         super();
         var_80 = param1;
         var_430 = param2;
         if(param1.vip)
         {
            if(param1.upgrade)
            {
               _loc3_ = getAssetXML("club_buy_vip_upgrade_item");
            }
            else
            {
               _loc3_ = getAssetXML("club_buy_vip_item");
            }
         }
         else
         {
            _loc3_ = getAssetXML("club_buy_hc_item");
         }
         _window = var_430.viewer.catalog.windowManager.buildFromXML(_loc3_) as IWindowContainer;
         var _loc4_:ICoreLocalizationManager = (param2.viewer.catalog as HabboCatalog).localization;
         if(param1.upgrade)
         {
            _loc7_ = param1.periods == 0 ? 1 : int(param1.periods);
            if(param1.upgradeHcPeriodToVip)
            {
               _loc5_ = _loc4_.getLocalization("catalog.club.item.header.upgradehctovip");
            }
            else
            {
               _loc4_.registerParameter("catalog.club.item.header.upgrade","months",String(_loc7_));
               _loc5_ = _loc4_.getLocalization("catalog.club.item.header.upgrade");
            }
         }
         else
         {
            _loc4_.registerParameter("catalog.club.item.header","months",String(param1.periods));
            _loc5_ = _loc4_.getLocalization("catalog.club.item.header");
         }
         _window.findChildByName("item_header").caption = _loc5_.value;
         _loc4_.registerParameter("catalog.club.price","price",String(param1.price));
         _loc5_ = _loc4_.getLocalization("catalog.club.price");
         _window.findChildByName("item_price").caption = _loc5_.value;
         var _loc6_:IButtonWindow = _window.findChildByName("item_buy") as IButtonWindow;
         if(_loc6_ != null)
         {
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onBuy);
         }
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      private function getAssetXML(param1:String) : XML
      {
         if(!var_430 || true || !var_430.viewer.catalog || !var_430.viewer.catalog.assets)
         {
            return null;
         }
         var _loc2_:XmlAsset = var_430.viewer.catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.content as XML;
      }
      
      public function dispose() : void
      {
         _window.dispose();
      }
      
      private function onBuy(param1:WindowMouseEvent) : void
      {
         var _loc2_:ClubBuyController = (var_430.viewer.catalog as HabboCatalog).getClubBuyController();
         (var_430.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_80,var_430);
      }
   }
}
