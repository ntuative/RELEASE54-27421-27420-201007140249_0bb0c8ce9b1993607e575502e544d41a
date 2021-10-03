package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ExperienceData
   {
       
      
      private var _image:BitmapData;
      
      private var var_1847:int;
      
      private var var_975:BitmapDataAsset;
      
      private var var_2307:int;
      
      public function ExperienceData(param1:PetVisualizationData)
      {
         super();
         var_975 = param1.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset;
      }
      
      public function get alpha() : int
      {
         return var_1847;
      }
      
      public function setExperience(param1:int) : void
      {
         var _loc3_:* = null;
         if(var_2307 == param1)
         {
            return;
         }
         if(_image)
         {
            _image.dispose();
         }
         _image = (var_975.content as BitmapData).clone();
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.font = "Volter";
         _loc2_.color = 16777215;
         _loc2_.size = 9;
         _loc3_ = new TextField();
         _loc3_.embedFonts = true;
         _loc3_.width = 30;
         _loc3_.height = 12;
         _loc3_.background = true;
         _loc3_.backgroundColor = 3871388928;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.text = "+" + param1;
         var _loc4_:Matrix = new Matrix();
         _loc4_.translate(15,19);
         _image.draw(_loc3_,_loc4_);
      }
      
      public function get image() : BitmapData
      {
         if(!_image)
         {
            setExperience(0);
         }
         return _image;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1847 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
         }
         _image = null;
         var_975 = null;
      }
   }
}
