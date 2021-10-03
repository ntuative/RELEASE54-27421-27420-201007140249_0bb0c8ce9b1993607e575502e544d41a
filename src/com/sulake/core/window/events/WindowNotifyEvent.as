package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1276:String = "WN_CREATED";
      
      public static const const_1027:String = "WN_DISABLE";
      
      public static const const_1060:String = "WN_DEACTIVATED";
      
      public static const const_980:String = "WN_OPENED";
      
      public static const const_1026:String = "WN_CLOSED";
      
      public static const const_950:String = "WN_DESTROY";
      
      public static const const_1627:String = "WN_ARRANGED";
      
      public static const const_473:String = "WN_PARENT_RESIZED";
      
      public static const const_960:String = "WN_ENABLE";
      
      public static const const_868:String = "WN_RELOCATE";
      
      public static const const_1047:String = "WN_FOCUS";
      
      public static const const_867:String = "WN_PARENT_RELOCATED";
      
      public static const const_401:String = "WN_PARAM_UPDATED";
      
      public static const const_590:String = "WN_PARENT_ACTIVATED";
      
      public static const const_182:String = "WN_RESIZED";
      
      public static const const_952:String = "WN_CLOSE";
      
      public static const const_959:String = "WN_PARENT_REMOVED";
      
      public static const const_252:String = "WN_CHILD_RELOCATED";
      
      public static const const_660:String = "WN_ENABLED";
      
      public static const const_250:String = "WN_CHILD_RESIZED";
      
      public static const const_902:String = "WN_MINIMIZED";
      
      public static const const_583:String = "WN_DISABLED";
      
      public static const const_239:String = "WN_CHILD_ACTIVATED";
      
      public static const const_501:String = "WN_STATE_UPDATED";
      
      public static const const_632:String = "WN_UNSELECTED";
      
      public static const const_461:String = "WN_STYLE_UPDATED";
      
      public static const const_1562:String = "WN_UPDATE";
      
      public static const const_412:String = "WN_PARENT_ADDED";
      
      public static const const_756:String = "WN_RESIZE";
      
      public static const const_727:String = "WN_CHILD_REMOVED";
      
      public static const const_1630:String = "";
      
      public static const const_921:String = "WN_RESTORED";
      
      public static const const_315:String = "WN_SELECTED";
      
      public static const const_900:String = "WN_MINIMIZE";
      
      public static const const_1000:String = "WN_FOCUSED";
      
      public static const const_1352:String = "WN_LOCK";
      
      public static const const_342:String = "WN_CHILD_ADDED";
      
      public static const const_954:String = "WN_UNFOCUSED";
      
      public static const const_500:String = "WN_RELOCATED";
      
      public static const const_863:String = "WN_DEACTIVATE";
      
      public static const const_1205:String = "WN_CRETAE";
      
      public static const const_841:String = "WN_RESTORE";
      
      public static const const_303:String = "WN_ACTVATED";
      
      public static const const_1220:String = "WN_LOCKED";
      
      public static const const_458:String = "WN_SELECT";
      
      public static const const_872:String = "WN_MAXIMIZE";
      
      public static const const_1004:String = "WN_OPEN";
      
      public static const const_636:String = "WN_UNSELECT";
      
      public static const const_1498:String = "WN_ARRANGE";
      
      public static const const_1231:String = "WN_UNLOCKED";
      
      public static const const_1727:String = "WN_UPDATED";
      
      public static const const_873:String = "WN_ACTIVATE";
      
      public static const const_1312:String = "WN_UNLOCK";
      
      public static const const_1008:String = "WN_MAXIMIZED";
      
      public static const const_857:String = "WN_DESTROYED";
      
      public static const const_1055:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1726,cancelable);
      }
   }
}
