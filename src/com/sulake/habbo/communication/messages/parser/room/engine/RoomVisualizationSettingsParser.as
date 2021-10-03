package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomVisualizationSettingsParser implements IMessageParser
   {
       
      
      private var var_1461:Boolean = false;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function RoomVisualizationSettingsParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _roomId = 0;
         _roomCategory = 0;
         var_1461 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1461 = param1.readBoolean();
         return true;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get wallsHidden() : Boolean
      {
         return var_1461;
      }
   }
}
