package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPresentEvent extends RoomSessionEvent
   {
      
      public static const const_282:String = "RSPE_PRESENT_OPENED";
       
      
      private var var_1380:int = 0;
      
      private var var_1128:String = "";
      
      public function RoomSessionPresentEvent(param1:String, param2:IRoomSession, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param2,param5,param6);
         var_1380 = param3;
         var_1128 = param4;
      }
      
      public function get classId() : int
      {
         return var_1380;
      }
      
      public function get itemType() : String
      {
         return var_1128;
      }
   }
}
