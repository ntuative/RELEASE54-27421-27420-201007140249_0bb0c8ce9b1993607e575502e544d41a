package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_467:FloorRasterizer;
      
      private var var_970:Boolean = false;
      
      private var var_678:PlaneMaskManager;
      
      private var var_469:WallRasterizer;
      
      private var var_679:WallAdRasterizer;
      
      private var var_468:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_469 = new WallRasterizer();
         var_467 = new FloorRasterizer();
         var_679 = new WallAdRasterizer();
         var_468 = new LandscapeRasterizer();
         var_678 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_469;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_679;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_467;
      }
      
      public function get initialized() : Boolean
      {
         return var_970;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_678;
      }
      
      public function dispose() : void
      {
         if(var_469 != null)
         {
            var_469.dispose();
            var_469 = null;
         }
         if(var_467 != null)
         {
            var_467.dispose();
            var_467 = null;
         }
         if(var_679 != null)
         {
            var_679.dispose();
            var_679 = null;
         }
         if(var_468 != null)
         {
            var_468.dispose();
            var_468 = null;
         }
         if(var_678 != null)
         {
            var_678.dispose();
            var_678 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_469.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_467.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_679.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_468.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_678.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_469 != null)
         {
            var_469.clearCache();
         }
         if(var_467 != null)
         {
            var_467.clearCache();
         }
         if(var_468 != null)
         {
            var_468.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_468;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_970)
         {
            return;
         }
         var_469.initializeAssetCollection(param1);
         var_467.initializeAssetCollection(param1);
         var_679.initializeAssetCollection(param1);
         var_468.initializeAssetCollection(param1);
         var_678.initializeAssetCollection(param1);
         var_970 = true;
      }
   }
}
