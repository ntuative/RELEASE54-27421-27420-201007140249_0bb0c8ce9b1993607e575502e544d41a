package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_167:int;
      
      private var var_246:int = 0;
      
      private var _roomId:int;
      
      private var var_86:int = 0;
      
      private var _y:int = 0;
      
      private var var_1871:int;
      
      private var var_2194:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_167 = param1;
         var_1871 = param2;
         var_2194 = param3;
         var_86 = param4;
         _y = param5;
         var_246 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1871)
         {
            case RoomObjectCategoryEnum.const_28:
               return [var_167 + " " + var_86 + " " + _y + " " + var_246];
            case RoomObjectCategoryEnum.const_26:
               return [var_167 + " " + var_2194];
            default:
               return [];
         }
      }
   }
}
