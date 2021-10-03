package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.avatar.enum.AvatarEditorEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.generic.BodyModel;
   import com.sulake.habbo.avatar.head.HeadModel;
   import com.sulake.habbo.avatar.hotlooks.HotLooksModel;
   import com.sulake.habbo.avatar.legs.LegsModel;
   import com.sulake.habbo.avatar.promo.ClubPromoModel;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.torso.TorsoModel;
   import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboAvatarEditor extends Component implements IHabboAvatarEditor
   {
      
      private static const const_1109:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
      
      private static const const_1107:String = "hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68";
       
      
      private var _view:AvatarEditorView;
      
      private var var_881:AvatarEditorHandler;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_236:IWindowContainer;
      
      private var var_657:ISessionDataManager;
      
      private var var_423:IAvatarRenderManager;
      
      private var var_95:Map;
      
      private var var_1089:int = 0;
      
      private var var_172:Boolean = false;
      
      private var var_509:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private const const_1108:int = 2;
      
      private var _catalog:IHabboCatalog;
      
      private var var_14:IHabboInventory;
      
      private var var_599:String;
      
      private var var_1563:Boolean;
      
      private var var_1088:IHabboAvatarEditorDataSaver = null;
      
      private var var_1564:Boolean = false;
      
      private var var_148:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_740:IFigureData;
      
      private var var_424:Map;
      
      public function HabboAvatarEditor(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_599 = FigureData.const_66;
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
      }
      
      public function getFigureSetType(param1:String) : ISetType
      {
         if(var_740 == null)
         {
            return null;
         }
         return var_740.getSetType(param1);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
      }
      
      public function useClubClothing() : void
      {
         if(var_95 == null)
         {
            return;
         }
         if(var_1563)
         {
            return;
         }
         var_1563 = true;
         update();
      }
      
      public function close() : void
      {
         if(var_236 != null)
         {
            var_236.visible = false;
         }
         else
         {
            this.events.dispatchEvent(new AvatarEditorClosedEvent());
         }
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = param2 as IHabboCatalog;
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_148 = param2 as IHabboConfigurationManager;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return var_657;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_95)
         {
            _loc1_.reset();
         }
         for each(_loc2_ in var_424)
         {
            _loc2_.reset();
         }
         if(_view)
         {
            _view.update();
         }
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_172)
         {
            var_509 = new Dictionary();
            var_509["null"] = new FigureData(this);
            var_509["null"] = new FigureData(this);
            _loc1_ = var_509["null"];
            _loc2_ = var_509["null"];
            _loc1_.loadAvatarData(const_1109,FigureData.const_66);
            _loc2_.loadAvatarData(const_1107,FigureData.FEMALE);
            var_95 = new Map();
            var_424 = new Map();
            var_95.add(AvatarEditorFigureCategory.const_719,new BodyModel(this));
            var_95.add(AvatarEditorFigureCategory.const_41,new HeadModel(this));
            var_95.add(AvatarEditorFigureCategory.const_193,new TorsoModel(this));
            var_95.add(AvatarEditorFigureCategory.const_713,new LegsModel(this));
            var_95.add(AvatarEditorFigureCategory.HOTLOOKS,new HotLooksModel(this));
            var_424.add(AvatarEditorSideCategory.const_94,new WardrobeModel(this));
            var_424.add(AvatarEditorSideCategory.const_393,new ClubPromoModel(this));
            var_172 = true;
         }
      }
      
      public function set gender(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_599 == param1)
         {
            return;
         }
         var_599 = param1;
         for each(_loc2_ in var_95)
         {
            _loc2_.reset();
         }
         if(_view != null)
         {
            _view.update();
         }
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_657 = param2 as ISessionDataManager;
      }
      
      private function orderByClub(param1:AvatarEditorGridPartItem, param2:AvatarEditorGridPartItem) : Number
      {
         var _loc3_:Number = param1.partSet == null ? -1 : Number(Number(param1.partSet.clubLevel));
         var _loc4_:Number = param2.partSet == null ? -1 : Number(Number(param2.partSet.clubLevel));
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partSet.id < param2.partSet.id)
         {
            return -1;
         }
         if(param1.partSet.id > param2.partSet.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _localization;
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function hasInvalidClubItems() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc1_:Boolean = false;
         for each(_loc2_ in var_95)
         {
            _loc3_ = _loc2_.hasClubItemsOverLevel(clubMemberLevel);
            if(_loc3_)
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(var_148 != null)
         {
            var_148.release(new IIDHabboConfigurationManager());
            var_148 = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_localization != null)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_423 != null)
         {
            var_423.release(new IIDAvatarRenderManager());
            var_423 = null;
         }
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(var_14 != null)
         {
            var_14.release(new IIDHabboInventory());
            var_14 = null;
         }
         if(var_95 != null)
         {
            for each(_loc1_ in var_95)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_95 = null;
         }
         if(var_424 != null)
         {
            for each(_loc2_ in var_424)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
            var_424 = null;
         }
         if(var_236 != null)
         {
            var_236.dispose();
            var_236 = null;
         }
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         if(var_881 != null)
         {
            var_881.dispose();
            var_881 = null;
         }
         var_740 = null;
         var_509 = null;
         var_1088 = null;
         super.dispose();
      }
      
      public function saveCurrentSelection() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(var_1088 != null)
         {
            _loc1_ = figureData.getFigureString();
            _loc2_ = "null";
            var_1088.saveFigure(_loc1_,_loc2_);
         }
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function getDefaultColour(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:ISetType = getFigureSetType(param1);
         if(_loc2_ != null)
         {
            _loc3_ = getPalette(_loc2_.paletteID);
            for each(_loc4_ in _loc3_.colors)
            {
               if(_loc4_.isSelectable && var_1089 >= _loc4_.clubLevel)
               {
                  return _loc4_.id;
               }
            }
         }
         return -1;
      }
      
      public function get figureData() : FigureData
      {
         return var_509[var_599];
      }
      
      public function generateDataContent(param1:IAvatarEditorCategoryModel, param2:String) : CategoryData
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:Boolean = false;
         var _loc16_:* = false;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:Boolean = false;
         var _loc24_:* = null;
         if(!param1)
         {
            return null;
         }
         if(!param2)
         {
            return null;
         }
         var _loc3_:* = [];
         var _loc4_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < const_1108)
         {
            _loc4_.push(new Array());
            _loc5_++;
         }
         _loc8_ = getFigureSetType(param2);
         if(!_loc8_)
         {
            return null;
         }
         if(_loc8_ != null)
         {
            _loc9_ = getPalette(_loc8_.paletteID);
            if(!_loc9_)
            {
               return null;
            }
            _loc10_ = figureData.getColourIds(param2);
            if(!_loc10_)
            {
               _loc10_ = new Array();
            }
            _loc11_ = new Array(_loc10_.length);
            _loc12_ = isClubTryoutAllowed() && var_1563;
            for each(_loc13_ in _loc9_.colors)
            {
               if(_loc13_.isSelectable && (_loc12_ || var_1089 >= _loc13_.clubLevel))
               {
                  _loc17_ = 0;
                  while(_loc17_ < const_1108)
                  {
                     _loc18_ = new AvatarEditorGridColorItem(AvatarEditorView.var_1720.clone() as IWindowContainer,param1,_loc13_);
                     _loc4_[_loc17_].push(_loc18_);
                     _loc17_++;
                  }
                  if(param2 != FigureData.FACE)
                  {
                     _loc19_ = 0;
                     while(_loc19_ < _loc10_.length)
                     {
                        if(_loc13_.id == _loc10_[_loc19_])
                        {
                           _loc11_[_loc19_] = _loc13_;
                        }
                        _loc19_++;
                     }
                  }
               }
            }
            if(_loc12_)
            {
               _loc20_ = 2;
               _loc14_ = var_423.getMandatoryAvatarPartSetIds(gender,_loc20_);
            }
            else
            {
               _loc14_ = var_423.getMandatoryAvatarPartSetIds(gender,clubMemberLevel);
            }
            _loc15_ = Boolean(_loc14_.indexOf(param2) == -1);
            if(_loc15_)
            {
               _loc21_ = _assets.getAssetByName("removeSelection") as BitmapDataAsset;
               if(_loc21_)
               {
                  _loc22_ = (_loc21_.content as BitmapData).clone();
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1483.clone() as IWindowContainer,param1,null,null,false);
                  _loc7_.iconImage = _loc22_;
                  _loc3_.push(_loc7_);
               }
            }
            _loc16_ = param2 != FigureData.FACE;
            for each(_loc6_ in _loc8_.partSets)
            {
               _loc23_ = false;
               if(_loc6_.gender == FigureData.const_1246)
               {
                  _loc23_ = true;
               }
               else if(_loc6_.gender == gender)
               {
                  _loc23_ = true;
               }
               if(_loc6_.isSelectable && _loc23_ && (_loc12_ || var_1089 >= _loc6_.clubLevel))
               {
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1483.clone() as IWindowContainer,param1,_loc6_,_loc11_,_loc16_);
                  _loc3_.push(_loc7_);
               }
            }
         }
         _loc3_.sort(orderByClub);
         _loc5_ = 0;
         while(_loc5_ < const_1108)
         {
            _loc24_ = _loc4_[_loc5_] as Array;
            _loc24_.sort(orderPaletteByClub);
            _loc5_++;
         }
         return new CategoryData(_loc3_,_loc4_);
      }
      
      public function get wardrobe() : WardrobeModel
      {
         if(!var_172)
         {
            init();
         }
         return var_424.getValue(AvatarEditorSideCategory.const_94);
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _communication = param2 as IHabboCommunicationManager;
         var_881 = new AvatarEditorHandler(this,_communication);
      }
      
      public function getPalette(param1:int) : IPalette
      {
         if(var_740 == null)
         {
            return null;
         }
         return var_740.getPalette(param1);
      }
      
      public function get gender() : String
      {
         return var_599;
      }
      
      public function get handler() : AvatarEditorHandler
      {
         return var_881;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function isWardrobeAllowed() : Boolean
      {
         return !var_1564;
      }
      
      public function isClubTryoutAllowed() : Boolean
      {
         var _loc1_:String = configuration.getKey("avatareditor.allowclubtryout");
         return _loc1_ == "1" && !var_1564;
      }
      
      public function toggleAvatarEditorPage(param1:String) : void
      {
         _view.toggleCategoryView(param1,false);
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return var_423;
      }
      
      public function getSideContentWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:ISideContentModel = var_424.getValue(param1) as ISideContentModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      public function openEditor(param1:IWindowContainer = null, param2:IHabboAvatarEditorDataSaver = null, param3:Array = null, param4:Boolean = false) : Boolean
      {
         if(!var_172)
         {
            init();
         }
         var_1564 = param4;
         if(_view != null)
         {
            if(!_view.validateAvailableCategories(param3))
            {
               _view.dispose();
               _view = null;
            }
         }
         if(_view == null)
         {
            _view = new AvatarEditorView(this,_windowManager,_catalog,param3,!param4);
         }
         if(param1 != null)
         {
            param1.addChild(_view.window);
         }
         else
         {
            if(var_236 == null)
            {
               var_236 = _windowManager.createWindow("avatarEditorContainer","",HabboWindowType.const_52,HabboWindowStyle.const_37,0 | 0,new Rectangle(0,0,2,2),null,0) as IWindowContainer;
               var_236.addChild(_view.window);
               var_236.center();
               var_236.visible = false;
            }
            var_236.visible = true;
         }
         _view.show();
         if(param3 != null && param3.length > 0)
         {
            toggleAvatarEditorPage(param3[0]);
         }
         else
         {
            toggleAvatarEditorPage(AvatarEditorFigureCategory.const_719);
         }
         var_1088 = param2;
         return true;
      }
      
      private function onAvatarRendererReady(param1:Event = null) : void
      {
         var_740 = var_423.getFigureData(AvatarType.const_73);
         this.events.dispatchEvent(new Event(AvatarEditorEvent.AVATAR_EDITOR_READY));
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_423 = param2 as IAvatarRenderManager;
         (var_423 as Component).events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY,onAvatarRendererReady);
      }
      
      public function getCategoryWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IAvatarEditorCategoryModel = var_95.getValue(param1) as IAvatarEditorCategoryModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_14 = param2 as IHabboInventory;
      }
      
      public function loadAvatarInEditor(param1:String, param2:String, param3:int = 0) : void
      {
         var _loc5_:* = null;
         switch(param2)
         {
            case FigureData.const_66:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param2 = "null";
         }
         var_1089 = param3;
         var _loc4_:FigureData = var_509[param2];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.loadAvatarData(param1,param2);
         if(param2 != this.gender)
         {
            this.gender = param2;
         }
         if(var_95)
         {
            for each(_loc5_ in var_95)
            {
               _loc5_.reset();
            }
         }
         if(_view != null)
         {
            _view.update();
         }
      }
      
      public function get windowContext() : IWindowContainer
      {
         return var_236;
      }
      
      public function stripClubItems() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_95)
         {
            _loc1_.stripClubItemsOverLevel(clubMemberLevel);
         }
      }
      
      public function get clubMemberLevel() : int
      {
         return var_1089;
      }
      
      private function orderPaletteByClub(param1:AvatarEditorGridColorItem, param2:AvatarEditorGridColorItem) : Number
      {
         var _loc3_:Number = param1.partColor == null ? -1 : Number(param1.partColor.clubLevel as Number);
         var _loc4_:Number = param2.partColor == null ? -1 : Number(param2.partColor.clubLevel as Number);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partColor.index < param2.partColor.index)
         {
            return -1;
         }
         if(param1.partColor.index > param2.partColor.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_148;
      }
   }
}
