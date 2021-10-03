package com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   
   public class UseStuffAndStateSnapshotMatches implements TriggerConf
   {
       
      
      public function UseStuffAndStateSnapshotMatches()
      {
         super();
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return false;
      }
      
      public function get name() : String
      {
         return "Furni states match snapshot";
      }
      
      public function get code() : int
      {
         return TriggerConfCodes.var_2410;
      }
      
      public function getDesc(param1:TriggerDefinition) : String
      {
         return "Furni states match snapshot";
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
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
