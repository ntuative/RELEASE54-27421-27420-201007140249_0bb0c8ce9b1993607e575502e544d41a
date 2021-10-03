package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_206:String = "e";
      
      public static const const_79:String = "i";
      
      public static const const_81:String = "s";
       
      
      private var var_1051:String;
      
      private var var_1251:String;
      
      private var var_1253:int;
      
      private var var_2341:int;
      
      private var var_1052:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1251 = param1.readString();
         var_2341 = param1.readInteger();
         var_1051 = param1.readString();
         var_1052 = param1.readInteger();
         var_1253 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1052;
      }
      
      public function get productType() : String
      {
         return var_1251;
      }
      
      public function get expiration() : int
      {
         return var_1253;
      }
      
      public function get furniClassId() : int
      {
         return var_2341;
      }
      
      public function get extraParam() : String
      {
         return var_1051;
      }
   }
}
