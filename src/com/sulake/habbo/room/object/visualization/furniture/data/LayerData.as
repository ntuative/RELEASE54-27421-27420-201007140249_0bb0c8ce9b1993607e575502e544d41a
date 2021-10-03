package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_421:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_450:int = 0;
      
      public static const const_1012:int = 2;
      
      public static const const_842:int = 1;
      
      public static const const_705:Boolean = false;
      
      public static const const_747:String = "";
      
      public static const const_406:int = 0;
      
      public static const const_484:int = 0;
      
      public static const const_456:int = 0;
       
      
      private var var_1850:int = 0;
      
      private var var_1851:String = "";
      
      private var var_1605:int = 0;
      
      private var var_1849:int = 0;
      
      private var var_1848:Number = 0;
      
      private var var_1847:int = 255;
      
      private var var_1852:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1850;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1605 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1848;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1849 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1850 = param1;
      }
      
      public function get tag() : String
      {
         return var_1851;
      }
      
      public function get alpha() : int
      {
         return var_1847;
      }
      
      public function get ink() : int
      {
         return var_1605;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1848 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1849;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1852 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1852;
      }
      
      public function set tag(param1:String) : void
      {
         var_1851 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1847 = param1;
      }
   }
}
