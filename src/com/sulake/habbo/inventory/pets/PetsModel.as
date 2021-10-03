package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.pets.GetPetInventoryComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.PlacePetMessageComposer;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class PetsModel implements IInventoryModel
   {
       
      
      private var _view:PetsView;
      
      private var _controller:HabboInventory;
      
      private var _disposed:Boolean = false;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1072:Map;
      
      private var _roomEngine:IRoomEngine;
      
      private var _assets:IAssetLibrary;
      
      private var var_1430:Boolean = false;
      
      public function PetsModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IHabboLocalizationManager, param6:IRoomEngine, param7:IAvatarRenderManager)
      {
         super();
         _controller = param1;
         _assets = param4;
         _communication = param3;
         _roomEngine = param6;
         _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_197,onObjectPlaced);
         var_1072 = new Map();
         _view = new PetsView(this,param2,param4,param5,param7);
      }
      
      public function removePet(param1:int) : void
      {
         var_1072.remove(param1);
         _view.removePet(param1);
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_142 && false)
         {
            _controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_PETS));
         }
      }
      
      public function updateView() : void
      {
         if(_view == null)
         {
            return;
         }
         _view.update();
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         requestPetInventory();
      }
      
      private function getPetById(param1:int) : PetData
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_1072)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _view.getWindowContainer();
      }
      
      public function switchCategory(param1:String) : void
      {
         _controller.furniModel.switchCategory(param1);
         _controller.toggleInventoryPage(InventoryCategory.const_74);
      }
      
      public function updatePetsAllowed() : void
      {
         _view.update();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_1430 && param1.type == RoomEngineObjectEvent.const_197)
         {
            _controller.showView();
            var_1430 = false;
         }
      }
      
      public function refreshViews() : void
      {
         _view.update();
      }
      
      public function requestPetInventory() : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new GetPetInventoryComposer());
      }
      
      public function get pets() : Map
      {
         return var_1072;
      }
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:PetData = getPetById(param1);
         if(_loc3_ == null)
         {
            return;
         }
         if(_controller.roomSession.isRoomOwner)
         {
            var_1430 = _roomEngine.initializeRoomObjectInsert(_loc3_.id,RoomObjectCategoryEnum.const_34,RoomObjectTypeEnum.const_222,_loc3_.figure);
            _controller.closeView();
            return;
         }
         if(!_controller.roomSession.arePetsAllowed)
         {
            return;
         }
         if(!param2)
         {
            _communication.getHabboMainConnection(null).send(new PlacePetMessageComposer(_loc3_.id,0,0));
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _controller = null;
            if(_view != null)
            {
               _view.dispose();
            }
            _assets = null;
            _communication = null;
            _disposed = true;
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function addPet(param1:PetData) : void
      {
         if(var_1072.add(param1.id,param1))
         {
            _view.addPet(param1);
         }
      }
      
      public function get roomSession() : IRoomSession
      {
         return _controller.roomSession;
      }
   }
}
