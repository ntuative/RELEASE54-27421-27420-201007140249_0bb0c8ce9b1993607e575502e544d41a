package com.sulake.habbo.widget.furniture.dimmer
{
   public class DimmerFurniWidgetPresetItem
   {
       
      
      private var _id:int = 0;
      
      private var _color:uint = 0;
      
      private var var_1277:uint = 0;
      
      private var _type:int = 0;
      
      public function DimmerFurniWidgetPresetItem(param1:int, param2:int, param3:uint, param4:uint)
      {
         super();
         _id = param1;
         _type = param2;
         _color = param3;
         var_1277 = param4;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set light(param1:uint) : void
      {
         var_1277 = param1;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get light() : uint
      {
         return var_1277;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
   }
}
