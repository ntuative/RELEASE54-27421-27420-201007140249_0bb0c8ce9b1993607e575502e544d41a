package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1785:int;
      
      private var var_1784:int = 0;
      
      private var var_1781:String;
      
      private var var_1783:int;
      
      private var var_1782:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1785 = param1;
         var_1783 = param2;
         var_1782 = param3;
         var_1781 = param4;
      }
      
      public function get length() : int
      {
         return var_1783;
      }
      
      public function get name() : String
      {
         return var_1782;
      }
      
      public function get creator() : String
      {
         return var_1781;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1784;
      }
      
      public function get id() : int
      {
         return var_1785;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1784 = param1;
      }
   }
}
