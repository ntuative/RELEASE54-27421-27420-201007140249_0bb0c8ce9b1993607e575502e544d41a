package com.sulake.habbo.avatar.geometry
{
   import flash.utils.Dictionary;
   
   public class AvatarSet
   {
       
      
      private var var_2104:Boolean;
      
      private var var_1129:Dictionary;
      
      private var _id:String;
      
      private var var_1618:Array;
      
      public function AvatarSet(param1:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         super();
         _id = String(param1.@id);
         var _loc2_:String = String(param1.@main);
         var_2104 = _loc2_ == null ? false : Boolean(Boolean(parseInt(_loc2_)));
         var_1129 = new Dictionary();
         var_1618 = new Array();
         for each(_loc3_ in param1.avatarset)
         {
            _loc5_ = new AvatarSet(_loc3_);
            var_1129[String(_loc3_.@id)] = _loc5_;
         }
         for each(_loc4_ in param1.bodypart)
         {
            var_1618.push(String(_loc4_.@id));
         }
      }
      
      public function get isMain() : Boolean
      {
         var _loc1_:* = null;
         if(var_2104)
         {
            return true;
         }
         for each(_loc1_ in var_1129)
         {
            if(_loc1_.isMain)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getBodyParts() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1618.concat();
         for each(_loc2_ in var_1129)
         {
            _loc1_ = _loc1_.concat(_loc2_.getBodyParts());
         }
         return _loc1_;
      }
      
      public function findAvatarSet(param1:String) : AvatarSet
      {
         var _loc2_:* = null;
         if(param1 == _id)
         {
            return this;
         }
         for each(_loc2_ in var_1129)
         {
            if(_loc2_.findAvatarSet(param1) != null)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
