package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.Map;
   import flash.utils.getTimer;
   
   public class AvatarImageActionCache
   {
       
      
      private var var_1948:int;
      
      private var var_145:Map;
      
      public function AvatarImageActionCache()
      {
         super();
         var_145 = new Map();
         setLastAccessTime(getTimer());
      }
      
      public function setLastAccessTime(param1:int) : void
      {
         var_1948 = param1;
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      public function getLastAccessTime() : int
      {
         return var_1948;
      }
      
      public function getDirectionCache(param1:int) : AvatarImageDirectionCache
      {
         var _loc2_:String = param1.toString();
         return var_145.getValue(_loc2_) as AvatarImageDirectionCache;
      }
      
      public function updateDirectionCache(param1:int, param2:AvatarImageDirectionCache) : void
      {
         var _loc3_:String = param1.toString();
         var_145.add(_loc3_,param2);
      }
      
      public function dispose() : void
      {
         debugInfo("[dispose]");
         if(var_145 == null)
         {
            return;
         }
         var_145.dispose();
      }
   }
}
