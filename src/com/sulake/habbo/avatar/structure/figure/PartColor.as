package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var var_1514:uint;
      
      private var _rgb:uint;
      
      private var _index:int;
      
      private var var_1558:Number;
      
      private var _b:uint;
      
      private var var_1559:Number;
      
      private var var_1513:uint;
      
      private var var_1907:int;
      
      private var var_1560:Number;
      
      private var _colorTransform:ColorTransform;
      
      private var _id:int;
      
      private var var_1906:Boolean = false;
      
      public function PartColor(param1:XML)
      {
         super();
         _id = parseInt(param1.@id);
         _index = parseInt(param1.@index);
         var_1907 = parseInt(param1.@club);
         var_1906 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         _rgb = parseInt(_loc2_,16);
         var_1514 = _rgb >> 16 & 255;
         var_1513 = _rgb >> 8 & 255;
         _b = _rgb >> 0 & 255;
         var_1560 = var_1514 / 255 * 1;
         var_1559 = var_1513 / 255 * 1;
         var_1558 = _b / 255 * 1;
         _colorTransform = new ColorTransform(var_1560,var_1559,var_1558);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return _rgb;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get blueMultiplier() : Number
      {
         return var_1558;
      }
      
      public function get r() : uint
      {
         return var_1514;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1906;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get greenMultiplier() : Number
      {
         return var_1559;
      }
      
      public function get g() : uint
      {
         return var_1513;
      }
      
      public function get redMultiplier() : Number
      {
         return var_1560;
      }
      
      public function get clubLevel() : int
      {
         return var_1907;
      }
   }
}
