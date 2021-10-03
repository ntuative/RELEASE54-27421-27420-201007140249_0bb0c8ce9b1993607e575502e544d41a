package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetRoomSettingsMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_34:Array;
      
      public function GetRoomSettingsMessageComposer(param1:int)
      {
         var_34 = new Array();
         super();
         var_34.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return var_34;
      }
      
      public function dispose() : void
      {
         var_34 = null;
      }
   }
}
