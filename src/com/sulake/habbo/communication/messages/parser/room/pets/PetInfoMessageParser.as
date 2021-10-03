package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1762:int;
      
      private var var_409:String;
      
      private var var_1757:int;
      
      private var var_1758:int;
      
      private var var_1761:int;
      
      private var var_2371:int;
      
      private var _nutrition:int;
      
      private var var_1363:int;
      
      private var var_2370:int;
      
      private var var_2368:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1763:int;
      
      private var var_2369:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1757;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2371;
      }
      
      public function flush() : Boolean
      {
         var_1363 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2370;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2368;
      }
      
      public function get maxNutrition() : int
      {
         return var_2369;
      }
      
      public function get figure() : String
      {
         return var_409;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1758;
      }
      
      public function get petId() : int
      {
         return var_1363;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1363 = param1.readInteger();
         _name = param1.readString();
         var_1757 = param1.readInteger();
         var_2370 = param1.readInteger();
         var_1761 = param1.readInteger();
         var_2368 = param1.readInteger();
         _energy = param1.readInteger();
         var_2371 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2369 = param1.readInteger();
         var_409 = param1.readString();
         var_1758 = param1.readInteger();
         var_1763 = param1.readInteger();
         var_1762 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1761;
      }
      
      public function get ownerId() : int
      {
         return var_1763;
      }
      
      public function get age() : int
      {
         return var_1762;
      }
   }
}
