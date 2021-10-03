package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class TextInputEvent extends Event
   {
       
      
      private var var_218:String;
      
      public function TextInputEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(WidgetEvent.CWE_TEXT_INPUT,param2,param3);
         var_218 = param1;
      }
      
      public function get text() : String
      {
         return var_218;
      }
   }
}
