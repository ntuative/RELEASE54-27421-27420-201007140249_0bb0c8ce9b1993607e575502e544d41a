package com.sulake.habbo.navigator.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   
   public class ToggleFurniState implements ActionType
   {
       
      
      public function ToggleFurniState()
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
         return "Toggle furni state";
      }
      
      public function get code() : int
      {
         return ActionTypeCodes.var_2411;
      }
      
      public function getDesc(param1:ActionDefinition) : String
      {
         return "Toggle furni " + param1.stuffName + " (" + param1.stuffId + ") state";
      }
      
      public function get requiresFurni() : Boolean
      {
         return true;
      }
      
      public function onInit(param1:IWindowContainer) : void
      {
      }
   }
}
