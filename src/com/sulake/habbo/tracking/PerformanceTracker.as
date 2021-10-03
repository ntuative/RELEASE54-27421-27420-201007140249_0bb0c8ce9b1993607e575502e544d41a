package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1602:GarbageMonitor = null;
      
      private var var_1337:int = 0;
      
      private var var_1355:Boolean = false;
      
      private var var_2020:String = "";
      
      private var var_1603:String = "";
      
      private var var_370:Number = 0;
      
      private var var_1365:int = 10;
      
      private var var_2473:Array;
      
      private var var_701:int = 0;
      
      private var var_1366:int = 60;
      
      private var var_1115:int = 0;
      
      private var var_1116:int = 0;
      
      private var var_2021:String = "";
      
      private var var_2058:Number = 0;
      
      private var var_1367:int = 1000;
      
      private var var_2059:Boolean = true;
      
      private var var_2057:Number = 0.15;
      
      private var var_148:IHabboConfigurationManager = null;
      
      private var var_2024:String = "";
      
      private var var_1364:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2473 = [];
         super();
         var_1603 = Capabilities.version;
         var_2020 = Capabilities.os;
         var_1355 = Capabilities.isDebugger;
         var_2024 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1602 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1337 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1602.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1602.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_370;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1366 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1603;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1116;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1367)
         {
            ++var_1115;
            _loc3_ = true;
         }
         else
         {
            ++var_701;
            if(var_701 <= 1)
            {
               var_370 = param1;
            }
            else
            {
               _loc4_ = Number(var_701);
               var_370 = var_370 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1337 > var_1366 * 1000 && var_1364 < var_1365)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_370);
            _loc5_ = true;
            if(var_2059 && var_1364 > 0)
            {
               _loc6_ = differenceInPercents(var_2058,var_370);
               if(_loc6_ < var_2057)
               {
                  _loc5_ = false;
               }
            }
            var_1337 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2058 = var_370;
               if(sendReport())
               {
                  ++var_1364;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1365 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1367 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_2024,var_1603,var_2020,var_2021,var_1355,_loc4_,_loc3_,var_1116,var_370,var_1115);
            _connection.send(_loc1_);
            var_1116 = 0;
            var_370 = 0;
            var_701 = 0;
            var_1115 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_148 = param1;
         var_1366 = int(var_148.getKey("performancetest.interval","60"));
         var_1367 = int(var_148.getKey("performancetest.slowupdatelimit","1000"));
         var_1365 = int(var_148.getKey("performancetest.reportlimit","10"));
         var_2057 = Number(var_148.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2059 = Boolean(int(var_148.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
