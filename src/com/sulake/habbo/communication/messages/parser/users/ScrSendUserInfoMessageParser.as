package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1430:int = 2;
      
      public static const const_1536:int = 1;
       
      
      private var var_1882:int;
      
      private var var_1887:int;
      
      private var var_1880:Boolean;
      
      private var var_1886:int;
      
      private var var_1392:String;
      
      private var var_1883:Boolean;
      
      private var var_1881:int;
      
      private var var_1885:int;
      
      private var var_1884:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1887;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1880;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1885;
      }
      
      public function get memberPeriods() : int
      {
         return var_1886;
      }
      
      public function get productName() : String
      {
         return var_1392;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1883;
      }
      
      public function get responseType() : int
      {
         return var_1882;
      }
      
      public function get pastClubDays() : int
      {
         return var_1884;
      }
      
      public function get pastVipDays() : int
      {
         return var_1881;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1392 = param1.readString();
         var_1887 = param1.readInteger();
         var_1886 = param1.readInteger();
         var_1885 = param1.readInteger();
         var_1882 = param1.readInteger();
         var_1883 = param1.readBoolean();
         var_1880 = param1.readBoolean();
         var_1884 = param1.readInteger();
         var_1881 = param1.readInteger();
         return true;
      }
   }
}
