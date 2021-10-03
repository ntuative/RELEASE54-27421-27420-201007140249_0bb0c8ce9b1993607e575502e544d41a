package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1394:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_937:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1394 = param1;
         var_937 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_937;
      }
      
      public function get identifier() : IID
      {
         return var_1394;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1394 = null;
            while(false)
            {
               var_937.pop();
            }
            var_937 = null;
         }
      }
   }
}
