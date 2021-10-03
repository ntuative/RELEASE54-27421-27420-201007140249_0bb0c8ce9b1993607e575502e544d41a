package com.sulake.habbo.communication.messages.outgoing.catalog
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetClubOffersMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var _data:Array;
      
      public function GetClubOffersMessageComposer()
      {
         _data = [];
         super();
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return _data;
      }
      
      public function dispose() : void
      {
         _data = null;
      }
   }
}
