package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.AvatarActionManager;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.animation.AddDataContainer;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.AnimationLayerData;
   import com.sulake.habbo.avatar.animation.AnimationManager;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.geometry.AvatarModelGeometry;
   import com.sulake.habbo.avatar.geometry.GeometryBodyPart;
   import com.sulake.habbo.avatar.geometry.GeometryItem;
   import com.sulake.habbo.avatar.structure.AnimationData;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.AvatarStructureDownload;
   import com.sulake.habbo.avatar.structure.AvatarStructureDownloadSet;
   import com.sulake.habbo.avatar.structure.FigureData;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.PartSetsData;
   import com.sulake.habbo.avatar.structure.animation.ActionPart;
   import com.sulake.habbo.avatar.structure.animation.AnimationAction;
   import com.sulake.habbo.avatar.structure.figure.IFigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.parts.PartDefinition;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class AvatarStructure extends EventDispatcher
   {
      
      public static const AVATAR_STRUCTURE_INIT:String = "AVATAR_STRUCTURE_INIT";
      
      public static const DOWNLOAD_SET_DONE:String = "DOWNLOAD_SET_DONE";
       
      
      private var var_475:PartSetsData;
      
      private var var_1710:PartOffsetData;
      
      private var var_1008:AvatarActionManager;
      
      private var var_192:IAssetLibrary;
      
      private var var_1007:IAssetLibrary;
      
      private var var_462:AvatarRenderManager;
      
      private var var_340:FigureData;
      
      private var var_652:AnimationData;
      
      private var _geometry:AvatarModelGeometry;
      
      private var var_686:String;
      
      private var var_1709:AvatarStructureDownloadSet;
      
      private var var_827:Dictionary;
      
      private var var_826:AnimationManager;
      
      public function AvatarStructure(param1:AvatarRenderManager, param2:IAssetLibrary, param3:IAssetLibrary, param4:String)
      {
         super();
         var_462 = param1;
         var_192 = param2;
         var_1007 = param3;
         var_340 = new FigureData();
         var_475 = new PartSetsData();
         var_652 = new AnimationData();
         var_1709 = new AvatarStructureDownloadSet();
         var_826 = new AnimationManager();
         var_686 = param4;
         var_1710 = PartOffsetData.getInstance(param3);
         var_827 = new Dictionary();
         init();
      }
      
      public function isMainAvatarSet(param1:String) : Boolean
      {
         return _geometry.isMainAvatarSet(param1);
      }
      
      public function getActionDefinitionWithState(param1:String) : ActionDefinition
      {
         return var_1008.getActionDefinitionWithState(param1);
      }
      
      public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         initGeometry();
         initActions();
         switch(var_686)
         {
            case AvatarType.const_73:
               _loc1_ = var_192.getAssetByName("HabboAvatarPartSets").content as XML;
               if(!var_475.parse(_loc1_))
               {
                  return;
               }
               _loc2_ = var_192.getAssetByName("HabboAvatarAnimation").content as XML;
               if(!var_652.parse(_loc2_))
               {
                  return;
               }
               _loc3_ = var_192.getAssetByName("HabboAvatarFigure").content as XML;
               if(!var_340.parse(_loc3_))
               {
                  return;
               }
               break;
            case AvatarType.PET:
               _loc1_ = var_192.getAssetByName("HabboAvatarPetPartSets").content as XML;
               if(!var_475.parse(_loc1_))
               {
                  return;
               }
               _loc2_ = var_192.getAssetByName("HabboAvatarPetAnimation").content as XML;
               if(!var_652.parse(_loc2_))
               {
                  return;
               }
               _loc3_ = var_192.getAssetByName("HabboAvatarPetFigure").content as XML;
               if(!var_340.parse(_loc3_))
               {
                  return;
               }
               break;
         }
         onStructureReady();
      }
      
      public function getCanvasOffsets(param1:Array, param2:String, param3:int) : Array
      {
         return var_1008.getCanvasOffsets(param1,param2,param3);
      }
      
      public function injectFigureData(param1:XML) : void
      {
         var_340.injectXML(param1);
      }
      
      public function getActionDefinition(param1:String) : ActionDefinition
      {
         return var_1008.getActionDefinition(param1);
      }
      
      public function getActiveBodyPartIds(param1:IActiveActionData) : Array
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc2_:* = [];
         var _loc3_:Array = new Array();
         var _loc4_:String = param1.definition.geometryType;
         if(param1.definition.isAnimation)
         {
            _loc6_ = param1.definition.state + "." + param1.actionParameter;
            _loc7_ = var_826.getAnimation(_loc6_);
            if(_loc7_ != null)
            {
               _loc2_ = _loc7_.getAnimatedBodyPartIds(0);
               if(_loc7_.hasAddData())
               {
                  _loc10_ = <item id="" x="0" y="0" z="0" radius="0.01" nx="0" ny="0" nz="-1" double="1"/>;
                  _loc11_ = <part/>;
                  for each(_loc12_ in _loc7_.addData)
                  {
                     _loc5_ = _geometry.method_3(_loc4_,_loc12_.align);
                     if(_loc5_ != null)
                     {
                        _loc10_.@id = _loc12_.id;
                        _loc5_.addPart(_loc10_);
                        _loc11_["set-type"] = _loc12_.id;
                        _loc9_ = var_475.addPartDefinition(_loc11_);
                        _loc9_.appendToFigure = true;
                        if(_loc12_.base == "")
                        {
                           _loc9_.staticId = 1;
                        }
                        if(_loc3_.indexOf(_loc5_.id) == -1)
                        {
                           _loc3_.push(_loc5_.id);
                        }
                     }
                  }
               }
            }
            for each(_loc8_ in _loc2_)
            {
               _loc5_ = _geometry.method_3(_loc4_,_loc8_);
               if(_loc5_ != null)
               {
                  if(_loc3_.indexOf(_loc5_.id) == -1)
                  {
                     _loc3_.push(_loc5_.id);
                  }
               }
            }
         }
         else
         {
            _loc2_ = var_475.getActiveParts(param1.definition);
            for each(_loc13_ in _loc2_)
            {
               _loc5_ = _geometry.getBodyPartOfItem(_loc4_,_loc13_);
               if(_loc5_ != null)
               {
                  if(_loc3_.indexOf(_loc5_.id) == -1)
                  {
                     _loc3_.push(_loc5_.id);
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function getBodyParts(param1:String, param2:IActionDefinition, param3:int) : Array
      {
         var _loc4_:Number = AvatarDirectionAngle.const_1422[param3];
         return _geometry.getBodyPartsAtAngle(param1,_loc4_,param2);
      }
      
      public function getParts(param1:String, param2:AvatarFigureContainer, param3:IActiveActionData, param4:String, param5:int, param6:Array, param7:Dictionary = null) : Array
      {
         var _loc10_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:* = null;
         var _loc34_:* = false;
         var _loc35_:* = null;
         var _loc36_:* = null;
         var _loc37_:Boolean = false;
         var _loc38_:* = null;
         var _loc39_:int = 0;
         var _loc40_:int = 0;
         var _loc41_:* = null;
         var _loc42_:Boolean = false;
         var _loc43_:* = NaN;
         var _loc44_:int = 0;
         var _loc45_:* = null;
         if(param3 == null)
         {
            Logger.log("[AvatarStructure] getParts action == NULL!! bodyPartId: " + param1);
            return [];
         }
         if(param1 == "item")
         {
            if(param2.getPartTypeIds().indexOf("ri") >= 0)
            {
            }
         }
         var _loc8_:ActionDefinition = var_1008.getDefaultAction();
         var _loc9_:Array = var_475.getActiveParts(param3.definition);
         var _loc11_:Array = new Array();
         if(param3.definition.isAnimation)
         {
            _loc19_ = param3.definition.state + "." + param3.actionParameter;
            _loc10_ = var_826.getAnimation(_loc19_);
            if(_loc10_ != null)
            {
               for each(_loc20_ in _loc10_.getAnimatedBodyPartIds(0))
               {
                  if(_loc20_ == param1)
                  {
                     _loc21_ = _geometry.method_3(param4,_loc20_);
                     if(_loc21_ != null)
                     {
                        for each(_loc22_ in _loc21_.getDynamicParts())
                        {
                           _loc9_.push(_loc22_.id);
                        }
                     }
                  }
               }
            }
         }
         var _loc14_:Array = _geometry.getParts(param4,param1,param5,_loc9_);
         var _loc15_:Array = param2.getPartTypeIds();
         for each(_loc16_ in _loc15_)
         {
            if(param7 != null)
            {
               if(param7[_loc16_] != null)
               {
                  continue;
               }
            }
            _loc23_ = param2.getPartSetId(_loc16_);
            _loc24_ = param2.getPartColorIds(_loc16_);
            _loc25_ = var_340.getSetType(_loc16_);
            if(_loc25_ != null)
            {
               _loc26_ = var_340.getPalette(_loc25_.paletteID);
               if(_loc26_)
               {
                  _loc27_ = _loc25_.getPartSet(_loc23_);
                  if(_loc27_ != null)
                  {
                     param6 = param6.concat(_loc27_.hiddenLayers);
                     for each(_loc28_ in _loc27_.parts)
                     {
                        if(_loc14_.indexOf(_loc28_.type) > -1)
                        {
                           _loc29_ = [0];
                           _loc30_ = var_652.getAction(param3.definition);
                           if(_loc30_ != null)
                           {
                              _loc36_ = _loc30_.getPart(_loc28_.type);
                              if(_loc36_ != null)
                              {
                                 _loc29_ = _loc36_.frames;
                              }
                           }
                           _loc31_ = param3.definition;
                           if(_loc9_.indexOf(_loc28_.type) == -1)
                           {
                              _loc31_ = _loc8_;
                           }
                           _loc13_ = var_475.getPartDefinition(_loc28_.type);
                           _loc32_ = _loc13_ == null ? _loc28_.type : _loc13_.flippedSetType;
                           if(_loc32_ == "")
                           {
                              _loc32_ = _loc28_.type;
                           }
                           if(_loc24_.length > _loc28_.colorLayerIndex - 1)
                           {
                              _loc33_ = _loc26_.getColor(_loc24_[_loc28_.colorLayerIndex - 1]);
                           }
                           _loc34_ = _loc28_.colorLayerIndex > 0;
                           _loc35_ = new AvatarImagePartContainer(param1,_loc28_.type,_loc28_.id,_loc33_,_loc29_,_loc31_,_loc34_,_loc28_.paletteMap,_loc32_);
                           _loc11_.push(_loc35_);
                        }
                     }
                  }
               }
            }
         }
         _loc18_ = new Array();
         for each(_loc12_ in _loc14_)
         {
            _loc37_ = false;
            for each(_loc17_ in _loc11_)
            {
               if(_loc17_.partType == _loc12_)
               {
                  _loc37_ = true;
                  if(param6.indexOf(_loc12_) == -1)
                  {
                     _loc18_.push(_loc17_);
                  }
               }
            }
            if(!_loc37_)
            {
               if(param7 != null)
               {
                  if(param7[_loc12_] != null)
                  {
                     _loc38_ = param7[_loc12_];
                     _loc39_ = 0;
                     _loc40_ = 0;
                     while(_loc40_ < _loc38_.length)
                     {
                        _loc39_ += _loc38_.charCodeAt(_loc40_);
                        _loc40_++;
                     }
                     _loc35_ = new AvatarImagePartContainer(param1,_loc12_,_loc39_,null,[0],param3.definition,false,-1,_loc12_,false,1);
                     _loc18_.push(_loc35_);
                  }
               }
               if(_loc9_.indexOf(_loc12_) > -1)
               {
                  _loc41_ = _geometry.getBodyPartOfItem(param4,_loc12_);
                  if(param1 != _loc41_.id)
                  {
                     Logger.log("BodypartId mismatch:" + param1 + " " + _loc41_.id);
                  }
                  else
                  {
                     _loc13_ = var_475.getPartDefinition(_loc12_);
                     _loc42_ = false;
                     _loc43_ = 1;
                     if(_loc13_.appendToFigure)
                     {
                        Logger.log("PART NOT FOUND, ALTHOUGH IT SHOULD HAVE BEEN! Add now?" + _loc12_);
                        _loc44_ = 1;
                        if(param3.actionParameter != "")
                        {
                           _loc44_ = parseInt(param3.actionParameter);
                        }
                        if(_loc13_.hasStaticId())
                        {
                           _loc44_ = _loc13_.staticId;
                           _loc13_.staticId = -1;
                        }
                        if(_loc10_ != null)
                        {
                           _loc45_ = _loc10_.getAddData(_loc12_);
                           if(_loc45_ != null)
                           {
                              _loc42_ = _loc45_.isBlended;
                              _loc43_ = Number(_loc45_.blend);
                           }
                        }
                        _loc35_ = new AvatarImagePartContainer(param1,_loc12_,_loc44_,null,[0],param3.definition,false,-1,_loc12_,_loc42_,_loc43_);
                        _loc18_.push(_loc35_);
                     }
                  }
               }
            }
         }
         return _loc18_;
      }
      
      public function get figureData() : IFigureData
      {
         return var_340;
      }
      
      private function onStructureReady(param1:Event = null) : void
      {
         Logger.log("[AvatarStructure] Structure " + var_686 + " ready to go!");
         if(var_686 == AvatarType.const_73)
         {
            var_475.getPartDefinition("ri").appendToFigure = true;
            var_475.getPartDefinition("li").appendToFigure = true;
         }
         registerAnimations();
         dispatchEvent(new Event(AVATAR_STRUCTURE_INIT));
      }
      
      private function initGeometry() : void
      {
         var _loc1_:* = null;
         switch(var_686)
         {
            case AvatarType.const_73:
               if(var_192.hasAsset("HabboAvatarGeometry"))
               {
                  _loc1_ = var_192.getAssetByName("HabboAvatarGeometry").content as XML;
                  _geometry = new AvatarModelGeometry(_loc1_);
               }
               else
               {
                  Logger.log("[AvatarStructure] Could not init human Geometry");
               }
               break;
            case AvatarType.PET:
               if(var_192.hasAsset("HabboAvatarPetGeometry"))
               {
                  _loc1_ = var_192.getAssetByName("HabboAvatarPetGeometry").content as XML;
                  _geometry = new AvatarModelGeometry(_loc1_);
               }
               else
               {
                  Logger.log("[AvatarStructure] Could not init pet Geometry");
               }
         }
      }
      
      public function get avatarType() : String
      {
         return var_686;
      }
      
      public function get renderManager() : AvatarRenderManager
      {
         return var_462;
      }
      
      public function initConfiguration(param1:IHabboConfigurationManager) : void
      {
         var _loc5_:String = param1.getKey("external.figurepartlist.txt");
         switch(var_686)
         {
            case AvatarType.const_73:
               if(var_192.hasAsset(_loc5_))
               {
                  var_192.removeAsset(var_192.getAssetByName(_loc5_));
               }
               var_1709.add(new AvatarStructureDownload(var_192,_loc5_,var_340));
               break;
            case AvatarType.PET:
         }
         var_1709.addEventListener(AvatarStructureDownloadSet.DOWNLOAD_SET_DONE,onStructureReady);
      }
      
      public function getAnimation(param1:String) : Animation
      {
         return var_826.getAnimation(param1);
      }
      
      public function getCanvas(param1:String, param2:String) : AvatarCanvas
      {
         return _geometry.getCanvas(param1,param2);
      }
      
      public function displayGeometry(param1:Stage) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:* = null;
         var _loc2_:BitmapData = new BitmapData(960,540,false,4294967295);
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         param1.addChild(_loc3_);
         var _loc4_:Number = _loc2_.width / 2;
         var _loc5_:Number = _loc2_.height / 2;
         var _loc7_:TextField = new TextField();
         var _loc8_:Matrix = new Matrix();
         for each(_loc9_ in _geometry.getBodyPartIdsInAvatarSet("full"))
         {
            _loc10_ = _geometry.method_3("vertical",_loc9_);
            Logger.log("Drawing bodypart : " + _loc9_);
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.location.x * 200;
               _loc12_ = _loc10_.location.z * 200;
               _loc13_ = _loc10_.radius * 200;
               _loc14_ = new Shape();
               _loc14_.graphics.lineStyle(1,4294901760,1);
               _loc14_.graphics.drawCircle(_loc4_ + _loc11_,_loc5_ + _loc12_,_loc13_);
               _loc2_.draw(_loc14_);
               _loc7_.text = _loc9_;
               _loc7_.textColor = 4294901760;
               _loc8_.identity();
               _loc8_.tx = _loc4_ + _loc11_ + _loc13_ - _loc7_.textWidth - 5;
               _loc8_.ty = _loc5_ + _loc12_ - 5;
               _loc2_.draw(_loc7_,_loc8_);
            }
            else
            {
               Logger.log("Could not draw bodypart : " + _loc9_);
            }
         }
      }
      
      private function initActions() : void
      {
         var_1008 = new AvatarActionManager(var_192,var_686);
      }
      
      public function getMandatorySetTypeIds(param1:String, param2:int) : Array
      {
         if(true)
         {
            var_827[param1] = new Dictionary();
         }
         if(var_827[param1][param2])
         {
            return var_827[param1][param2];
         }
         var_827[param1][param2] = var_340.getMandatorySetTypeIds(param1,param2);
         return var_827[param1][param2];
      }
      
      public function getDefaultPartSet(param1:String, param2:String) : IFigurePartSet
      {
         return var_340.getDefaultPartSet(param1,param2);
      }
      
      public function removeDynamicItems() : void
      {
         _geometry.removeDynamicItems();
      }
      
      public function getBodyPartsUnordered(param1:String) : Array
      {
         return _geometry.getBodyPartIdsInAvatarSet(param1);
      }
      
      private function registerAnimations() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 1;
         while(var_1007.hasAsset("dance" + _loc1_))
         {
            _loc2_ = var_1007.getAssetByName("dance" + _loc1_).content as XML;
            var_826.registerAnimation(this,_loc2_);
            _loc1_++;
         }
         _loc1_ = 1;
         while(var_1007.hasAsset("fx" + _loc1_))
         {
            _loc2_ = var_1007.getAssetByName("fx" + _loc1_).content as XML;
            var_826.registerAnimation(this,_loc2_);
            _loc1_++;
         }
      }
      
      public function getBodyPartData(param1:String, param2:int, param3:String) : AnimationLayerData
      {
         return var_826.getLayerData(param1,param2,param3);
      }
      
      public function getPartActionOffset(param1:int, param2:String, param3:String, param4:String, param5:int, param6:int) : Point
      {
         return var_1710.getOffset(param1,param2,param3,param4,param5,param6);
      }
      
      public function getPartColor(param1:AvatarFigureContainer, param2:String, param3:int = 0) : IPartColor
      {
         var _loc4_:Array = param1.getPartColorIds(param2);
         if(!_loc4_ || _loc4_.length < param3)
         {
            return null;
         }
         var _loc5_:ISetType = var_340.getSetType(param2);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:IPalette = var_340.getPalette(_loc5_.paletteID);
         if(!_loc6_)
         {
            return null;
         }
         return _loc6_.getColor(_loc4_[param3]);
      }
      
      public function resetPartOffsets() : void
      {
         var_1710.loadOffsets(var_1007);
      }
      
      public function sortActions(param1:Array) : Array
      {
         return var_1008.sortActions(param1);
      }
   }
}
