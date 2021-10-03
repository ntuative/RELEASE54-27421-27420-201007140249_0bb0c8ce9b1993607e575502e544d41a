package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class MarketplaceConfirmationDialog implements IGetImageListener
   {
       
      
      private var _catalog:IHabboCatalog;
      
      private var var_759:MarketPlaceLogic;
      
      private var _window:IFrameWindow;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_80:MarketPlaceOfferData;
      
      public function MarketplaceConfirmationDialog(param1:MarketPlaceLogic, param2:IHabboCatalog, param3:IRoomEngine)
      {
         super();
         var_759 = param1;
         _catalog = param2;
         _roomEngine = param3;
      }
      
      private function hide() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(var_80 && var_80.imageCallback == param1)
         {
            var_80.image = param2;
            setImage();
         }
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "buy_button":
               _catalog.buyMarketPlaceOffer(var_80.offerId);
               hide();
               break;
            case "header_button_close":
            case "cancel_button":
               hide();
         }
      }
      
      public function showConfirmation(param1:int, param2:MarketPlaceOfferData) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!param2)
         {
            return;
         }
         var_80 = param2;
         if(!var_759 || !_catalog || true)
         {
            return;
         }
         if(_window)
         {
            _window.dispose();
         }
         _window = createWindow("marketplace_purchase_confirmation") as IFrameWindow;
         _window.procedure = eventHandler;
         _window.center();
         var _loc3_:ITextWindow = _window.findChildByName("header_text") as ITextWindow;
         if(_loc3_)
         {
            if(param1 == var_759.const_1583)
            {
               _loc3_.text = "${catalog.marketplace.confirm_header}";
            }
            if(param1 == var_759.const_1584)
            {
               _loc3_.text = "${catalog.marketplace.confirm_higher_header}";
            }
         }
         _loc3_ = _window.findChildByName("item_name") as ITextWindow;
         if(_loc3_)
         {
            _loc3_.text = "${roomItem.name.undefined}";
         }
         _loc3_ = _window.findChildByName("item_price") as ITextWindow;
         if(_loc3_)
         {
            _loc4_ = _catalog.localization.getKey("catalog.marketplace.confirm_price");
            _loc4_ = _loc4_.replace("%price%",var_80.price);
            _loc3_.text = _loc4_;
         }
         _loc3_ = _window.findChildByName("item_average_price") as ITextWindow;
         if(_loc3_)
         {
            _loc5_ = _catalog.localization.getLocalization("catalog.marketplace.offer_details.average_price");
            if(_loc5_)
            {
               _loc4_ = _loc5_.raw;
               _loc4_ = _loc4_.replace("%days%",var_759.averagePricePeriod.toString());
               _loc6_ = false ? " - " : var_80.averagePrice.toString();
               _loc4_ = _loc4_.replace("%average%",_loc6_);
               _loc3_.text = _loc4_;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         _loc3_ = _window.findChildByName("offer_count") as ITextWindow;
         if(_loc3_)
         {
            _loc5_ = _catalog.localization.getLocalization("catalog.marketplace.offer_details.offer_count");
            if(_loc5_)
            {
               _loc4_ = _loc5_.raw;
               _loc4_ = _loc4_.replace("%count%",var_80.offerCount);
               _loc3_.text = _loc4_;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         setImage();
      }
      
      private function setImage() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_80 || !_window || !_roomEngine)
         {
            return;
         }
         if(true)
         {
            if(false)
            {
               _loc1_ = _roomEngine.getFurnitureIcon(var_80.furniId,this);
            }
            else if(false)
            {
               _loc1_ = _roomEngine.getWallItemIcon(var_80.furniId,this);
            }
            if(_loc1_ && _loc1_.data)
            {
               var_80.image = _loc1_.data as BitmapData;
               var_80.imageCallback = _loc1_.id;
            }
         }
         if(false)
         {
            _loc2_ = _window.findChildByName("item_image") as IBitmapWrapperWindow;
            if(_loc2_)
            {
               if(_loc2_.bitmap)
               {
                  _loc2_.bitmap.dispose();
                  _loc2_.bitmap = null;
               }
               _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
               _loc2_.bitmap.draw(var_80.image,new Matrix(1,0,0,1,(_loc2_.width - var_80.image.width) / 2,(_loc2_.height - var_80.image.height) / 2));
            }
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!_catalog || true || true)
         {
            return null;
         }
         var _loc2_:XmlAsset = _catalog.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return _catalog.windowManager.buildFromXML(_loc3_);
      }
      
      public function dispose() : void
      {
         var_759 = null;
         _catalog = null;
         _roomEngine = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_80 = null;
      }
   }
}
