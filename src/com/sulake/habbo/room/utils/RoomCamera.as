package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_369:Number = 0.5;
      
      private static const const_789:int = 3;
      
      private static const const_1119:Number = 1;
       
      
      private var var_2053:Boolean = false;
      
      private var var_2050:Boolean = false;
      
      private var var_1113:int = 0;
      
      private var var_285:Vector3d = null;
      
      private var var_2052:int = 0;
      
      private var var_2055:int = 0;
      
      private var var_2054:Boolean = false;
      
      private var var_2048:int = -2;
      
      private var var_2051:Boolean = false;
      
      private var var_2046:int = 0;
      
      private var var_2049:int = -1;
      
      private var var_434:Vector3d = null;
      
      private var var_2047:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_2052;
      }
      
      public function get targetId() : int
      {
         return var_2049;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_2046 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_2052 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_2053 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_2049 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_2050 = param1;
      }
      
      public function dispose() : void
      {
         var_434 = null;
         var_285 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_434 == null)
         {
            var_434 = new Vector3d();
         }
         var_434.assign(param1);
         var_1113 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_2048;
      }
      
      public function get screenHt() : int
      {
         return var_2047;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_2055 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_285;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_2047 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_2046;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_2053;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_2050;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_434 != null && var_285 != null)
         {
            ++var_1113;
            _loc2_ = Vector3d.dif(var_434,var_285);
            if(_loc2_.length <= const_369)
            {
               var_285 = var_434;
               var_434 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_369 * (const_789 + 1))
               {
                  _loc2_.mul(const_369);
               }
               else if(var_1113 <= const_789)
               {
                  _loc2_.mul(const_369);
               }
               else
               {
                  _loc2_.mul(const_1119);
               }
               var_285 = Vector3d.sum(var_285,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_2054 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_2055;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_2051 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_2048 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_285 != null)
         {
            return;
         }
         var_285 = new Vector3d();
         var_285.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_2054;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_2051;
      }
   }
}
