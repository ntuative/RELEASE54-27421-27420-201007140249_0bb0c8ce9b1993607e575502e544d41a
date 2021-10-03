package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_599:String;
      
      private var _id:int;
      
      private var var_2279:String = "";
      
      private var var_2281:int;
      
      private var var_2280:String;
      
      private var var_2282:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2281 = parseInt(param1.@pattern);
         var_599 = String(param1.@gender);
         var_2282 = Boolean(parseInt(param1.@colorable));
         var_2279 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2279;
      }
      
      public function get isColorable() : Boolean
      {
         return var_2282;
      }
      
      public function get gender() : String
      {
         return var_599;
      }
      
      public function get patternId() : int
      {
         return var_2281;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2280;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2280 = param1;
      }
   }
}
