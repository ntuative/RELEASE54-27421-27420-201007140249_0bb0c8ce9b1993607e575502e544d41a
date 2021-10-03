package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1757:int;
      
      private var var_1758:int;
      
      private var var_1761:int;
      
      private var var_1756:int;
      
      private var _nutrition:int;
      
      private var var_1363:int;
      
      private var var_1760:int;
      
      private var var_1755:int;
      
      private var _energy:int;
      
      private var var_1762:int;
      
      private var var_1759:int;
      
      private var _ownerName:String;
      
      private var var_1763:int;
      
      public function PetInfo()
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
      
      public function set respect(param1:int) : void
      {
         var_1758 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1757 = param1;
      }
      
      public function get petId() : int
      {
         return var_1363;
      }
      
      public function get experienceMax() : int
      {
         return var_1755;
      }
      
      public function get nutritionMax() : int
      {
         return var_1756;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1760 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1763;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1363 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1759;
      }
      
      public function get respect() : int
      {
         return var_1758;
      }
      
      public function get levelMax() : int
      {
         return var_1760;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1755 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1761 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1756 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1763 = param1;
      }
      
      public function get experience() : int
      {
         return var_1761;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1759 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1762 = param1;
      }
      
      public function get age() : int
      {
         return var_1762;
      }
   }
}
