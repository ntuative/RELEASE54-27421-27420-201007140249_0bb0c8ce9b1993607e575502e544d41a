package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_711:int = 2;
      
      public static const const_1045:int = 6;
      
      public static const const_723:int = 1;
      
      public static const const_758:int = 3;
      
      public static const const_937:int = 4;
      
      public static const const_572:int = 5;
       
      
      private var var_2377:String;
      
      private var var_1096:int;
      
      private var var_2220:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1096 = param2;
         var_2220 = param3;
         var_2377 = param4;
      }
      
      public function get time() : String
      {
         return var_2377;
      }
      
      public function get senderId() : int
      {
         return var_1096;
      }
      
      public function get messageText() : String
      {
         return var_2220;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
