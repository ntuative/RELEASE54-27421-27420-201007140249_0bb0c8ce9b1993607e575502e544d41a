package com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   
   public class TriggerOnce implements TriggerConf
   {
       
      
      public function TriggerOnce()
      {
         super();
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      public function get name() : String
      {
         return "Trigger at given time";
      }
      
      public function get code() : int
      {
         return TriggerConfCodes.var_2408;
      }
      
      public function getDesc(param1:TriggerDefinition) : String
      {
         var _loc2_:int = int(param1.params);
         if(_loc2_ % 2 == 0)
         {
         }
         return "Trigger at " + getSecsFromPulses(param1) + " secs";
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
      }
      
      public function readParamsFromForm(param1:IWindowContainer) : String
      {
         var _loc2_:int = getInput(param1).selection;
         return "" + _loc2_;
      }
      
      public function onInit(param1:IWindowContainer) : void
      {
         preparePulseSelection(param1);
      }
      
      public function onEditStart(param1:IWindowContainer) : void
      {
         getInput(param1).selection = 0;
      }
      
      private function preparePulseSelection(param1:IWindowContainer) : void
      {
         var _loc2_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < 10)
         {
            _loc2_.push("at " + _loc4_ + " secs");
            _loc2_.push("at " + _loc4_ + ".5 secs");
            _loc4_++;
         }
         getInput(param1).populate(_loc2_);
         getInput(param1).selection = 0;
      }
      
      private function getInput(param1:IWindowContainer) : IDropMenuWindow
      {
         return IDropMenuWindow(param1.findChildByName("pulses_dropmenu"));
      }
      
      public function getSecsFromPulses(param1:TriggerDefinition) : String
      {
         var _loc2_:int = int(param1.params);
         var _loc3_:int = Math.floor(_loc2_ / 2);
         if(_loc2_ % 2 == 0)
         {
            return "" + _loc3_;
         }
         return _loc3_ + ".5";
      }
   }
}
