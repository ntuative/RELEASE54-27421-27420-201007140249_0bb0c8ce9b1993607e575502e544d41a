package com.sulake.habbo.navigator.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   
   public class KickTriggerer implements ActionType
   {
       
      
      public function KickTriggerer()
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
         return "Kick triggerer from room";
      }
      
      public function get code() : int
      {
         return ActionTypeCodes.var_2406;
      }
      
      public function getDesc(param1:ActionDefinition) : String
      {
         return "Kick triggerer from room";
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
