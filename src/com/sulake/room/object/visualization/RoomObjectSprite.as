package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1352:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_2086:Boolean = false;
      
      private var var_2084:String = "normal";
      
      private var var_1305:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_390:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_1847:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1126:Boolean = false;
      
      private var var_1125:Boolean = false;
      
      private var var_2087:Boolean = false;
      
      private var _offset:Point;
      
      private var var_2085:Boolean = true;
      
      private var var_1127:Number = 0;
      
      private var _width:int = 0;
      
      private var var_1851:String = "";
      
      private var var_975:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
         _instanceId = var_1352++;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_1125 = param1;
         ++_updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_2087 = param1;
         ++_updateID;
      }
      
      public function dispose() : void
      {
         var_975 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_2084 = param1;
         ++_updateID;
      }
      
      public function set tag(param1:String) : void
      {
         var_1851 = param1;
         ++_updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1305 = param1;
         ++_updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_2086;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
         ++_updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
         ++_updateID;
      }
      
      public function get relativeDepth() : Number
      {
         return var_1127;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get alpha() : int
      {
         return var_1847;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_2085 = param1;
         ++_updateID;
      }
      
      public function get visible() : Boolean
      {
         return var_390;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_2086 = param1;
         ++_updateID;
      }
      
      public function get flipH() : Boolean
      {
         return var_1126;
      }
      
      public function get flipV() : Boolean
      {
         return var_1125;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_2087;
      }
      
      public function get blendMode() : String
      {
         return var_2084;
      }
      
      public function get instanceId() : int
      {
         return _instanceId;
      }
      
      public function get tag() : String
      {
         return var_1851;
      }
      
      public function get assetName() : String
      {
         return var_1305;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_1127 = param1;
         ++_updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_2085;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         var_1847 = param1;
         ++_updateID;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get updateId() : int
      {
         return _updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         _color = param1;
         ++_updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            _width = param1.width;
            _height = param1.height;
         }
         var_975 = param1;
         ++_updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_390 = param1;
         ++_updateID;
      }
      
      public function get asset() : BitmapData
      {
         return var_975;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_1126 = param1;
         ++_updateID;
      }
   }
}
