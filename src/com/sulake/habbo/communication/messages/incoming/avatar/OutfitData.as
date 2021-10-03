package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2331:String;
      
      private var var_599:String;
      
      private var var_1517:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1517 = param1.readInteger();
         var_2331 = param1.readString();
         var_599 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_599;
      }
      
      public function get figureString() : String
      {
         return var_2331;
      }
      
      public function get slotId() : int
      {
         return var_1517;
      }
   }
}
