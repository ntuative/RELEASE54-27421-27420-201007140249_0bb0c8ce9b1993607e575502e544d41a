package com.sulake.habbo.avatar.cache
{
   import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
   import com.sulake.habbo.avatar.AvatarImagePartContainer;
   import flash.utils.Dictionary;
   
   public class AvatarImageDirectionCache
   {
       
      
      private var var_765:Array;
      
      private var _images:Dictionary;
      
      public function AvatarImageDirectionCache(param1:Array)
      {
         super();
         _images = new Dictionary();
         var_765 = param1;
      }
      
      public function updateImageContainer(param1:AvatarImageBodyPartContainer, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:String = getCacheKey(param2);
         if(false)
         {
            _loc4_ = _images[_loc3_] as AvatarImageBodyPartContainer;
            if(_loc4_)
            {
               _loc4_.dispose();
            }
         }
         _images[_loc3_] = param1;
      }
      
      public function getPartList() : Array
      {
         return var_765;
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      private function getCacheKey(param1:int) : String
      {
         var _loc3_:* = null;
         var _loc2_:* = "";
         for each(_loc3_ in var_765)
         {
            _loc2_ = _loc2_ + _loc3_.partId + ":" + _loc3_.getFrameIndex(param1) + "/";
         }
         return _loc2_;
      }
      
      public function getImageContainer(param1:int) : AvatarImageBodyPartContainer
      {
         var _loc2_:String = getCacheKey(param1);
         return _images[_loc2_];
      }
      
      public function comparePartList(param1:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:Boolean = true;
         if(var_765.length == param1.length)
         {
            _loc3_ = 0;
            while(_loc3_ < var_765.length)
            {
               _loc4_ = var_765[_loc3_];
               _loc5_ = var_765[_loc3_];
               if(_loc4_ != _loc5_)
               {
                  _loc2_ = false;
                  break;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in _images)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         _images = null;
      }
   }
}
