package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_430:String = "RSQE_QUEUE_STATUS";
      
      public static const const_936:int = 2;
      
      public static const const_958:String = "c";
      
      public static const const_1395:String = "d";
      
      public static const const_897:int = 1;
       
      
      private var var_1306:Map;
      
      private var _name:String;
      
      private var var_2538:String;
      
      private var var_268:Boolean;
      
      private var _target:int;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_430,param1,param5,param6);
         _name = param2;
         _target = param3;
         var_1306 = new Map();
         var_268 = param4;
      }
      
      public function getQueueSize(param1:String) : int
      {
         return var_1306.getValue(param1);
      }
      
      public function get queueTypes() : Array
      {
         return var_1306.getKeys();
      }
      
      public function get queueSetTarget() : int
      {
         return _target;
      }
      
      public function get isActive() : Boolean
      {
         return var_268;
      }
      
      public function get queueSetName() : String
      {
         return _name;
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         var_1306.add(param1,param2);
      }
   }
}
