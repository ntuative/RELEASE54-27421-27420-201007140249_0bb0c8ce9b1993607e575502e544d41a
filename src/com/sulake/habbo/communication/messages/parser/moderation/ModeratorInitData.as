package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1165:Array;
      
      private var var_2306:Boolean;
      
      private var var_1164:Array;
      
      private var var_2299:Boolean;
      
      private var var_2303:Boolean;
      
      private var var_2305:Boolean;
      
      private var var_160:Array;
      
      private var var_2301:Boolean;
      
      private var var_2304:Boolean;
      
      private var var_971:Array;
      
      private var var_2300:Boolean;
      
      private var var_2302:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_160 = [];
         var_1164 = [];
         var_1165 = [];
         var_971 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_160.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1164.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_971.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2301 = param1.readBoolean();
         var_2305 = param1.readBoolean();
         var_2299 = param1.readBoolean();
         var_2303 = param1.readBoolean();
         var_2302 = param1.readBoolean();
         var_2304 = param1.readBoolean();
         var_2306 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1165.push(param1.readString());
            _loc4_++;
         }
         var_2300 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return var_2302;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1164;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2299;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2306;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2301;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1164 = null;
         var_1165 = null;
         var_160 = null;
         for each(_loc1_ in var_971)
         {
            _loc1_.dispose();
         }
         var_971 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_1165;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2304;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2303;
      }
      
      public function get offenceCategories() : Array
      {
         return var_971;
      }
      
      public function get issues() : Array
      {
         return var_160;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2300;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2305;
      }
   }
}
