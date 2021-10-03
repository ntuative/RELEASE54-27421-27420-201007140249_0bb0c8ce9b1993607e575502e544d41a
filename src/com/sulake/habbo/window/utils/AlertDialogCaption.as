package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_390:Boolean;
      
      private var var_218:String;
      
      private var var_1446:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_218 = param1;
         var_1446 = param2;
         var_390 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1446;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_390 = param1;
      }
      
      public function get text() : String
      {
         return var_218;
      }
      
      public function get visible() : Boolean
      {
         return var_390;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1446 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_218 = param1;
      }
   }
}
