package com.sulake.habbo.avatar.promo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.ISideContentView;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   
   public class ClubPromoView implements ISideContentView
   {
       
      
      private var _window:IWindowContainer;
      
      private var _model:ClubPromoModel;
      
      public function ClubPromoView(param1:ClubPromoModel)
      {
         var _loc2_:* = null;
         super();
         _model = param1;
         if(_model && false && _model.controller.assets)
         {
            _loc2_ = _model.controller.assets.getAssetByName("avatareditor_club_promo_try") as XmlAsset;
            if(_loc2_)
            {
               _window = _model.controller.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
               _window.visible = false;
               _window.procedure = windowEventProc;
            }
         }
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "try_clothes_btn":
                  if(_model)
                  {
                     _model.tryClubClothes();
                  }
                  break;
               case "club_info_btn":
                  if(_model && false && _model.controller.catalog)
                  {
                     _model.controller.catalog.openCatalogPage(CatalogPageName.const_228,true);
                  }
                  break;
               default:
                  Logger.log("No event proc for element in Club Promo View");
            }
         }
      }
      
      public function showBuyView() : void
      {
         var _loc1_:* = null;
         if(_model && false && _model.controller.assets)
         {
            _loc1_ = _model.controller.assets.getAssetByName("avatareditor_club_promo_buy") as XmlAsset;
            if(_loc1_)
            {
               _window = _model.controller.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
               _window.visible = false;
               _window.procedure = windowEventProc;
            }
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
      
      public function dispose() : void
      {
         _model = null;
      }
   }
}
