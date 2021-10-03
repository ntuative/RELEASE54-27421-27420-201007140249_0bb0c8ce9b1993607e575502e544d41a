package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_347:Timer;
      
      protected var var_1030:String;
      
      protected var var_1029:uint;
      
      protected var var_1205:Point;
      
      protected var var_263:IToolTipWindow;
      
      protected var var_1206:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1205 = new Point();
         var_1206 = new Point(20,20);
         var_1029 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_347 != null)
         {
            var_347.stop();
            var_347.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_347 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1205);
            if(var_263 != null && true)
            {
               var_263.x = param1 + var_1206.x;
               var_263.y = param2 + var_1206.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_347 != null)
         {
            var_347.reset();
         }
         if(_window && true)
         {
            if(var_263 == null || false)
            {
               var_263 = _window.context.create("undefined::ToolTip",var_1030,WindowType.const_336,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_263.x = _loc2_.x + var_1205.x + var_1206.x;
            var_263.y = _loc2_.y + var_1205.y + var_1206.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_1030 = IInteractiveWindow(param1).toolTipCaption;
               var_1029 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_1030 = param1.caption;
               var_1029 = 500;
            }
            _mouse.x = var_125.mouseX;
            _mouse.y = var_125.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1205);
            if(var_1030 != null && var_1030 != "")
            {
               if(var_347 == null)
               {
                  var_347 = new Timer(var_1029,1);
                  var_347.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_347.reset();
               var_347.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_263 != null && true)
         {
            var_263.destroy();
            var_263 = null;
         }
      }
   }
}
