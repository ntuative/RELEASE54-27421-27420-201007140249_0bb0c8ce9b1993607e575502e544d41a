package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _data:ModeratorInitData;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function get data() : ModeratorInitData
      {
         return _data;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _data = new ModeratorInitData(param1);
         return true;
      }
      
      public function flush() : Boolean
      {
         if(_data != null)
         {
            _data.dispose();
            _data = null;
         }
         return true;
      }
   }
}
