package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_387:int = 0;
      
      public static const const_116:int = 2;
      
      public static const const_161:int = 1;
      
      public static const const_667:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_2152:Boolean;
      
      private var var_2151:Boolean;
      
      private var var_2154:int;
      
      private var var_2149:Array;
      
      private var var_2155:int;
      
      private var var_2147:Boolean;
      
      private var var_1344:String;
      
      private var var_2150:int;
      
      private var var_2153:Boolean;
      
      private var var_2148:int;
      
      private var var_1233:int;
      
      private var _roomId:int;
      
      private var var_693:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_2150;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2150 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_2153 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_693;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2147;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2155 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2149 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_693 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2152;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2151;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2154;
      }
      
      public function get categoryId() : int
      {
         return var_1233;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2147 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_2153;
      }
      
      public function get controllerCount() : int
      {
         return var_2155;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2149;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2148 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2152 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2151 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2154 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_2148;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1233 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1344 = param1;
      }
      
      public function get description() : String
      {
         return var_1344;
      }
   }
}
