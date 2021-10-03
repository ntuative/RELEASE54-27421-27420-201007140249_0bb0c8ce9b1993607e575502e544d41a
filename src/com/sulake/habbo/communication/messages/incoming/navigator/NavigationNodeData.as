package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1246:int;
      
      private var var_1711:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1246 = param1;
         var_1711 = param2;
         Logger.log("READ NODE: " + var_1246 + ", " + var_1711);
      }
      
      public function get nodeName() : String
      {
         return var_1711;
      }
      
      public function get nodeId() : int
      {
         return var_1246;
      }
   }
}
