package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetPlacingErrorParser implements IMessageParser
   {
       
      
      private var var_1228:int;
      
      private var _roomCategory:int = 0;
      
      private var _roomId:int = 0;
      
      public function PetPlacingErrorParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1228 = -1;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1228;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1228 = param1.readInteger();
         return true;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
