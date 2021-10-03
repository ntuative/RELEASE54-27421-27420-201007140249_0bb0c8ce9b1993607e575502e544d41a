package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_125:DisplayObject;
      
      private var var_2486:uint;
      
      private var var_944:IWindowToolTipAgentService;
      
      private var var_945:IWindowMouseScalingService;
      
      private var var_236:IWindowContext;
      
      private var var_942:IWindowFocusManagerService;
      
      private var var_941:IWindowMouseListenerService;
      
      private var var_943:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2486 = 0;
         var_125 = param2;
         var_236 = param1;
         var_943 = new WindowMouseDragger(param2);
         var_945 = new WindowMouseScaler(param2);
         var_941 = new WindowMouseListener(param2);
         var_942 = new FocusManager(param2);
         var_944 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_945;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_942;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_944;
      }
      
      public function dispose() : void
      {
         if(var_943 != null)
         {
            var_943.dispose();
            var_943 = null;
         }
         if(var_945 != null)
         {
            var_945.dispose();
            var_945 = null;
         }
         if(var_941 != null)
         {
            var_941.dispose();
            var_941 = null;
         }
         if(var_942 != null)
         {
            var_942.dispose();
            var_942 = null;
         }
         if(var_944 != null)
         {
            var_944.dispose();
            var_944 = null;
         }
         var_236 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_941;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_943;
      }
   }
}
