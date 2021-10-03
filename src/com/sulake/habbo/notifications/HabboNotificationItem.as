package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_82:HabboNotificationItemStyle;
      
      private var var_22:String;
      
      private var var_25:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         var_22 = param1;
         var_82 = param2;
         var_25 = param3;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_82.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(var_25 != null)
            {
               var_25.onExecuteLink(_loc2_);
            }
         }
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return var_82;
      }
      
      public function get content() : String
      {
         return var_22;
      }
   }
}
