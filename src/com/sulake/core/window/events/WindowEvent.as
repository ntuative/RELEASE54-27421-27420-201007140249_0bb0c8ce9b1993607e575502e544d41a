package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_263:String = "WE_CHILD_RESIZED";
      
      public static const const_1201:String = "WE_CLOSE";
      
      public static const const_1197:String = "WE_DESTROY";
      
      public static const const_138:String = "WE_CHANGE";
      
      public static const const_1441:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1605:String = "WE_PARENT_RESIZE";
      
      public static const const_93:String = "WE_UPDATE";
      
      public static const const_1333:String = "WE_MAXIMIZE";
      
      public static const const_433:String = "WE_DESTROYED";
      
      public static const const_947:String = "WE_UNSELECT";
      
      public static const const_1206:String = "WE_MAXIMIZED";
      
      public static const const_1691:String = "WE_UNLOCKED";
      
      public static const const_435:String = "WE_CHILD_REMOVED";
      
      public static const const_169:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1216:String = "WE_ACTIVATE";
      
      public static const const_283:String = "WE_ENABLED";
      
      public static const const_374:String = "WE_CHILD_RELOCATED";
      
      public static const const_1275:String = "WE_CREATE";
      
      public static const const_730:String = "WE_SELECT";
      
      public static const const_178:String = "";
      
      public static const const_1502:String = "WE_LOCKED";
      
      public static const const_1534:String = "WE_PARENT_RELOCATE";
      
      public static const const_1665:String = "WE_CHILD_REMOVE";
      
      public static const const_1658:String = "WE_CHILD_RELOCATE";
      
      public static const const_1500:String = "WE_LOCK";
      
      public static const const_195:String = "WE_FOCUSED";
      
      public static const const_621:String = "WE_UNSELECTED";
      
      public static const const_887:String = "WE_DEACTIVATED";
      
      public static const const_1342:String = "WE_MINIMIZED";
      
      public static const const_1606:String = "WE_ARRANGED";
      
      public static const const_1560:String = "WE_UNLOCK";
      
      public static const const_1687:String = "WE_ATTACH";
      
      public static const const_1393:String = "WE_OPEN";
      
      public static const const_1248:String = "WE_RESTORE";
      
      public static const const_1570:String = "WE_PARENT_RELOCATED";
      
      public static const const_1223:String = "WE_RELOCATE";
      
      public static const const_1597:String = "WE_CHILD_RESIZE";
      
      public static const const_1568:String = "WE_ARRANGE";
      
      public static const const_1303:String = "WE_OPENED";
      
      public static const const_1247:String = "WE_CLOSED";
      
      public static const const_1609:String = "WE_DETACHED";
      
      public static const const_1538:String = "WE_UPDATED";
      
      public static const const_1258:String = "WE_UNFOCUSED";
      
      public static const const_423:String = "WE_RELOCATED";
      
      public static const const_1404:String = "WE_DEACTIVATE";
      
      public static const const_200:String = "WE_DISABLED";
      
      public static const const_570:String = "WE_CANCEL";
      
      public static const const_584:String = "WE_ENABLE";
      
      public static const const_1438:String = "WE_ACTIVATED";
      
      public static const const_1200:String = "WE_FOCUS";
      
      public static const const_1514:String = "WE_DETACH";
      
      public static const const_1394:String = "WE_RESTORED";
      
      public static const const_1446:String = "WE_UNFOCUS";
      
      public static const const_58:String = "WE_SELECTED";
      
      public static const const_1440:String = "WE_PARENT_RESIZED";
      
      public static const const_1310:String = "WE_CREATED";
      
      public static const const_1551:String = "WE_ATTACHED";
      
      public static const const_1267:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1726:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1488:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1726 = param3;
         var_1488 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1488;
      }
      
      public function get related() : IWindow
      {
         return var_1726;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1488 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
