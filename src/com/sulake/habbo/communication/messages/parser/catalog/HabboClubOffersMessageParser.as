package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferData;
   
   public class HabboClubOffersMessageParser implements IMessageParser
   {
       
      
      private var var_614:Array;
      
      public function HabboClubOffersMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_614 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_614.push(new ClubOfferData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_614 = [];
         return true;
      }
      
      public function get offers() : Array
      {
         return var_614;
      }
   }
}
