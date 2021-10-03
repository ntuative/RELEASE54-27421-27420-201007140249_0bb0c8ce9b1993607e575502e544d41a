package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2310:int;
      
      private var var_2313:String;
      
      private var var_1609:IActionDefinition;
      
      private var var_2314:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2312:String;
      
      private var var_2311:String;
      
      private var var_2282:Boolean;
      
      private var var_2316:ColorTransform;
      
      private var var_2315:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2313 = param1;
         var_2312 = param2;
         var_2310 = param3;
         _color = param4;
         _frames = param5;
         var_1609 = param6;
         var_2282 = param7;
         var_2315 = param8;
         var_2311 = param9;
         var_2314 = param10;
         var_2316 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_2282;
      }
      
      public function get partType() : String
      {
         return var_2312;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2315;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2314;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2310;
      }
      
      public function get flippedPartType() : String
      {
         return var_2311;
      }
      
      public function get bodyPartId() : String
      {
         return var_2313;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1609;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2316;
      }
   }
}
