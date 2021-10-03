package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2185:Boolean;
      
      private var var_2184:int;
      
      private var _offerId:int;
      
      private var var_1906:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2185 = param1.readBoolean();
         var_2184 = param1.readInteger();
         var_1906 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1906;
      }
      
      public function get isVip() : Boolean
      {
         return var_2185;
      }
      
      public function get daysRequired() : int
      {
         return var_2184;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
