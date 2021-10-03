package com.sulake.core.runtime.events
{
   import flash.events.ProgressEvent;
   
   public class LibraryProgressEvent extends ProgressEvent
   {
       
      
      private var var_2357:String = "";
      
      private var var_1920:int = 0;
      
      public function LibraryProgressEvent(param1:String, param2:uint = 0, param3:uint = 0, param4:int = 0)
      {
         var_2357 = param1;
         var_1920 = param4;
         super(ProgressEvent.PROGRESS,false,false,param2,param3);
      }
      
      public function get fileName() : String
      {
         return var_2357;
      }
      
      public function get elapsedTime() : int
      {
         return var_1920;
      }
   }
}
