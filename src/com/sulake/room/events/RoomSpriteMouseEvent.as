package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2265:Boolean = false;
      
      private var var_2263:Boolean = false;
      
      private var var_2266:String = "";
      
      private var _type:String = "";
      
      private var var_2264:Boolean = false;
      
      private var var_1894:Number = 0;
      
      private var var_2269:Number = 0;
      
      private var var_2267:Number = 0;
      
      private var var_2268:String = "";
      
      private var var_1892:Number = 0;
      
      private var var_2262:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2268 = param2;
         var_2266 = param3;
         var_2269 = param4;
         var_2267 = param5;
         var_1894 = param6;
         var_1892 = param7;
         var_2262 = param8;
         var_2263 = param9;
         var_2264 = param10;
         var_2265 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2262;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2265;
      }
      
      public function get localX() : Number
      {
         return var_1894;
      }
      
      public function get localY() : Number
      {
         return var_1892;
      }
      
      public function get canvasId() : String
      {
         return var_2268;
      }
      
      public function get altKey() : Boolean
      {
         return var_2263;
      }
      
      public function get spriteTag() : String
      {
         return var_2266;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2269;
      }
      
      public function get screenY() : Number
      {
         return var_2267;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2264;
      }
   }
}
