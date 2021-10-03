package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1371:String = "F";
      
      public static const const_906:String = "M";
       
      
      private var var_86:Number = 0;
      
      private var var_409:String = "";
      
      private var var_2131:int = 0;
      
      private var var_2136:String = "";
      
      private var var_2132:int = 0;
      
      private var var_2134:int = 0;
      
      private var var_2133:String = "";
      
      private var var_629:String = "";
      
      private var _id:int = 0;
      
      private var var_213:Boolean = false;
      
      private var var_246:int = 0;
      
      private var var_2130:String = "";
      
      private var _name:String = "";
      
      private var var_2135:int = 0;
      
      private var _y:Number = 0;
      
      private var var_85:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_85;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_246;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_213)
         {
            var_246 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_213)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2131;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_213)
         {
            var_2132 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2130;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_213)
         {
            var_2133 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_213)
         {
            var_2130 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_213)
         {
            var_2134 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_213)
         {
            var_409 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_213)
         {
            var_2131 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_213)
         {
            var_629 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_2132;
      }
      
      public function get groupID() : String
      {
         return var_2133;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_213)
         {
            var_2135 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_213)
         {
            var_2136 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_213 = true;
      }
      
      public function get sex() : String
      {
         return var_629;
      }
      
      public function get figure() : String
      {
         return var_409;
      }
      
      public function get webID() : int
      {
         return var_2135;
      }
      
      public function get custom() : String
      {
         return var_2136;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_213)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_213)
         {
            var_85 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_213)
         {
            var_86 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_86;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_2134;
      }
   }
}
