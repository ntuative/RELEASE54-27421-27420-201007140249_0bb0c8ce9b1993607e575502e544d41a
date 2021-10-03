package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_409:String = "";
      
      private var var_2136:String = "";
      
      private var var_2132:int = 0;
      
      private var var_2134:int = 0;
      
      private var _type:int = 0;
      
      private var var_2133:String = "";
      
      private var var_629:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_2135:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_2132 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_2133 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_409 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_629 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_2132;
      }
      
      public function set webID(param1:int) : void
      {
         var_2135 = param1;
      }
      
      public function get groupID() : String
      {
         return var_2133;
      }
      
      public function set custom(param1:String) : void
      {
         var_2136 = param1;
      }
      
      public function get figure() : String
      {
         return var_409;
      }
      
      public function get sex() : String
      {
         return var_629;
      }
      
      public function get custom() : String
      {
         return var_2136;
      }
      
      public function get webID() : int
      {
         return var_2135;
      }
      
      public function set xp(param1:int) : void
      {
         var_2134 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_2134;
      }
   }
}
