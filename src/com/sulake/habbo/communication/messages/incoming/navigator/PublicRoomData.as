package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2011:int;
      
      private var var_2203:String;
      
      private var var_2013:int;
      
      private var _disposed:Boolean;
      
      private var var_2202:int;
      
      private var var_2201:String;
      
      private var var_1246:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_2201 = param1.readString();
         var_2011 = param1.readInteger();
         var_2013 = param1.readInteger();
         var_2203 = param1.readString();
         var_2202 = param1.readInteger();
         var_1246 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2202;
      }
      
      public function get worldId() : int
      {
         return var_2013;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_2201;
      }
      
      public function get unitPort() : int
      {
         return var_2011;
      }
      
      public function get castLibs() : String
      {
         return var_2203;
      }
      
      public function get nodeId() : int
      {
         return var_1246;
      }
   }
}
