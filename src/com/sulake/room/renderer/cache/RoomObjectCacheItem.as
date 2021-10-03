package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_616:RoomObjectLocationCacheItem = null;
      
      private var var_189:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_616 = new RoomObjectLocationCacheItem(param1);
         var_189 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_616;
      }
      
      public function dispose() : void
      {
         if(var_616 != null)
         {
            var_616.dispose();
            var_616 = null;
         }
         if(var_189 != null)
         {
            var_189.dispose();
            var_189 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_189;
      }
   }
}
