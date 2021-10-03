package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1935:Number;
      
      private var var_616:Number = 0;
      
      private var var_1936:Number;
      
      private var var_615:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1935 = param1;
         var_1936 = param2;
      }
      
      public function update() : void
      {
         var_615 += var_1936;
         var_616 += var_615;
         if(var_616 > 0)
         {
            var_616 = 0;
            var_615 = var_1935 * -1 * var_615;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_615 = param1;
         var_616 = 0;
      }
      
      public function get location() : Number
      {
         return var_616;
      }
   }
}
