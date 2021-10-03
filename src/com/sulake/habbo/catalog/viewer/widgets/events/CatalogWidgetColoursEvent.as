package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1464:Array;
      
      private var var_2297:String;
      
      private var var_2295:String;
      
      private var var_2296:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1464 = param1;
         var_2297 = param2;
         var_2295 = param3;
         var_2296 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1464;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_2297;
      }
      
      public function get colourAssetName() : String
      {
         return var_2295;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_2296;
      }
   }
}
