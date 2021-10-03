package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1992:Boolean = false;
      
      private var var_1990:int = 0;
      
      private var var_1686:int = 0;
      
      private var var_1991:int = 0;
      
      private var var_1880:Boolean = false;
      
      private var var_1542:int = 0;
      
      private var var_1685:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1542 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1990;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1992;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1992 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1880;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1990 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1686 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1542;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1880 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1991 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1686;
      }
      
      public function get pixelBalance() : int
      {
         return var_1991;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1685 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1685;
      }
   }
}
