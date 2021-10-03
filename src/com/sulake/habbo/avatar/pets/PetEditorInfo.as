package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_2360:Boolean;
      
      private var var_1906:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_2360 = Boolean(parseInt(param1.@club));
         var_1906 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_2360;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1906;
      }
   }
}
