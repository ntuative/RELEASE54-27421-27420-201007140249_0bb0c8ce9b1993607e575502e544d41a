package com.sulake.habbo.catalog.navigation.events
{
   import flash.events.Event;
   
   public class CatalogPageOpenedEvent extends Event
   {
      
      public static const CATALOG_PAGE_OPENED:String = "CATALOG_PAGE_OPENED";
       
      
      private var var_2380:String;
      
      private var _pageId:int;
      
      public function CatalogPageOpenedEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(CATALOG_PAGE_OPENED,param3,param4);
         _pageId = param1;
         var_2380 = param2;
      }
      
      public function get pageLocalization() : String
      {
         return var_2380;
      }
      
      public function get pageId() : int
      {
         return _pageId;
      }
   }
}
