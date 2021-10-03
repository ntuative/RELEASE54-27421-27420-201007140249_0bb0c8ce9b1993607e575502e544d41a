package com.sulake.habbo.navigator.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   
   public interface ActionType
   {
       
      
      function get requiresFurni() : Boolean;
      
      function getDesc(param1:ActionDefinition) : String;
      
      function get hasSpecialInputs() : Boolean;
      
      function onEditStart(param1:IWindowContainer, param2:int) : void;
      
      function readParamsFromForm(param1:IWindowContainer) : String;
      
      function get name() : String;
      
      function get code() : int;
      
      function onInit(param1:IWindowContainer) : void;
   }
}
