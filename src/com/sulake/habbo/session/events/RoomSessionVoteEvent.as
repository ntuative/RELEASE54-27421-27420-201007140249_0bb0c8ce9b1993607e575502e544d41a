package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_115:String = "RSPE_VOTE_RESULT";
      
      public static const const_126:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1280:int = 0;
      
      private var var_1058:String = "";
      
      private var var_735:Array;
      
      private var var_1063:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1063 = [];
         var_735 = [];
         super(param1,param2,param7,param8);
         var_1058 = param3;
         var_1063 = param4;
         var_735 = param5;
         if(var_735 == null)
         {
            var_735 = [];
         }
         var_1280 = param6;
      }
      
      public function get votes() : Array
      {
         return var_735.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1280;
      }
      
      public function get question() : String
      {
         return var_1058;
      }
      
      public function get choices() : Array
      {
         return var_1063.slice();
      }
   }
}
