package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.ProductImageConfiguration;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.net.URLRequest;
   
   public class TrophyCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const gold:int = 16763904;
      
      private static const bronze:int = 13395456;
      
      private static const silver:int = 13421772;
       
      
      private var var_449:Map;
      
      private var var_88:IBitmapWrapperWindow;
      
      private var var_546:String = "g";
      
      private var var_216:int = 0;
      
      public function TrophyCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function setPreviewFromAsset(param1:String) : void
      {
         var _loc2_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ == null)
         {
            retrievePreviewAsset(param1);
            return;
         }
         setPreviewImage(_loc2_.content as BitmapData,false);
      }
      
      private function onClickPrev(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         --var_216;
         if(var_216 < 0)
         {
            var_216 = -1;
         }
         var _loc2_:Map = var_449.getWithIndex(var_216);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getValue(var_546);
            if(_loc3_ == null)
            {
               _loc3_ = _loc2_.getWithIndex(0);
            }
            if(_loc3_ != null)
            {
               events.dispatchEvent(new SelectProductEvent(_loc3_));
            }
         }
      }
      
      private function setPreviewImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(var_88 != null)
         {
            if(param1 == null)
            {
               param1 = new BitmapData(1,1);
               param2 = true;
            }
            if(true)
            {
               var_88.bitmap = new BitmapData(var_88.width,var_88.height,true,16777215);
            }
            var_88.bitmap.fillRect(var_88.bitmap.rect,16777215);
            _loc3_ = new Point((0 - param1.width) / 2,(0 - param1.height) / 2);
            var_88.bitmap.copyPixels(param1,param1.rect,_loc3_,null,null,true);
            var_88.invalidate();
         }
         if(param2 && param1 != null)
         {
            param1.dispose();
         }
      }
      
      private function getTrophyTypeFromProduct(param1:String) : String
      {
         var _loc2_:int = param1.lastIndexOf("_") + 1;
         if(_loc2_ <= 0)
         {
            return "";
         }
         var _loc3_:String = param1.substr(_loc2_);
         if(_loc3_.length > 1 || _loc3_ != "g" && _loc3_ != "s" && _loc3_ != "b")
         {
            return "";
         }
         return _loc3_;
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         var _loc3_:* = null;
         if(param1.index == 0)
         {
            var_546 = "g";
         }
         if(param1.index == 1)
         {
            var_546 = "s";
         }
         if(param1.index == 2)
         {
            var_546 = "b";
         }
         var _loc2_:Map = var_449.getWithIndex(var_216);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getValue(var_546);
            if(_loc3_ == null)
            {
               _loc3_ = _loc2_.getWithIndex(0);
            }
            if(_loc3_ != null)
            {
               events.dispatchEvent(new SelectProductEvent(_loc3_));
            }
         }
      }
      
      override public function init() : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         super.init();
         var_88 = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,onColourIndex);
         events.addEventListener(WidgetEvent.CWE_TEXT_INPUT,onTextInput);
         var _loc1_:IContainerButtonWindow = window.findChildByName("ctlg_nextmodel_button") as IContainerButtonWindow;
         var _loc2_:IContainerButtonWindow = window.findChildByName("ctlg_prevmodel_button") as IContainerButtonWindow;
         if(_loc1_ != null)
         {
            _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClickNext);
         }
         if(_loc2_ != null)
         {
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClickPrev);
         }
         var_449 = new Map();
         var _loc3_:* = null;
         for each(_loc3_ in page.offers)
         {
            _loc6_ = getBaseNameFromProduct(_loc3_.localizationId);
            _loc7_ = getTrophyTypeFromProduct(_loc3_.localizationId);
            if(var_449.getValue(_loc6_) == null)
            {
               var_449.add(_loc6_,new Map());
            }
            _loc8_ = var_449.getValue(_loc6_) as Map;
            _loc8_.add(_loc7_,_loc3_);
         }
         _loc4_ = var_449.getWithIndex(var_216);
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_.getValue(var_546);
            if(_loc3_ == null)
            {
               _loc3_ = _loc4_.getWithIndex(0);
            }
            if(_loc3_ != null)
            {
               events.dispatchEvent(new SelectProductEvent(_loc3_));
            }
         }
         var _loc5_:Array = new Array();
         _loc5_.push(gold);
         _loc5_.push(silver);
         _loc5_.push(bronze);
         events.dispatchEvent(new CatalogWidgetColoursEvent(_loc5_,"ctlg_clr_40x32_1","ctlg_clr_40x32_2","ctlg_clr_40x32_3"));
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            setPreviewFromAsset(_loc2_.assetName);
         }
      }
      
      private function getBaseNameFromProduct(param1:String) : String
      {
         var _loc2_:String = getTrophyTypeFromProduct(param1);
         if(_loc2_.length > 0)
         {
            return param1.slice(0,param1.length - 1 - _loc2_.length);
         }
         return param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in page.offers)
         {
            if(_loc3_.previewCallbackId == param1)
            {
               _loc3_.previewCallbackId = 0;
               setPreviewImage(param2,true);
               break;
            }
         }
      }
      
      private function retrievePreviewAsset(param1:String) : void
      {
         var _loc2_:* = page.viewer.catalog.configuration.getKey("image.library.url");
         _loc2_ += "catalogue/";
         var _loc3_:* = _loc2_ + param1 + ".gif";
         Logger.log("[TrophyCatalogWidget] Retrieve Product Preview Asset: " + _loc3_);
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         var _loc5_:AssetLoaderStruct = page.viewer.catalog.assets.loadAssetFromFile(param1,_loc4_,"image/gif");
         _loc5_.addEventListener(AssetLoaderEvent.const_29,onPreviewImageReady);
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Offer = param1.offer;
         var _loc3_:IProductData = page.viewer.catalog.getProductData(_loc2_.localizationId);
         if(ProductImageConfiguration.hasProductImage(_loc2_.localizationId))
         {
            setPreviewFromAsset(ProductImageConfiguration.const_33[_loc2_.localizationId]);
         }
         else
         {
            _loc5_ = _loc2_.productContainer.firstProduct;
            _loc6_ = page.viewer.roomEngine.getFurnitureImage(_loc5_.productClassId,new Vector3d(2,0,0),64,this,_loc5_.extraParam);
            _loc2_.previewCallbackId = _loc6_.id;
            if(_loc6_ != null)
            {
               _loc4_ = _loc6_.data;
            }
            setPreviewImage(_loc4_,true);
         }
      }
      
      private function onClickNext(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         ++var_216;
         if(var_216 >= var_449.length)
         {
            var_216 = 0;
         }
         var _loc2_:Map = var_449.getWithIndex(var_216);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getValue(var_546);
            if(_loc3_ == null)
            {
               _loc3_ = _loc2_.getWithIndex(0);
            }
            if(_loc3_ != null)
            {
               events.dispatchEvent(new SelectProductEvent(_loc3_));
            }
         }
      }
      
      public function onTextInput(param1:TextInputEvent) : void
      {
         events.dispatchEvent(new SetExtraPurchaseParameterEvent(param1.text));
      }
   }
}
