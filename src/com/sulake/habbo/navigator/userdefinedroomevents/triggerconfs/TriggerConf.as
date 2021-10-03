package com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   
   public interface TriggerConf
   {
       
      
      function get requiresFurni() : Boolean;
      
      function getDesc(param1:TriggerDefinition) : String;
      
      function get hasSpecialInputs() : Boolean;
      
      function onEditStart(param1:IWindowContainer) : void;
      
      function readParamsFromForm(param1:IWindowContainer) : String;
      
      function get name() : String;
      
      function get code() : int;
      
      function onInit(param1:IWindowContainer) : void;
   }
}
