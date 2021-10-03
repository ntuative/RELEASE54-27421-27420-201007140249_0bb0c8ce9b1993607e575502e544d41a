package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualization;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class RoomTileCursorVisualization extends FurnitureVisualization
   {
       
      
      private var var_390:Boolean = false;
      
      public function RoomTileCursorVisualization()
      {
         super();
      }
      
      override protected function updateModel(param1:Number) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(super.updateModel(param1))
         {
            _loc2_ = object;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.getModel();
               if(_loc3_)
               {
                  var_390 = Boolean(_loc3_.getNumber(RoomObjectVariableEnum.const_108));
               }
            }
            return true;
         }
         return false;
      }
      
      override protected function updateSprites(param1:int, param2:Number) : void
      {
         if(var_390)
         {
            super.updateSprites(param1,param2);
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc3_:Boolean = var_390;
         super.update(param1,param2);
         if(_loc3_ != var_390)
         {
            _loc4_ = spriteCount - 1;
            while(_loc4_ >= 0)
            {
               _loc5_ = getSprite(_loc4_);
               if(_loc5_ != null)
               {
                  _loc5_.visible = var_390;
                  _loc5_.varyingDepth = true;
               }
               _loc4_--;
            }
         }
      }
   }
}
