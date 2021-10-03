package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_85:Number = 0;
      
      private var var_246:int = 0;
      
      private var var_1830:int = 0;
      
      private var var_1832:Number = 0;
      
      private var var_1831:Number = 0;
      
      private var var_1829:Number = 0;
      
      private var var_1834:Number = 0;
      
      private var var_1833:Boolean = false;
      
      private var var_86:Number = 0;
      
      private var _id:int = 0;
      
      private var var_227:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_227 = [];
         super();
         _id = param1;
         var_86 = param2;
         _y = param3;
         var_85 = param4;
         var_1834 = param5;
         var_246 = param6;
         var_1830 = param7;
         var_1832 = param8;
         var_1831 = param9;
         var_1829 = param10;
         var_1833 = param11;
         var_227 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_85;
      }
      
      public function get dir() : int
      {
         return var_246;
      }
      
      public function get localZ() : Number
      {
         return var_1834;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1833;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1830;
      }
      
      public function get targetX() : Number
      {
         return var_1832;
      }
      
      public function get targetY() : Number
      {
         return var_1831;
      }
      
      public function get targetZ() : Number
      {
         return var_1829;
      }
      
      public function get x() : Number
      {
         return var_86;
      }
      
      public function get actions() : Array
      {
         return var_227.slice();
      }
   }
}
