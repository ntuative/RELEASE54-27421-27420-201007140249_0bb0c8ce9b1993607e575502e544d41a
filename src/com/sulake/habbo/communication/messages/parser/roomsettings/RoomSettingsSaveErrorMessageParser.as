package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1631:int = 9;
      
      public static const const_1668:int = 4;
      
      public static const const_1710:int = 1;
      
      public static const const_1347:int = 10;
      
      public static const const_1662:int = 2;
      
      public static const const_1218:int = 7;
      
      public static const const_1307:int = 11;
      
      public static const const_1634:int = 3;
      
      public static const const_1427:int = 8;
      
      public static const const_1365:int = 5;
      
      public static const const_1587:int = 6;
      
      public static const const_1245:int = 12;
       
      
      private var var_2157:String;
      
      private var _roomId:int;
      
      private var var_1228:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2157;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1228 = param1.readInteger();
         var_2157 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1228;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
