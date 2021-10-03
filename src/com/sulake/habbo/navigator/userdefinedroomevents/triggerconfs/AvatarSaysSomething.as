package com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   
   public class AvatarSaysSomething implements TriggerConf
   {
       
      
      public function AvatarSaysSomething()
      {
         super();
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      public function get name() : String
      {
         return "Avatar says something";
      }
      
      public function get code() : int
      {
         return TriggerConfCodes.var_2401;
      }
      
      public function getDesc(param1:TriggerDefinition) : String
      {
         return "Say: " + param1.params;
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
      }
      
      public function readParamsFromForm(param1:IWindowContainer) : String
      {
         return getInput(param1).text;
      }
      
      public function onInit(param1:IWindowContainer) : void
      {
      }
      
      public function onEditStart(param1:IWindowContainer) : void
      {
         getInput(param1).text = "";
      }
      
      private function getInput(param1:IWindowContainer) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("chat_txt"));
      }
   }
}
