package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_840:String = "AssetLoaderEventUnload";
      
      public static const const_40:String = "AssetLoaderEventError";
      
      public static const const_967:String = "AssetLoaderEventOpen";
      
      public static const const_964:String = "AssetLoaderEventProgress";
      
      public static const const_973:String = "AssetLoaderEventStatus";
      
      public static const const_29:String = "AssetLoaderEventComplete";
       
      
      private var var_152:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_152 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_152;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_152);
      }
   }
}
