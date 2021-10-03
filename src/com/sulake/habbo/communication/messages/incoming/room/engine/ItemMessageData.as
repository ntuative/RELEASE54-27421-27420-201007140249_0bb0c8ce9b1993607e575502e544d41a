package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_85:Number = 0;
      
      private var _data:String = "";
      
      private var var_1502:int = 0;
      
      private var var_38:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1891:Boolean = false;
      
      private var var_2523:String = "";
      
      private var _id:int = 0;
      
      private var var_213:Boolean = false;
      
      private var var_246:String = "";
      
      private var var_1890:int = 0;
      
      private var var_1893:int = 0;
      
      private var var_1894:int = 0;
      
      private var var_1892:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1891 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_213)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1891;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_213)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_246;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_213)
         {
            var_1894 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_213)
         {
            var_1890 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_213)
         {
            var_1893 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_213)
         {
            var_246 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_213)
         {
            var_1892 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_213)
         {
            var_38 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1894;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_213)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1890;
      }
      
      public function get wallY() : Number
      {
         return var_1893;
      }
      
      public function get localY() : Number
      {
         return var_1892;
      }
      
      public function setReadOnly() : void
      {
         var_213 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_85;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_213)
         {
            var_85 = param1;
         }
      }
   }
}
