package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_643:int = 6;
      
      public static const const_216:int = 5;
      
      public static const const_567:int = 2;
      
      public static const const_335:int = 9;
      
      public static const const_307:int = 4;
      
      public static const const_273:int = 2;
      
      public static const const_651:int = 4;
      
      public static const const_209:int = 8;
      
      public static const const_681:int = 7;
      
      public static const const_271:int = 3;
      
      public static const const_357:int = 1;
      
      public static const const_235:int = 5;
      
      public static const const_399:int = 12;
      
      public static const const_325:int = 1;
      
      public static const const_707:int = 11;
      
      public static const const_586:int = 3;
      
      public static const const_1543:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_457:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_457 = new Array();
         var_457.push(new Tab(_navigator,const_357,const_399,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_509));
         var_457.push(new Tab(_navigator,const_273,const_325,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_509));
         var_457.push(new Tab(_navigator,const_307,const_707,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_1034));
         var_457.push(new Tab(_navigator,const_271,const_216,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_509));
         var_457.push(new Tab(_navigator,const_235,const_209,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_743));
         setSelectedTab(const_357);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_457)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_457)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_457)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_307;
      }
      
      public function get tabs() : Array
      {
         return var_457;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
