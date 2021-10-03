package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1567:int;
      
      private var var_1568:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1567;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1567 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1567 = this.var_1567;
         _loc1_.var_1568 = this.var_1568;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1568 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1568;
      }
   }
}
