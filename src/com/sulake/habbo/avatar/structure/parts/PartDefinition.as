package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1519:int = -1;
      
      private var var_1244:Boolean;
      
      private var var_1245:String;
      
      private var var_1799:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1799 = String(param1["set-type"]);
         var_1245 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1244 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1519 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1245;
      }
      
      public function get staticId() : int
      {
         return var_1519;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1519 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1244;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1244 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1245 = param1;
      }
      
      public function get setType() : String
      {
         return var_1799;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
