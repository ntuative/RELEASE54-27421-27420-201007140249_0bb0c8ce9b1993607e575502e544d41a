package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_390:Boolean;
      
      private var var_1246:int;
      
      private var var_1711:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1246 = param1.readInteger();
         var_1711 = param1.readString();
         var_390 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_390;
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
