package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OffenceCategoryData implements INamed, IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var _name:String;
      
      private var var_1049:Array;
      
      public function OffenceCategoryData(param1:IMessageDataWrapper)
      {
         var_1049 = new Array();
         super();
         _name = param1.readString();
         Logger.log("READ CAT: " + _name);
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1049.push(new OffenceData(param1));
            _loc3_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get offences() : Array
      {
         return var_1049;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1049 = null;
      }
   }
}
