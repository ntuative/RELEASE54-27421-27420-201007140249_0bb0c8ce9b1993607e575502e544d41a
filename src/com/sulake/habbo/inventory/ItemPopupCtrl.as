package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1181:int = 100;
      
      private static const const_1180:int = 200;
      
      private static const const_1183:int = 180;
      
      public static const const_905:int = 1;
      
      public static const const_383:int = 2;
      
      private static const const_1182:int = 250;
      
      private static const const_830:int = 5;
       
      
      private var var_688:BitmapData;
      
      private var var_341:Timer;
      
      private var var_12:IWindowContainer;
      
      private var var_834:BitmapData;
      
      private var var_342:Timer;
      
      private var var_77:IWindowContainer;
      
      private var var_1719:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_342 = new Timer(const_1182,1);
         var_341 = new Timer(const_1181,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_77 = param1;
         var_77.visible = false;
         _assets = param2;
         var_342.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_341.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_834 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_688 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_77.visible = false;
         var_341.reset();
         var_342.reset();
         if(var_12 != null)
         {
            var_12.removeChild(var_77);
         }
      }
      
      public function hideDelayed() : void
      {
         var_341.reset();
         var_342.reset();
         var_341.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_342 != null)
         {
            var_342.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_342.stop();
            var_342 = null;
         }
         if(var_341 != null)
         {
            var_341.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_341.stop();
            var_341 = null;
         }
         _assets = null;
         var_77 = null;
         var_12 = null;
         var_688 = null;
         var_834 = null;
      }
      
      public function showDelayed() : void
      {
         var_341.reset();
         var_342.reset();
         var_342.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_77 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_12 != null)
         {
            var_12.removeChild(var_77);
         }
         var_12 = param1;
         var_1719 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_77.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_77.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1183,param3.width),Math.min(const_1180,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_77.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_77 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_77.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_905:
               _loc2_.bitmap = var_834.clone();
               _loc2_.width = var_834.width;
               _loc2_.height = var_834.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_383:
               _loc2_.bitmap = var_688.clone();
               _loc2_.width = var_688.width;
               _loc2_.height = var_688.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_341.reset();
         var_342.reset();
         if(var_12 == null)
         {
            return;
         }
         var_77.visible = true;
         var_12.addChild(var_77);
         refreshArrow(var_1719);
         switch(var_1719)
         {
            case const_905:
               var_77.x = 0 - const_830;
               break;
            case const_383:
               var_77.x = var_12.width + const_830;
         }
         var_77.y = (0 - 0) / 2;
      }
   }
}
