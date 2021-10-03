package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1665:String;
      
      private var var_1605:String;
      
      private var var_1120:String;
      
      private var var_472:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1665 = String(param1.@align);
         var_1120 = String(param1.@base);
         var_1605 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_472 = Number(_loc2_);
            if(var_472 > 1)
            {
               var_472 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1665;
      }
      
      public function get ink() : String
      {
         return var_1605;
      }
      
      public function get base() : String
      {
         return var_1120;
      }
      
      public function get isBlended() : Boolean
      {
         return var_472 != 1;
      }
      
      public function get blend() : Number
      {
         return var_472;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
