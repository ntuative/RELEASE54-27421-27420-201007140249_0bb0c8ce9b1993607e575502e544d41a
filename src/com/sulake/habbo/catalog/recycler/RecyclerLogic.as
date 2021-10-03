package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerStatusMessageEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class RecyclerLogic implements IRecycler
   {
      
      private static const const_787:int = 0;
      
      public static const const_181:int = 5;
      
      private static const const_368:int = 1;
      
      private static const const_788:int = 2;
       
      
      private var _view:IRecyclerVisualization;
      
      private var var_803:Array;
      
      private var _catalog:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1600:int;
      
      private var var_104:Array;
      
      private var var_284:int = 0;
      
      public function RecyclerLogic(param1:IHabboCatalog, param2:IHabboWindowManager)
      {
         var_104 = new Array();
         super();
         _catalog = param1;
         _windowManager = param2;
      }
      
      public function get active() : Boolean
      {
         return statusActive && systemActive;
      }
      
      private function method_2() : void
      {
         if(_view == null || !statusActive)
         {
            return;
         }
         _view.updateRecycleButton(isReadyToRecycle());
      }
      
      public function setSystemStatus(param1:int, param2:int) : void
      {
         var_1600 = param1;
         if(!systemActive)
         {
            return;
         }
         switch(var_1600)
         {
            case RecyclerStatusMessageEvent.const_1372:
               var_284 = const_368;
               if(_view == null)
               {
                  return;
               }
               _view.displayNormalView();
               _catalog.setupInventoryForRecycler(true);
               verifyRoomSessionStatus();
               updateRecyclerSlots();
               method_2();
               break;
            case RecyclerStatusMessageEvent.const_851:
               if(_view == null)
               {
                  return;
               }
               _view.displayDisabledView();
               _catalog.setupInventoryForRecycler(false);
               break;
            case RecyclerStatusMessageEvent.const_1288:
               if(_view == null)
               {
                  return;
               }
               _view.displayTimeOutView(param2);
               _catalog.setupInventoryForRecycler(false);
               break;
         }
      }
      
      public function setRoomSessionActive(param1:Boolean) : void
      {
         if(param1 == false)
         {
            empty();
            verifyRoomSessionStatus();
         }
         method_2();
      }
      
      public function empty() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_181)
         {
            releaseSlot(_loc1_);
            _loc1_++;
         }
         updateRecyclerSlots();
         method_2();
      }
      
      public function init(param1:IRecyclerVisualization = null) : void
      {
         var_284 = const_788;
         var_104 = new Array(const_181);
         if(param1 == null)
         {
            return;
         }
         _view = param1;
         _catalog.getRecyclerStatus();
      }
      
      public function executeRecycler() : void
      {
         var _loc3_:* = null;
         if(!isReadyToRecycle())
         {
            return;
         }
         var_284 = const_788;
         method_2();
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < var_104.length)
         {
            _loc3_ = var_104[_loc2_];
            if(_loc3_ == null)
            {
               return;
            }
            _loc1_.push(_loc3_.id);
            _loc2_++;
         }
         _catalog.sendRecycleItems(_loc1_);
         _view.displayProcessingView();
      }
      
      private function get systemActive() : Boolean
      {
         return var_1600 != RecyclerStatusMessageEvent.const_851;
      }
      
      private function get statusActive() : Boolean
      {
         return var_284 != const_787;
      }
      
      public function getPrizeTable() : Array
      {
         if(var_803 == null)
         {
            _catalog.getRecyclerPrizes();
            return null;
         }
         return var_803;
      }
      
      private function isPoolFull() : Boolean
      {
         if(var_104 == null)
         {
            return false;
         }
         if(var_104.length < const_181)
         {
            return false;
         }
         var _loc1_:int = 0;
         while(_loc1_ < var_104.length)
         {
            if(true)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      public function storePrizeTable(param1:Array) : void
      {
         var _loc3_:* = null;
         var_803 = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new PrizeLevelContainer(param1[_loc2_],_catalog);
            var_803.push(_loc3_);
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         var_104 = null;
         _catalog = null;
      }
      
      private function get ready() : Boolean
      {
         return active && var_284 == const_368;
      }
      
      public function getSlotContent(param1:int) : FurniSlotItem
      {
         if(var_104 == null)
         {
            return null;
         }
         if(param1 >= var_104.length)
         {
            return null;
         }
         return var_104[param1];
      }
      
      public function placeObjectAtSlot(param1:int, param2:int, param3:int, param4:int, param5:String) : void
      {
         var oldObjectData:FurniSlotItem = null;
         var newSlotId:int = 0;
         var slotId:int = param1;
         var id:int = param2;
         var category:int = param3;
         var typeId:int = param4;
         var xxxExtra:String = param5;
         if(!ready)
         {
            return;
         }
         if(false)
         {
            oldObjectData = var_104[0];
            newSlotId = 0;
            while(oldObjectData != null && newSlotId < const_181)
            {
               oldObjectData = var_104[newSlotId];
               if(oldObjectData != null)
               {
                  newSlotId++;
               }
            }
            if(oldObjectData != null)
            {
               return;
            }
            slotId = newSlotId;
         }
         var itemId:int = _catalog.requestInventoryFurniToRecycler();
         if(itemId == 0)
         {
            _windowManager.alert("${generic.alert.title}","${recycler.alert.non.recyclable}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return;
         }
         var_104[slotId] = new FurniSlotItem(itemId,category,typeId,xxxExtra);
         updateRecyclerSlots();
         method_2();
      }
      
      private function isTradingActive() : Boolean
      {
         return _catalog.tradingActive;
      }
      
      private function updateRecyclerSlots() : void
      {
         if(_view == null || !statusActive)
         {
            return;
         }
         _view.updateSlots();
      }
      
      public function activate() : void
      {
         if(systemActive)
         {
            var_284 = const_368;
         }
      }
      
      private function verifyRoomSessionStatus() : void
      {
         if(ready)
         {
            _windowManager.alert("${generic.alert.title}","${recycler.alert.privateroom}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
         }
      }
      
      public function cancel() : void
      {
         _catalog.setupInventoryForRecycler(false);
         var _loc1_:int = 0;
         while(_loc1_ < const_181)
         {
            releaseSlot(_loc1_);
            _loc1_++;
         }
         var_284 = const_787;
      }
      
      public function setFinished(param1:int, param2:int) : void
      {
         var status:int = param1;
         var prizeId:int = param2;
         if(!statusActive)
         {
            return;
         }
         var_284 = const_368;
         if(!systemActive)
         {
            return;
         }
         switch(status)
         {
            case RecyclerFinishedMessageEvent.const_855:
               if(_view != null)
               {
                  _view.displayFinishedView();
               }
               break;
            case RecyclerFinishedMessageEvent.const_1315:
               Logger.log("* Recycler finished with FAILURE");
               _windowManager.alert("${generic.alert.title}","${recycler.info.closed}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               if(_view != null)
               {
                  _view.displayDisabledView();
               }
         }
         _catalog.setupInventoryForRecycler(false);
      }
      
      public function releaseSlot(param1:int) : void
      {
         if(!ready)
         {
            return;
         }
         if(true)
         {
            return;
         }
         if(!_catalog.returnInventoryFurniFromRecycler(var_104[param1].id))
         {
            return;
         }
         var_104[param1] = null;
         updateRecyclerSlots();
         method_2();
      }
      
      public function isReadyToRecycle() : Boolean
      {
         if(!ready || true)
         {
            return false;
         }
         if(isTradingActive())
         {
            _windowManager.alert("${generic.alert.title}","${recycler.alert.trading}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return false;
         }
         return isPoolFull();
      }
   }
}
