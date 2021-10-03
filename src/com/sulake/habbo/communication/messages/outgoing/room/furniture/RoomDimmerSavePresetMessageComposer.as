package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2127:int;
      
      private var var_2126:int;
      
      private var var_2373:Boolean;
      
      private var var_2372:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2374:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_2126 = param1;
         var_2127 = param2;
         var_2372 = param3;
         var_2374 = param4;
         var_2373 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2126,var_2127,var_2372,var_2374,int(var_2373)];
      }
      
      public function dispose() : void
      {
      }
   }
}
