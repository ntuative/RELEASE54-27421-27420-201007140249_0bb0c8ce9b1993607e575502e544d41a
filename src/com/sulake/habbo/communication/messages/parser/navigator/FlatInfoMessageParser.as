package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_254:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_254 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_254;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_254 = new RoomSettingsFlatInfo();
         var_254.allowFurniMoving = param1.readInteger() == 1;
         var_254.doorMode = param1.readInteger();
         var_254.id = param1.readInteger();
         var_254.ownerName = param1.readString();
         var_254.type = param1.readString();
         var_254.name = param1.readString();
         var_254.description = param1.readString();
         var_254.showOwnerName = param1.readInteger() == 1;
         var_254.allowTrading = param1.readInteger() == 1;
         var_254.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
