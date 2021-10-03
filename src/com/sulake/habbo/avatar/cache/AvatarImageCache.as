package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
   import com.sulake.habbo.avatar.AvatarImagePartContainer;
   import com.sulake.habbo.avatar.AvatarStructure;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.AnimationLayerData;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarBodyPartType;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.GeometryType;
   import com.sulake.habbo.avatar.palette.PaletteMap;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class AvatarImageCache
   {
      
      private static const const_1489:int = 60000;
       
      
      private var var_145:Map;
      
      private var var_155:String;
      
      private var _assets:AssetAliasCollection;
      
      private var var_651:String;
      
      private var var_83:AvatarStructure;
      
      private var var_861:IAvatarImage;
      
      public function AvatarImageCache(param1:AvatarStructure, param2:IAvatarImage, param3:AssetAliasCollection, param4:String)
      {
         super();
         var_83 = param1;
         var_861 = param2;
         _assets = param3;
         var_155 = param4;
         var_145 = new Map();
      }
      
      private function updateBodyPartCache(param1:String, param2:AvatarImageBodyPartCache) : void
      {
         if(var_145 == null)
         {
            var_145 = new Map();
         }
         var_145.add(param1,param2);
      }
      
      public function setGeometryType(param1:String) : void
      {
         if(var_651 == param1 || var_651 == GeometryType.const_877 && param1 == GeometryType.const_834 || param1 == GeometryType.const_877 && var_651 == GeometryType.const_834)
         {
            var_651 = param1;
            return;
         }
         disposeInactiveActions(0);
         var_651 = param1;
      }
      
      public function getAnimationDataInFrame(param1:String, param2:int) : AnimationLayerData
      {
         var _loc5_:* = null;
         var _loc3_:AvatarImageBodyPartCache = getBodyPartCache(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:IActiveActionData = _loc3_.getAction();
         if(_loc4_ == null || !_loc4_.definition.isAnimation)
         {
            return null;
         }
         return var_83.getBodyPartData(_loc4_.definition.state + "." + _loc4_.actionParameter,param2,param1);
      }
      
      public function getBodyPartCache(param1:String) : AvatarImageBodyPartCache
      {
         if(var_145 == null)
         {
            var_145 = new Map();
         }
         var _loc2_:AvatarImageBodyPartCache = var_145.getValue(param1) as AvatarImageBodyPartCache;
         if(_loc2_ == null)
         {
            _loc2_ = new AvatarImageBodyPartCache();
            var_145.add(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function getImageContainer(param1:String, param2:int) : AvatarImageBodyPartContainer
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc3_:AvatarImageBodyPartCache = getBodyPartCache(param1);
         if(_loc3_ == null)
         {
            debugInfo("[CacheMiss (getBodyPartCache)] [AvatarImageCache.getImageContainer] bodyPartId: " + param1);
            _loc3_ = new AvatarImageBodyPartCache();
            updateBodyPartCache(param1,_loc3_);
         }
         var _loc4_:int = _loc3_.getDirection();
         var _loc5_:IActiveActionData = _loc3_.getAction();
         var _loc6_:IActiveActionData = _loc5_;
         var _loc7_:Boolean = false;
         var _loc8_:int = _loc4_;
         var _loc9_:Point = new Point(0,0);
         var _loc12_:int = param2;
         var _loc13_:* = [];
         var _loc14_:Dictionary = new Dictionary();
         if(!_loc5_ || !_loc5_.definition)
         {
            debugInfo("Action not found!");
         }
         else if(_loc5_.definition.isAnimation)
         {
            _loc17_ = var_83.getAnimation(_loc5_.definition.state + "." + _loc5_.actionParameter);
            if(_loc17_ != null)
            {
               _loc18_ = _loc17_.getLayerData(param2,param1);
               if(_loc18_ != null)
               {
                  _loc8_ = _loc4_ + _loc18_.directionOffset;
                  if(_loc18_.directionOffset < 0)
                  {
                     if(_loc8_ < 0)
                     {
                        _loc8_ = 8 + _loc8_;
                     }
                     if(_loc8_ > 7)
                     {
                        _loc8_ = 8 - _loc8_;
                     }
                  }
                  else
                  {
                     if(_loc8_ < 0)
                     {
                        _loc8_ += 8;
                     }
                     if(_loc8_ > 7)
                     {
                        _loc8_ -= 8;
                     }
                  }
                  if(var_155 == AvatarScaleType.SMALL)
                  {
                     _loc9_.x = _loc18_.dx / 2;
                     _loc9_.y = _loc18_.dy / 2;
                  }
                  else
                  {
                     _loc9_.x = _loc18_.dx;
                     _loc9_.y = _loc18_.dy;
                  }
                  _loc12_ = _loc18_.animationFrame;
                  if(_loc18_.action != null)
                  {
                     _loc5_ = _loc18_.action;
                  }
                  if(_loc18_.type == AnimationLayerData.const_661)
                  {
                     if(_loc18_.action != null)
                     {
                        _loc6_ = _loc18_.action;
                     }
                     _loc4_ = _loc8_;
                  }
                  else if(_loc18_.type == AnimationLayerData.const_448)
                  {
                     _loc4_ = _loc8_;
                  }
                  _loc7_ = true;
               }
               _loc13_ = _loc17_.removeData;
               _loc14_ = _loc18_.items;
            }
         }
         var _loc15_:AvatarImageActionCache = _loc3_.getActionCache(_loc6_);
         if(_loc15_ == null)
         {
            debugInfo("[CacheMiss (bodyPartCache.getActionCache)] [AvatarImageCache.getImageContainer] action.id: " + [param1,_loc5_.id]);
            _loc15_ = new AvatarImageActionCache();
            _loc3_.updateActionCache(_loc6_,_loc15_);
         }
         var _loc16_:AvatarImageDirectionCache = _loc15_.getDirectionCache(_loc4_);
         if(_loc16_ == null)
         {
            debugInfo("[CacheMiss (actionCache.getDirectionCache)] [AvatarImageCache.getImageContainer] direction: " + [param1,_loc4_]);
            _loc10_ = var_83.getParts(param1,var_861.getFigure(),_loc6_,var_651,_loc4_,_loc13_,_loc14_);
            _loc16_ = new AvatarImageDirectionCache(_loc10_);
            _loc15_.updateDirectionCache(_loc4_,_loc16_);
         }
         _loc11_ = _loc16_.getImageContainer(_loc12_);
         if(_loc11_ == null)
         {
            debugInfo("[ImageContainer (" + _loc5_.id + " " + _loc5_.definition + " type: " + _loc5_.actionType + ")]");
            _loc19_ = _loc16_.getPartList();
            _loc11_ = renderBodyPart(_loc4_,_loc19_,_loc12_,_loc5_);
            if(_loc11_ != null)
            {
               debugInfo("[ImageContainer creation (" + _loc5_.id + " " + _loc5_.definition + " type: " + _loc5_.actionType + ")]");
               _loc16_.updateImageContainer(_loc11_,_loc12_);
            }
            else
            {
               debugInfo("[ImageContainer was null: " + param1 + "]");
            }
         }
         if(_loc11_ != null)
         {
            _loc11_.offset = _loc9_;
         }
         return _loc11_;
      }
      
      public function dispose() : void
      {
         debugInfo("[AvatarImageCache dispose]");
         var_83 = null;
         var_861 = null;
         _assets = null;
         if(var_145 != null)
         {
            var_145.dispose();
         }
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      private function createUnionImage(param1:Array, param2:Boolean) : ImageData
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc5_:Rectangle = new Rectangle();
         for each(_loc6_ in param1)
         {
            _loc5_ = _loc5_.union(_loc6_.offsetRect);
         }
         _loc4_ = new Point(-_loc5_.left,-_loc5_.top);
         _loc3_ = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
         for each(_loc6_ in param1)
         {
            _loc7_ = _loc4_.subtract(_loc6_.regpoint);
            _loc3_.copyPixels(_loc6_.bitmap,_loc6_.bitmap.rect,_loc7_,null,null,true);
         }
         return new ImageData(_loc3_,_loc4_,param2,false);
      }
      
      private function renderBodyPart(param1:int, param2:Array, param3:int, param4:IActiveActionData) : AvatarImageBodyPartContainer
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         var _loc19_:int = 0;
         var _loc21_:* = null;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:* = null;
         var _loc36_:* = null;
         var _loc37_:* = null;
         var _loc38_:* = NaN;
         var _loc39_:* = null;
         if(param2 == null)
         {
            return null;
         }
         if(param2.length == 0)
         {
            return null;
         }
         var _loc5_:AvatarCanvas = var_83.getCanvas(var_155,var_651);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = false;
         var _loc20_:Boolean = false;
         var _loc22_:Point = new Point(0,_loc5_.height - int(_loc5_.width / 4));
         var _loc23_:Array = new Array();
         var _loc24_:int = param2.length - 1;
         while(_loc24_ >= 0)
         {
            _loc7_ = param2[_loc24_] as AvatarImagePartContainer;
            _loc19_ = param1;
            _loc6_ = _loc7_.bodyPartId;
            _loc7_ = param2[_loc24_];
            _loc10_ = _loc7_.partType;
            _loc11_ = _loc7_.partId;
            _loc12_ = _loc7_.getFrameIndex(param3);
            _loc13_ = _loc7_.color;
            _loc15_ = _loc7_.action;
            _loc16_ = _loc7_.isColorable;
            _loc20_ = _loc7_.isBlendable;
            _loc21_ = _loc7_.blendTransform;
            _loc18_ = false;
            if(_loc10_ == "ey")
            {
               _loc16_ = false;
            }
            _loc29_ = param4.definition.assetPartDefinition;
            _loc30_ = param4.definition.state;
            if(AvatarDirectionAngle.const_1192[param1])
            {
               if(!((_loc10_ == "lh" || _loc10_ == "ls" || _loc10_ == "lc" || _loc10_ == "lhs") && _loc29_ == "wav"))
               {
                  if(!((_loc10_ == "rh" || _loc10_ == "rs" || _loc10_ == "rc" || _loc10_ == "rhs") && _loc29_ == "drk"))
                  {
                     if(!(_loc10_ == "rhs" && _loc29_ == "crr"))
                     {
                        if(_loc10_ != "ri")
                        {
                           if(_loc10_ == "cp")
                           {
                              _loc18_ = true;
                           }
                           else
                           {
                              _loc17_ = true;
                              if(param1 == 4)
                              {
                                 _loc19_ = 2;
                              }
                              else if(param1 == 5)
                              {
                                 _loc19_ = 1;
                              }
                              else if(param1 == 6)
                              {
                                 _loc19_ = 0;
                              }
                              if(_loc7_.flippedPartType != _loc10_)
                              {
                                 _loc10_ = _loc7_.flippedPartType;
                              }
                           }
                        }
                     }
                  }
               }
            }
            _loc9_ = var_155 + "_" + _loc15_.assetPartDefinition + "_" + _loc10_ + "_" + _loc11_ + "_" + _loc19_ + "_" + _loc12_;
            _loc14_ = _assets.getAssetByName(_loc9_) as BitmapDataAsset;
            if(_loc14_ == null)
            {
               _loc9_ = var_155 + "_std_" + _loc10_ + "_" + _loc11_ + "_" + _loc19_ + "_0";
               _loc14_ = _assets.getAssetByName(_loc9_) as BitmapDataAsset;
            }
            if(!(!_loc14_ || !_loc14_.content))
            {
               if(_loc7_.paletteMapId > -1)
               {
                  _loc33_ = var_83.renderManager.paletteManager.getPalette(_loc7_.paletteMapId);
                  _loc34_ = (_loc14_.content as BitmapData).clone();
                  if(_loc34_ != null && _loc33_ != null)
                  {
                     _loc35_ = _loc34_.getPixels(_loc34_.rect);
                     _loc36_ = _loc33_.colorize(_loc35_);
                     _loc8_ = new BitmapData(_loc34_.width,_loc34_.height);
                     _loc8_.setPixels(_loc8_.rect,_loc36_);
                  }
                  else
                  {
                     _loc8_ = (_loc14_.content as BitmapData).clone();
                  }
               }
               else
               {
                  _loc8_ = (_loc14_.content as BitmapData).clone();
               }
               debugInfo("Render part: " + _loc9_);
               if(_loc8_ == null)
               {
                  return null;
               }
               if((_loc30_ == AvatarAction.const_977 || _loc30_ == AvatarAction.const_405) && (_loc6_ == AvatarBodyPartType.const_193 || _loc6_ == AvatarBodyPartType.const_1210 || _loc6_ == AvatarBodyPartType.const_1407) && _loc7_.color != null)
               {
                  _loc37_ = _loc7_.color.colorTransform;
                  _loc38_ = 0.7;
                  _loc39_ = new ColorTransform(_loc37_.redMultiplier * _loc38_,_loc37_.greenMultiplier * _loc38_ + 0.3,_loc37_.blueMultiplier * _loc38_ + 0.3,_loc37_.alphaMultiplier,0,0,20);
                  _loc8_.colorTransform(_loc8_.rect,_loc39_);
               }
               else if(_loc16_ && _loc7_.color != null)
               {
                  _loc8_.colorTransform(_loc8_.rect,_loc7_.color.colorTransform);
               }
               if(_loc20_)
               {
                  _loc8_.colorTransform(_loc8_.rect,_loc21_);
               }
               _loc31_ = _loc14_.offset.clone();
               if(_loc18_)
               {
                  if(var_155 == AvatarScaleType.const_50)
                  {
                     _loc31_.x += 65;
                  }
                  else
                  {
                     _loc31_.x += 31;
                  }
               }
               _loc32_ = new ImageData(_loc8_,_loc31_,_loc18_,false);
               _loc23_.push(_loc32_);
            }
            _loc24_--;
         }
         if(_loc23_ == null || _loc23_.length == 0)
         {
            return null;
         }
         var _loc25_:ImageData = createUnionImage(_loc23_,_loc17_);
         var _loc26_:Point = new Point(-_loc25_.regpoint.x,_loc22_.y - _loc25_.regpoint.y);
         if(_loc17_)
         {
            if(var_155 == AvatarScaleType.const_50)
            {
               _loc26_.x += 67;
            }
            else
            {
               _loc26_.x += 31;
            }
         }
         for each(_loc27_ in _loc23_)
         {
            if(_loc27_)
            {
               _loc27_.dispose();
            }
         }
         _loc28_ = new AvatarImageBodyPartContainer(_loc25_.bitmap.clone(),_loc26_);
         _loc25_.dispose();
         return _loc28_;
      }
      
      public function setAction(param1:IActiveActionData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Array = var_83.getActiveBodyPartIds(param1);
         var _loc5_:int = getTimer();
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = getBodyPartCache(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.setAction(param1,_loc5_);
            }
         }
      }
      
      public function disposeInactiveActions(param1:int = 60000) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_145 != null)
         {
            _loc2_ = var_145.getKeys();
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = var_145.getValue(_loc3_) as AvatarImageBodyPartCache;
               if(_loc4_ != null)
               {
                  _loc4_.disposeActions(param1);
               }
            }
         }
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = var_83.getBodyPartsUnordered(param1);
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = getBodyPartCache(_loc4_);
            if(_loc5_ != null)
            {
               _loc5_.setDirection(param2);
            }
         }
      }
      
      public function resetBodyPartCache(param1:IActiveActionData) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(var_145 != null)
         {
            _loc2_ = var_145.getKeys();
            _loc3_ = getTimer();
            for each(_loc4_ in _loc2_)
            {
               _loc5_ = var_145.getValue(_loc4_) as AvatarImageBodyPartCache;
               if(_loc5_ != null)
               {
                  _loc5_.setAction(param1,_loc3_);
               }
            }
         }
      }
   }
}
