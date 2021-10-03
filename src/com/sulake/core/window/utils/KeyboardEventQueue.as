package com.sulake.core.window.utils
{
   import flash.events.FocusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   
   public class KeyboardEventQueue extends GenericEventQueue
   {
       
      
      public function KeyboardEventQueue(param1:IEventDispatcher)
      {
         super(param1);
         var_68.addEventListener(KeyboardEvent.KEY_DOWN,keyEventListener,false);
         var_68.addEventListener(KeyboardEvent.KEY_UP,keyEventListener,false);
         var_68.addEventListener(FocusEvent.FOCUS_IN,focusEventListener,false);
         var_68.addEventListener(FocusEvent.FOCUS_OUT,focusEventListener,false);
         var_68.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,focusEventListener,false);
         var_68.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,focusEventListener,false);
      }
      
      private function keyEventListener(param1:KeyboardEvent) : void
      {
         var_304.push(param1);
      }
      
      private function focusEventListener(param1:FocusEvent) : void
      {
         var_304.push(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            var_68.removeEventListener(KeyboardEvent.KEY_DOWN,keyEventListener,false);
            var_68.removeEventListener(KeyboardEvent.KEY_UP,keyEventListener,false);
            var_68.removeEventListener(FocusEvent.FOCUS_IN,focusEventListener,false);
            var_68.removeEventListener(FocusEvent.FOCUS_OUT,focusEventListener,false);
            var_68.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,focusEventListener,false);
            var_68.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,focusEventListener,false);
            super.dispose();
         }
      }
   }
}
