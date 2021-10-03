package com.sulake.habbo.navigator.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   
   public class Reset implements ActionType
   {
       
      
      public function Reset()
      {
         super();
      }
      
      public function onEditStart(param1:IWindowContainer, param2:int) : void
      {
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return false;
      }
      
      public function readParamsFromForm(param1:IWindowContainer) : String
      {
         return "";
      }
      
      public function get name() : String
      {
         return "Reset timers";
      }
      
      public function get code() : int
      {
         return ActionTypeCodes.var_2412;
      }
      
      public function getDesc(param1:ActionDefinition) : String
      {
         return "Reset timers";
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
      }
      
      public function onInit(param1:IWindowContainer) : void
      {
      }
   }
}
