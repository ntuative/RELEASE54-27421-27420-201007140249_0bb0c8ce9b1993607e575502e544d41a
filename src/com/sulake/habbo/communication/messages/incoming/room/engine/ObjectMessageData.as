package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_581:int = 0;
      
      private var _data:String = "";
      
      private var var_1502:int = -1;
      
      private var var_38:int = 0;
      
      private var _type:int = 0;
      
      private var var_683:int = 0;
      
      private var var_2523:String = "";
      
      private var var_1836:int = 0;
      
      private var _id:int = 0;
      
      private var var_213:Boolean = false;
      
      private var var_246:int = 0;
      
      private var var_1835:String = null;
      
      private var var_86:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_85:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_213)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_213)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_246;
      }
      
      public function get extra() : int
      {
         return var_1502;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_213)
         {
            var_246 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_213)
         {
            var_86 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_213)
         {
            var_1502 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_85;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_213)
         {
            var_38 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1836;
      }
      
      public function get staticClass() : String
      {
         return var_1835;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_213)
         {
            var_1836 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_213)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_213)
         {
            var_1835 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_213 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_213)
         {
            var_581 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_213)
         {
            var_683 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_213)
         {
            var_85 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_581;
      }
      
      public function get x() : Number
      {
         return var_86;
      }
      
      public function get sizeY() : int
      {
         return var_683;
      }
   }
}
