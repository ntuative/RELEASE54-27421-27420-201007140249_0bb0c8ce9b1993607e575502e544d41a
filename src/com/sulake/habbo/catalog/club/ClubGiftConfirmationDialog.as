package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.session.product.IProductData;
   
   public class ClubGiftConfirmationDialog
   {
       
      
      private var _view:IFrameWindow;
      
      private var _controller:ClubGiftController;
      
      private var var_80:Offer;
      
      public function ClubGiftConfirmationDialog(param1:ClubGiftController, param2:Offer)
      {
         super();
         var_80 = param2;
         _controller = param1;
         showConfirmation();
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !_controller || !var_80)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "select_button":
               _controller.confirmSelection(var_80.localizationId);
               break;
            case "header_button_close":
            case "cancel_button":
               _controller.closeConfirmation();
         }
      }
      
      public function showConfirmation() : void
      {
         if(!var_80 || !_controller)
         {
            return;
         }
         _view = createWindow("club_gift_confirmation") as IFrameWindow;
         if(!_view)
         {
            return;
         }
         _view.procedure = windowEventHandler;
         _view.center();
         var _loc1_:ITextWindow = _view.findChildByName("item_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = getProductName();
         }
         var _loc2_:IWindowContainer = _view.findChildByName("image_border") as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var_80.productContainer.view = _loc2_;
         var_80.productContainer.initProductIcon(_controller.roomEngine);
      }
      
      private function getProductName() : String
      {
         var _loc1_:* = null;
         if(var_80 && false && var_80.productContainer.firstProduct)
         {
            _loc1_ = var_80.productContainer.firstProduct.productData;
            if(_loc1_)
            {
               return _loc1_.name;
            }
         }
         return "";
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!_controller || true || true)
         {
            return null;
         }
         var _loc2_:XmlAsset = _controller.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return _controller.windowManager.buildFromXML(_loc3_);
      }
      
      public function dispose() : void
      {
         _controller = null;
         var_80 = null;
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
      }
   }
}
