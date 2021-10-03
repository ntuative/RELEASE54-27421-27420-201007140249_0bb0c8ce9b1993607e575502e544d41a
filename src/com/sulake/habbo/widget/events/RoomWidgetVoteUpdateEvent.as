package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_115:String = "RWPUE_VOTE_RESULT";
      
      public static const const_126:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1280:int;
      
      private var var_1058:String;
      
      private var var_735:Array;
      
      private var var_1063:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1058 = param2;
         var_1063 = param3;
         var_735 = param4;
         if(var_735 == null)
         {
            var_735 = [];
         }
         var_1280 = param5;
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
