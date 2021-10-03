package com.sulake.habbo.navigator.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetStuffStatesMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   
   public class SetFurniStateTo implements ActionType
   {
       
      
      private var _navigator:HabboNavigator;
      
      public function SetFurniStateTo(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      private function prepareStateSelection(param1:IWindowContainer) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = new Array();
         for each(_loc3_ in _navigator.data.stuffStates)
         {
            _loc2_.push("" + _loc3_);
         }
         getInput(param1).populate(_loc2_);
         getInput(param1).selection = 0;
      }
      
      public function getDesc(param1:ActionDefinition) : String
      {
         return param1.stuffName + " (" + param1.stuffId + ") => " + param1.params;
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      public function readParamsFromForm(param1:IWindowContainer) : String
      {
         var _loc2_:int = getInput(param1).selection;
         var _loc3_:int = _navigator.data.stuffStates[_loc2_];
         return "" + _loc3_;
      }
      
      public function onInit(param1:IWindowContainer) : void
      {
      }
      
      public function get name() : String
      {
         return "Set furni state";
      }
      
      public function get code() : int
      {
         return ActionTypeCodes.var_2407;
      }
      
      public function onEditStart(param1:IWindowContainer, param2:int) : void
      {
         if(_navigator.data.stuffStates == null)
         {
            _navigator.send(new GetStuffStatesMessageComposer(param2));
         }
         else
         {
            prepareStateSelection(param1);
         }
      }
      
      private function getInput(param1:IWindowContainer) : IDropMenuWindow
      {
         return IDropMenuWindow(param1.findChildByName("states_dropmenu"));
      }
      
      public function get requiresFurni() : Boolean
      {
         return true;
      }
   }
}
