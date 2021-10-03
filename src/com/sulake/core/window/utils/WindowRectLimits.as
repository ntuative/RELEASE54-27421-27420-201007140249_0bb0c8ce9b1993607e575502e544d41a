package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_442:int = -2.147483648E9;
      
      private var var_443:int = 2.147483647E9;
      
      private var var_444:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      private var var_441:int = -2.147483648E9;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_443;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_441 == int.MIN_VALUE && var_443 == int.MAX_VALUE && var_442 == int.MIN_VALUE && var_444 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_443 = param1;
         if(var_443 < int.MAX_VALUE && true && _target.width > var_443)
         {
            _target.width = var_443;
         }
      }
      
      public function setEmpty() : void
      {
         var_441 = int.MIN_VALUE;
         var_443 = int.MAX_VALUE;
         var_442 = int.MIN_VALUE;
         var_444 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_444 = param1;
         if(var_444 < int.MAX_VALUE && true && _target.height > var_444)
         {
            _target.height = var_444;
         }
      }
      
      public function get minHeight() : int
      {
         return var_442;
      }
      
      public function get minWidth() : int
      {
         return var_441;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_441 = var_441;
         _loc2_.var_443 = var_443;
         _loc2_.var_442 = var_442;
         _loc2_.var_444 = var_444;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_441 = param1;
         if(var_441 > int.MIN_VALUE && true && _target.width < var_441)
         {
            _target.width = var_441;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_442 = param1;
         if(var_442 > int.MIN_VALUE && true && _target.height < var_442)
         {
            _target.height = var_442;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_444;
      }
   }
}
