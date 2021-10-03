package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_924:LegacyWallGeometry = null;
      
      private var var_645:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_643:TileHeightMap = null;
      
      private var var_2140:String = null;
      
      private var _roomId:int = 0;
      
      private var var_644:SelectedRoomObjectData = null;
      
      private var var_925:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_924 = new LegacyWallGeometry();
         var_925 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_645 != null)
         {
            var_645.dispose();
         }
         var_645 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_643 != null)
         {
            var_643.dispose();
         }
         var_643 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2140 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_924;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_644;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_925;
      }
      
      public function dispose() : void
      {
         if(var_643 != null)
         {
            var_643.dispose();
            var_643 = null;
         }
         if(var_924 != null)
         {
            var_924.dispose();
            var_924 = null;
         }
         if(var_925 != null)
         {
            var_925.dispose();
            var_925 = null;
         }
         if(var_645 != null)
         {
            var_645.dispose();
            var_645 = null;
         }
         if(var_644 != null)
         {
            var_644.dispose();
            var_644 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_643;
      }
      
      public function get worldType() : String
      {
         return var_2140;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_644 != null)
         {
            var_644.dispose();
         }
         var_644 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_645;
      }
   }
}
