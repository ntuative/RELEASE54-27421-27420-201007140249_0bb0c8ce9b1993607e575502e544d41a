package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatAccessibleMessageParser implements IMessageParser
   {
       
      
      private var _userName:String = null;
      
      private var _roomCategory:int = 0;
      
      private var _roomId:int = 0;
      
      public function FlatAccessibleMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _roomId = 0;
         _roomCategory = 0;
         _userName = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 != null)
         {
            _userName = param1.readString();
         }
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
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
