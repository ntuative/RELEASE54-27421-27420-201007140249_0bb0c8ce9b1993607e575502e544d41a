package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_443:int;
      
      private var var_187:String;
      
      private var var_218:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_187 = param1;
         var_218 = param2;
         var_443 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_218.text = var_187.substring(0,param1) + "...";
         return var_218.textWidth > var_443;
      }
   }
}
