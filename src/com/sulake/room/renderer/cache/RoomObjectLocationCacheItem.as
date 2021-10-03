package com.sulake.room.renderer.cache
{
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var _roomObjectVariableAccurateZ:String = "";
      
      private var var_1414:int = -1;
      
      private var var_2193:int = -1;
      
      private var var_290:Vector3d = null;
      
      public function RoomObjectLocationCacheItem(param1:String)
      {
         super();
         _roomObjectVariableAccurateZ = param1;
         var_290 = new Vector3d();
      }
      
      public function needsUpdate(param1:int, param2:int) : Boolean
      {
         if(param1 != var_1414 || param2 != var_2193)
         {
            var_1414 = param1;
            var_2193 = param2;
            return true;
         }
         return false;
      }
      
      public function getScreenLocation(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean) : IVector3d
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1 == null || param2 == null)
         {
            return null;
         }
         if(param3)
         {
            _loc4_ = param1.getLocation();
            _loc5_ = param2.getScreenPosition(_loc4_);
            if(_loc5_ == null)
            {
               return null;
            }
            _loc6_ = param1.getModel().getNumber(_roomObjectVariableAccurateZ);
            if(isNaN(_loc6_) || _loc6_ == 0)
            {
               _loc7_ = new Vector3d(Math.round(_loc4_.x),Math.round(_loc4_.y),_loc4_.z);
               if(_loc7_.x != _loc4_.x || _loc7_.y != _loc4_.y)
               {
                  _loc8_ = param2.getScreenPosition(_loc7_);
                  if(_loc8_ != null)
                  {
                     var_290 = new Vector3d(_loc5_.x,_loc5_.y,_loc8_.z);
                  }
                  else
                  {
                     var_290.assign(_loc5_);
                  }
               }
               else
               {
                  var_290.assign(_loc5_);
               }
            }
            else
            {
               var_290.assign(_loc5_);
            }
            var_290.x = Math.round(var_290.x);
            var_290.y = Math.round(var_290.y);
         }
         return var_290;
      }
      
      public function dispose() : void
      {
         var_290 = null;
      }
   }
}
