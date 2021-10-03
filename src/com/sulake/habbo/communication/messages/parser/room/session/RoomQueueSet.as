package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.utils.Map;
   
   public class RoomQueueSet
   {
       
      
      private var _target:int;
      
      private var var_1306:Map;
      
      private var _name:String;
      
      public function RoomQueueSet(param1:String, param2:int)
      {
         super();
         _name = param1;
         _target = param2;
         var_1306 = new Map();
      }
      
      public function get target() : int
      {
         return _target;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function getQueueSize(param1:String) : int
      {
         return var_1306.getValue(param1);
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         var_1306.add(param1,param2);
      }
      
      public function get queueTypes() : Array
      {
         return var_1306.getKeys();
      }
   }
}
