package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class SelectableButtonController extends ButtonController implements ISelectableWindow
   {
       
      
      public function SelectableButtonController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         setStateFlag(WindowState.WINDOW_STATE_SELECTED,param1);
      }
      
      public function get selector() : ISelectorWindow
      {
         var _loc1_:* = null;
         if(var_12)
         {
            _loc1_ = var_12 as WindowController;
            while(_loc1_)
            {
               if(_loc1_ is ISelectorWindow)
               {
                  return _loc1_ as ISelectorWindow;
               }
               _loc1_ = _loc1_.parent;
            }
         }
         return null;
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:* = null;
         if(param2.type == WindowNotifyEvent.const_303)
         {
            if(var_12)
            {
               if(!(var_12 is ISelectorWindow))
               {
                  _loc3_ = var_12.parent as WindowController;
                  while(_loc3_)
                  {
                     if(_loc3_ is ISelectorWindow)
                     {
                        _loc3_.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_239,this,null));
                        break;
                     }
                     _loc3_ = _loc3_.parent as WindowController;
                  }
               }
            }
         }
         return super.update(param1,param2);
      }
      
      public function select() : Boolean
      {
         if(getStateFlag(WindowState.WINDOW_STATE_SELECTED))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_458,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.WINDOW_STATE_SELECTED,true);
         _loc1_.type = WindowNotifyEvent.const_315;
         update(this,_loc1_);
         return true;
      }
      
      public function get isSelected() : Boolean
      {
         return testStateFlag(WindowState.WINDOW_STATE_SELECTED);
      }
      
      public function unselect() : Boolean
      {
         if(!getStateFlag(WindowState.WINDOW_STATE_SELECTED))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_636,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.WINDOW_STATE_SELECTED,false);
         _loc1_.type = WindowNotifyEvent.const_632;
         update(this,_loc1_);
         return true;
      }
   }
}
