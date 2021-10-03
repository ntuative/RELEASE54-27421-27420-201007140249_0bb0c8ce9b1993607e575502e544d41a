package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_150:int = 1;
      
      public static const const_1428:int = 3;
      
      public static const const_499:int = 2;
       
      
      private var var_2004:int;
      
      private var var_2011:int;
      
      private var var_2005:int;
      
      private var var_2013:int;
      
      private var var_38:int;
      
      private var var_451:int;
      
      private var var_1476:int;
      
      private var var_1870:int;
      
      private var var_1071:int;
      
      private var _roomResources:String;
      
      private var var_1983:int;
      
      private var var_2009:int;
      
      private var var_2010:String;
      
      private var var_2012:String;
      
      private var var_2007:int = 0;
      
      private var var_1297:String;
      
      private var _message:String;
      
      private var var_1938:int;
      
      private var var_2006:String;
      
      private var var_1233:int;
      
      private var var_802:String;
      
      private var var_2008:String;
      
      private var var_1591:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1071 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2007 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2009;
      }
      
      public function set roomName(param1:String) : void
      {
         var_802 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1983 = param1;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_802;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_2013 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_38 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2011;
      }
      
      public function get priority() : int
      {
         return var_2004 + var_2007;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1870 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_2012;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1591) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1233;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2009 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1476;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2010 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1983;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_2013;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2008 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1297 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1870;
      }
      
      public function set priority(param1:int) : void
      {
         var_2004 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2011 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2010;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2005 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_2012 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1938 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1297;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1476 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2005;
      }
      
      public function set flatId(param1:int) : void
      {
         var_451 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1233 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1591 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1938;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2006 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1591;
      }
      
      public function get reportedUserId() : int
      {
         return var_1071;
      }
      
      public function get flatId() : int
      {
         return var_451;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2008;
      }
      
      public function get reporterUserName() : String
      {
         return var_2006;
      }
   }
}
