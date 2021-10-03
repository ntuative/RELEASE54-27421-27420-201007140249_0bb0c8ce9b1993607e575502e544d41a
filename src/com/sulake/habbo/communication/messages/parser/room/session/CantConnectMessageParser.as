package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1535:int = 2;
      
      public static const const_1367:int = 4;
      
      public static const const_1189:int = 1;
      
      public static const const_1260:int = 3;
       
      
      private var var_1166:int = 0;
      
      private var var_974:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1166;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1166 = param1.readInteger();
         if(var_1166 == 3)
         {
            var_974 = param1.readString();
         }
         else
         {
            var_974 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1166 = 0;
         var_974 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_974;
      }
   }
}
