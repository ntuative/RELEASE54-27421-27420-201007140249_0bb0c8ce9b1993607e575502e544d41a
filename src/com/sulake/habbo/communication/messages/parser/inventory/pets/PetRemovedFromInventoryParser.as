package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetRemovedFromInventoryParser implements IMessageParser
   {
       
      
      private var var_1363:int;
      
      public function PetRemovedFromInventoryParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1363;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1363 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
