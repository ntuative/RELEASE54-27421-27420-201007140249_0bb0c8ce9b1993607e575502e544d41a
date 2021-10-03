package com.sulake.habbo.avatar.structure.parts
{
   public class ActivePartSet
   {
       
      
      private var var_185:Array;
      
      private var _id:String;
      
      public function ActivePartSet(param1:XML)
      {
         var _loc2_:* = null;
         super();
         _id = String(param1.@id);
         var_185 = new Array();
         for each(_loc2_ in param1.activePart)
         {
            var_185.push(String(_loc2_["set-type"]));
         }
      }
      
      public function get parts() : Array
      {
         return var_185;
      }
   }
}
