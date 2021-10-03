package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_1392:String = "";
      
      private var var_1393:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1393 = "";
         var_1392 = "";
         return true;
      }
      
      public function get productName() : String
      {
         return var_1392;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1393 = param1.readString();
         var_1392 = param1.readString();
         return true;
      }
      
      public function get productDescription() : String
      {
         return var_1393;
      }
   }
}
