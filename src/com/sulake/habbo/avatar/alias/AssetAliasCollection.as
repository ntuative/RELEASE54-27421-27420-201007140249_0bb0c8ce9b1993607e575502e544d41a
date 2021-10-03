package com.sulake.habbo.avatar.alias
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import flash.utils.Dictionary;
   
   public class AssetAliasCollection
   {
       
      
      private var _aliases:Dictionary;
      
      private var var_1042:AssetLibraryCollection;
      
      public function AssetAliasCollection(param1:AssetLibraryCollection)
      {
         super();
         var_1042 = param1;
         _aliases = new Dictionary();
         init();
      }
      
      public function addAlias(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:XML = <alias name="" link="" fliph="0" flipv="0"/>;
         _loc5_.@name = param1;
         _loc5_.@link = param2;
         var _loc6_:AssetAlias = new AssetAlias(_loc5_);
         _aliases[param1] = _loc6_;
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = var_1042.getManifests();
         for each(_loc2_ in _loc1_)
         {
            for each(_loc3_ in _loc2_.library.aliases.alias)
            {
               _loc4_ = String(_loc3_.@name);
               _loc5_ = new AssetAlias(_loc3_);
               _aliases[_loc4_] = _loc5_;
            }
         }
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         var _loc3_:* = null;
         var _loc2_:int = 5;
         while(hasAlias(param1) && _loc2_ >= 0)
         {
            _loc3_ = _aliases[param1] as AssetAlias;
            param1 = _loc3_.link;
            _loc2_--;
         }
         return var_1042.getAssetByName(param1);
      }
      
      public function getAliasByName(param1:String) : AssetAlias
      {
         return _aliases[param1] as AssetAlias;
      }
      
      public function hasAlias(param1:String) : Boolean
      {
         var _loc2_:AssetAlias = _aliases[param1] as AssetAlias;
         return _loc2_ != null;
      }
      
      public function dispose() : void
      {
         var_1042 = null;
         _aliases = null;
      }
   }
}
