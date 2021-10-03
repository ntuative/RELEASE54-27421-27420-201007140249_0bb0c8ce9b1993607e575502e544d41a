package com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   
   public class AvatarExitsStuff implements TriggerConf
   {
       
      
      public function AvatarExitsStuff()
      {
         super();
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return false;
      }
      
      public function get name() : String
      {
         return "Avatar walks off furni";
      }
      
      public function get code() : int
      {
         return TriggerConfCodes.var_2409;
      }
      
      public function getDesc(param1:TriggerDefinition) : String
      {
         return "Walk off " + param1.stuffName + " (" + param1.stuffId + ")";
      }
      
      public function get requiresFurni() : Boolean
      {
         return true;
      }
      
      public function readParamsFromForm(param1:IWindowContainer) : String
      {
         return "";
      }
      
      public function onInit(param1:IWindowContainer) : void
      {
      }
      
      public function onEditStart(param1:IWindowContainer) : void
      {
      }
   }
}
