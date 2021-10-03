package com.sulake.habbo.navigator.userdefinedroomevents.actiontypes
{
   import com.sulake.habbo.navigator.HabboNavigator;
   
   public class ActionTypes
   {
       
      
      private var _types:Array;
      
      public function ActionTypes(param1:HabboNavigator)
      {
         _types = new Array();
         super();
         this._types.push(new ToggleFurniState());
         this._types.push(new Reset());
         this._types.push(new KickTriggerer());
         this._types.push(new SetFurniStateTo(param1));
         this._types.push(new MoveFurni());
         this._types.push(new SetStateSnapshot());
      }
      
      public function get types() : Array
      {
         return _types;
      }
      
      public function getByCode(param1:int) : ActionType
      {
         var _loc2_:* = null;
         for each(_loc2_ in _types)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
