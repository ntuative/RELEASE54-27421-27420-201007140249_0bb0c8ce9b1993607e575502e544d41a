package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_284:uint = 1;
      
      public static const const_467:uint = 0;
      
      public static const const_1051:uint = 8;
      
      public static const const_270:uint = 4;
      
      public static const const_388:uint = 2;
       
      
      private var var_472:uint;
      
      private var var_2219:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2218:uint;
      
      private var var_103:Rectangle;
      
      private var var_693:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_103 = param3;
         _color = param4;
         var_472 = param5;
         var_2219 = param6;
         var_2218 = param7;
         var_693 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2219;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_472;
      }
      
      public function get scaleV() : uint
      {
         return var_2218;
      }
      
      public function get tags() : Array
      {
         return var_693;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_103 = null;
         var_693 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_103;
      }
   }
}
