package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1758:int;
      
      private var var_1262:PetData;
      
      private var var_2381:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1758;
      }
      
      public function get petData() : PetData
      {
         return var_1262;
      }
      
      public function flush() : Boolean
      {
         var_1262 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2381;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1758 = param1.readInteger();
         var_2381 = param1.readInteger();
         var_1262 = new PetData(param1);
         return true;
      }
   }
}
