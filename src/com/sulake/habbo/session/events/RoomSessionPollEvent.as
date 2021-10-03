package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_130:String = "RSPE_POLL_CONTENT";
      
      public static const const_114:String = "RSPE_POLL_OFFER";
      
      public static const const_60:String = "RSPE_POLL_ERROR";
       
      
      private var var_1040:Array = null;
      
      private var var_1237:String = "";
      
      private var var_1293:String;
      
      private var var_1236:String = "";
      
      private var var_1041:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_1040;
      }
      
      public function get startMessage() : String
      {
         return var_1237;
      }
      
      public function get summary() : String
      {
         return var_1293;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1237 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1041 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1293 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1041;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1236 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1236;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1040 = param1;
      }
   }
}
