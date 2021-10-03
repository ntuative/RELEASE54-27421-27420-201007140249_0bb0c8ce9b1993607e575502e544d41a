package com.sulake.habbo.navigator.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   
   public class MoveFurni implements ActionType
   {
       
      
      public function MoveFurni()
      {
         super();
      }
      
      public function onEditStart(param1:IWindowContainer, param2:int) : void
      {
         getMoveInput(param1).selection = 0;
         getRotateInput(param1).selection = 0;
      }
      
      private function prepareRotateSelection(param1:IWindowContainer) : void
      {
         var _loc2_:Array = new Array();
         _loc2_.push("Keep current orientation");
         _loc2_.push("Rotate clockwise");
         _loc2_.push("Rotate counter clockwise");
         _loc2_.push("Rotate randomly");
         _loc2_.push("Orient due north");
         _loc2_.push("Orient due east");
         _loc2_.push("Orient due south");
         _loc2_.push("Orient due west");
         getRotateInput(param1).populate(_loc2_);
         getRotateInput(param1).selection = 0;
      }
      
      private function getMoveInput(param1:IWindowContainer) : IDropMenuWindow
      {
         return IDropMenuWindow(param1.findChildByName("move_dropmenu"));
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      public function readParamsFromForm(param1:IWindowContainer) : String
      {
         var _loc2_:int = getMoveInput(param1).selection;
         var _loc3_:int = getRotateInput(param1).selection;
         return _loc2_ + "," + _loc3_;
      }
      
      public function get name() : String
      {
         return "Move/rotate furni";
      }
      
      private function prepareMoveSelection(param1:IWindowContainer) : void
      {
         var _loc2_:Array = new Array();
         _loc2_.push("Keep current location");
         _loc2_.push("Move randomly");
         _loc2_.push("Move randomly horizontally");
         _loc2_.push("Move randomly vertically");
         _loc2_.push("Move north");
         _loc2_.push("Move east");
         _loc2_.push("Move south");
         _loc2_.push("Move west");
         getMoveInput(param1).populate(_loc2_);
         getMoveInput(param1).selection = 0;
      }
      
      public function get code() : int
      {
         return ActionTypeCodes.var_2403;
      }
      
      public function getDesc(param1:ActionDefinition) : String
      {
         return "Move/rotate furni " + param1.stuffName + " (" + param1.stuffId + ")";
      }
      
      public function get requiresFurni() : Boolean
      {
         return true;
      }
      
      public function onInit(param1:IWindowContainer) : void
      {
         prepareRotateSelection(param1);
         prepareMoveSelection(param1);
      }
      
      private function getRotateInput(param1:IWindowContainer) : IDropMenuWindow
      {
         return IDropMenuWindow(param1.findChildByName("rotate_dropmenu"));
      }
   }
}
