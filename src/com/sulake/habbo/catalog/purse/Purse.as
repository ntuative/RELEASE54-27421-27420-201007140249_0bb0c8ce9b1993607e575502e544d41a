package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2340:int = 0;
      
      private var var_1686:int = 0;
      
      private var var_1880:Boolean = false;
      
      private var var_2339:int = 0;
      
      private var var_1881:int = 0;
      
      private var var_1685:int = 0;
      
      private var var_1884:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1686;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1686 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1880 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_1884 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1686 > 0 || var_1685 > 0;
      }
      
      public function get credits() : int
      {
         return var_2339;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_1881 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1685;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1880;
      }
      
      public function get pastClubDays() : int
      {
         return var_1884;
      }
      
      public function get pastVipDays() : int
      {
         return var_1881;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2340 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2340;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1685 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2339 = param1;
      }
   }
}
