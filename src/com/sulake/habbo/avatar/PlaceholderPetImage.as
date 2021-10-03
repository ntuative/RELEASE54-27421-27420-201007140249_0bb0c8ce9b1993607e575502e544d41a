package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PlaceholderPetImage extends PetImage
   {
       
      
      private var _assets:IAssetLibrary;
      
      private var var_532:Map;
      
      private var _image:BitmapData;
      
      public function PlaceholderPetImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String, param4:String, param5:IAssetLibrary)
      {
         super(param1,param2,param3,param4);
         _assets = param5;
         var_532 = new Map();
         var _loc6_:AvatarCanvas = var_83.getCanvas(var_155,var_261.definition.geometryType);
         if(_loc6_)
         {
            _image = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         }
      }
      
      override public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         if(_isDisposed)
         {
            return null;
         }
         var _loc3_:BitmapData = getPlaceHolderImage(var_94,var_155);
         if(!_loc3_ || !_image)
         {
            return null;
         }
         _image.fillRect(_image.rect,16777215);
         _image.copyPixels(_loc3_,_loc3_.rect,new Point((0 - _loc3_.width) / 2,0 - _loc3_.height),null,null,true);
         if(param2)
         {
            return _image.clone();
         }
         return _image;
      }
      
      override public function getCroppedImage(param1:String) : BitmapData
      {
         if(_isDisposed)
         {
            return null;
         }
         var _loc2_:BitmapData = getPlaceHolderImage(var_94,var_155);
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_.clone();
      }
      
      private function getPlaceHolderImage(param1:int, param2:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc3_:String = "pet_placeholder_";
         if(param2 == AvatarScaleType.SMALL)
         {
            var _loc6_:* = _loc3_ + "s";
            _loc3_ += "s";
            _loc6_;
         }
         _loc6_ = _loc3_ + param1.toString();
         _loc3_ += param1.toString();
         _loc6_;
         _loc6_ = _loc3_ + "_png";
         _loc3_ += "_png";
         _loc6_;
         var _loc4_:BitmapData = var_532.getValue(_loc3_);
         if(!_loc4_)
         {
            _loc5_ = _assets.getAssetByName(_loc3_) as BitmapDataAsset;
            _loc6_ = _loc5_.content as BitmapData;
            _loc4_ = _loc5_.content as BitmapData;
            _loc6_;
            var_532.add(_loc3_,_loc4_.clone());
            _loc4_ = var_532.getValue(_loc3_);
         }
         return _loc4_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_532)
         {
            for each(_loc1_ in var_532)
            {
            }
            var_532.dispose();
            var _loc2_:* = null;
            var_532 = null;
            _loc2_;
         }
         if(_image)
         {
            _loc2_ = null;
            _image = null;
            _loc2_;
         }
         _loc2_ = null;
         _assets = null;
         _loc2_;
         super.dispose();
      }
   }
}
