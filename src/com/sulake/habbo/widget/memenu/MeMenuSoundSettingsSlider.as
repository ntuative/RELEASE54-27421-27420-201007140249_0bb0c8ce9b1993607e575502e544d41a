package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSoundSettingsSlider
   {
       
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_993:MeMenuSoundSettingsView;
      
      private var var_1108:Number = 1.0;
      
      private var var_632:BitmapData;
      
      private var var_631:BitmapData;
      
      private var var_1589:int;
      
      private var var_764:Number = 0.0;
      
      public function MeMenuSoundSettingsSlider(param1:MeMenuSoundSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0.0, param5:Number = 1.0)
      {
         super();
         var_993 = param1;
         _sliderContainer = param2;
         var_764 = param4;
         var_1108 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(var_1589 * (Number(param1 - var_764) / (var_1108 - var_764)));
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_632 != null)
         {
            _loc2_.bitmap = new BitmapData(var_632.width,var_632.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_632,var_632.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_631 != null)
            {
               _loc2_.bitmap = new BitmapData(var_631.width,var_631.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_631,var_631.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1589 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_632 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         var_631 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_1108 = param1;
         setValue(var_993.volume);
      }
      
      public function set min(param1:Number) : void
      {
         var_764 = param1;
         setValue(var_993.volume);
      }
      
      public function setValue(param1:Number) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_423)
         {
            return;
         }
         var_993.saveVolume(getValue(param2.x),false);
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / var_1589 * (var_1108 - var_764) + var_764;
      }
      
      public function dispose() : void
      {
         var_993 = null;
         _sliderContainer = null;
         var_632 = null;
         var_631 = null;
      }
   }
}
