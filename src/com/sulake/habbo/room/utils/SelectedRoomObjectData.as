package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_75:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_246:Vector3d = null;
      
      private var var_2198:int = 0;
      
      private var var_2199:String = null;
      
      private var _category:int = 0;
      
      private var var_2197:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2197 = param3;
         var_75 = new Vector3d();
         var_75.assign(param4);
         var_246 = new Vector3d();
         var_246.assign(param5);
         var_2198 = param6;
         var_2199 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_75;
      }
      
      public function get typeId() : int
      {
         return var_2198;
      }
      
      public function get dir() : Vector3d
      {
         return var_246;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2199;
      }
      
      public function get operation() : String
      {
         return var_2197;
      }
      
      public function dispose() : void
      {
         var_75 = null;
         var_246 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
