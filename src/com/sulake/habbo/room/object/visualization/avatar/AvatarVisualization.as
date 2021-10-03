package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_778:int = 2;
      
      private static const const_1088:Array = [0,0,0];
       
      
      private var var_726:int = 0;
      
      private var var_409:String;
      
      private var var_2328:int = 0;
      
      private const const_1468:int = 1;
      
      private var var_416:String = "";
      
      private var var_715:int = 0;
      
      private var var_1249:int = 0;
      
      private var var_1805:Boolean = false;
      
      private var var_407:Boolean;
      
      private const const_1087:int = 3;
      
      private var var_1061:int = 0;
      
      private var _effectType:int = 0;
      
      private var var_66:IAvatarImage = null;
      
      private var var_1521:String = "";
      
      private var var_1859:Boolean = false;
      
      private var var_502:Boolean = false;
      
      private var var_1860:Boolean = false;
      
      private var var_714:int = 0;
      
      private var _isDisposed:Boolean;
      
      private const const_1730:int = 3;
      
      private var var_1414:int = -1;
      
      private var var_1536:int = -1;
      
      private var var_1278:Boolean = false;
      
      private var var_2445:Array;
      
      private const const_1096:int = 0;
      
      private var var_1537:int = -1;
      
      private var var_1520:int = -1;
      
      private var var_1062:int = 0;
      
      private var var_1535:int = 0;
      
      private var var_599:String;
      
      private var var_865:Boolean = false;
      
      private var var_1279:Boolean = false;
      
      private var var_505:BitmapDataAsset;
      
      private const const_1471:int = 2;
      
      private var _visualizationData:AvatarVisualizationData = null;
      
      private var var_312:BitmapDataAsset;
      
      private var var_495:Map;
      
      public function AvatarVisualization()
      {
         var_2445 = new Array();
         super();
         var_495 = new Map();
         var_407 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         _visualizationData = param1 as AvatarVisualizationData;
         createSprites(const_1087);
         return true;
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            var_1279 = false;
         }
         if(var_416 == "sit" || var_416 == "lay")
         {
            var_1061 = param1 / 2;
         }
         else
         {
            var_1061 = 0;
         }
         var_1278 = false;
         var_865 = false;
         if(var_416 == "lay")
         {
            var_865 = true;
            _loc2_ = int(var_1521);
            if(_loc2_ < 0)
            {
               var_1278 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_171)
         {
            var_1860 = param1.getNumber(RoomObjectVariableEnum.const_201) > 0;
            var_1859 = param1.getNumber(RoomObjectVariableEnum.const_210) > 0;
            var_1805 = param1.getNumber(RoomObjectVariableEnum.const_398) > 0;
            var_1279 = param1.getNumber(RoomObjectVariableEnum.const_706) > 0;
            var_502 = param1.getNumber(RoomObjectVariableEnum.const_996) > 0;
            var_1249 = param1.getNumber(RoomObjectVariableEnum.const_292);
            var_416 = param1.getString(RoomObjectVariableEnum.const_394);
            var_1521 = param1.getString(RoomObjectVariableEnum.const_675);
            var_1535 = param1.getNumber(RoomObjectVariableEnum.const_934);
            _effectType = param1.getNumber(RoomObjectVariableEnum.const_502);
            var_1062 = param1.getNumber(RoomObjectVariableEnum.const_420);
            var_726 = param1.getNumber(RoomObjectVariableEnum.const_339);
            var_1520 = param1.getNumber(RoomObjectVariableEnum.const_351);
            if(var_1062 > 0 && param1.getNumber(RoomObjectVariableEnum.const_339) > 0)
            {
               var_726 = var_1062;
            }
            else
            {
               var_726 = 0;
            }
            validateActions(param2);
            var_599 = param1.getString(RoomObjectVariableEnum.const_924);
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_174);
            updateFigure(_loc3_);
            var_171 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_495)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_495.reset();
         var_66 = null;
         _loc2_ = getSprite(const_1096);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
         }
      }
      
      private function updateFigure(param1:String) : void
      {
         if(var_409 != param1)
         {
            var_409 = param1;
            resetImages();
         }
      }
      
      override public function dispose() : void
      {
         if(var_495 != null)
         {
            resetImages();
            var_495.dispose();
            var_495 = null;
         }
         _visualizationData = null;
         var_312 = null;
         var_505 = null;
         super.dispose();
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(const_1468);
         var_312 = null;
         if(var_416 == "mv" || var_416 == "std")
         {
            _loc2_.visible = true;
            if(var_312 == null || param1 != var_156)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  var_312 = var_66.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  var_312 = var_66.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(var_312 != null)
               {
                  _loc2_.asset = var_312.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            var_312 = null;
            _loc2_.visible = false;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_495.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = _visualizationData.getAvatar(var_409,param1,var_599,this);
            if(_loc3_ != null)
            {
               var_495.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         resetImages();
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var_505 = null;
         var _loc2_:IRoomObjectSprite = getSprite(const_1471);
         if(var_502)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               var_505 = _visualizationData.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               var_505 = _visualizationData.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(var_416 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(var_416 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(var_505 != null)
            {
               _loc2_.asset = var_505.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(_visualizationData == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc9_ || _loc5_ != var_156 || var_66 == null)
         {
            if(_loc5_ != var_156)
            {
               _loc7_ = true;
               validateActions(_loc5_);
            }
            if(_loc7_ || var_66 == null)
            {
               var_66 = getAvatarImage(_loc5_);
               _loc6_ = true;
            }
            if(var_66 == null)
            {
               return;
            }
            updateShadow(_loc5_);
            updateTypingBubble(_loc5_);
            _loc8_ = updateObject(_loc3_,param1,true);
            updateActions(var_66);
            var_156 = _loc5_;
         }
         else
         {
            _loc8_ = updateObject(_loc3_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = var_407 || var_714 > 0;
         if(_loc10_)
         {
            var_714 = const_778;
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --var_714;
            --var_715;
            if(!(var_715 <= 0 || _loc7_ || _loc9_ || _loc6_))
            {
               return;
            }
            var_66.updateAnimationByFrames(1);
            var_715 = const_778;
            _loc13_ = var_66.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1088;
            }
            _loc12_ = getSprite(const_1096);
            if(_loc12_ != null)
            {
               _loc16_ = var_66.getImage(AvatarSetType.const_31,false);
               if(_loc16_ != null)
               {
                  _loc12_.asset = _loc16_;
               }
               if(_loc12_.asset)
               {
                  _loc12_.offsetX = -1 * _loc5_ / 2 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + _loc5_ / 4 + _loc13_[1] + var_1061;
               }
               if(var_865)
               {
                  if(var_1278)
                  {
                     _loc12_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc12_.relativeDepth = -0.409 + _loc13_[2];
                  }
               }
               else
               {
                  _loc12_.relativeDepth = -0.01 + _loc13_[2];
               }
            }
            _loc12_ = getSprite(const_1471);
            if(_loc12_ != null && _loc12_.visible)
            {
               if(!var_865)
               {
                  _loc12_.relativeDepth = -0.02 + _loc13_[2];
               }
               else
               {
                  _loc12_.relativeDepth = -0.44 + _loc13_[2];
               }
            }
            var_407 = var_66.isAnimating();
            _loc14_ = const_1087;
            for each(_loc15_ in var_66.getSprites())
            {
               if(_loc15_.id == "avatar")
               {
                  _loc12_ = getSprite(const_1096);
                  _loc17_ = var_66.getLayerData(_loc15_);
                  _loc18_ = _loc15_.getDirectionOffsetX(var_66.getDirection());
                  _loc19_ = _loc15_.getDirectionOffsetY(var_66.getDirection());
                  if(_loc17_ != null)
                  {
                     _loc18_ += _loc17_.dx;
                     _loc19_ += _loc17_.dy;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc18_ /= 2;
                     _loc19_ /= 2;
                  }
                  _loc12_.offsetX += _loc18_;
                  _loc12_.offsetY += _loc19_;
               }
               else
               {
                  _loc12_ = getSprite(_loc14_);
                  if(_loc12_ != null)
                  {
                     _loc12_.visible = true;
                     _loc20_ = var_66.getLayerData(_loc15_);
                     _loc21_ = 0;
                     _loc22_ = _loc15_.getDirectionOffsetX(var_66.getDirection());
                     _loc23_ = _loc15_.getDirectionOffsetY(var_66.getDirection());
                     _loc24_ = _loc15_.getDirectionOffsetZ(var_66.getDirection());
                     _loc25_ = 0;
                     if(_loc15_.hasDirections)
                     {
                        _loc25_ = var_66.getDirection();
                     }
                     if(_loc20_ != null)
                     {
                        _loc21_ = _loc20_.animationFrame;
                        _loc22_ += _loc20_.dx;
                        _loc23_ += _loc20_.dy;
                        _loc25_ += _loc20_.directionOffset;
                     }
                     if(_loc5_ < 48)
                     {
                        _loc22_ /= 2;
                        _loc23_ /= 2;
                     }
                     if(_loc25_ < 0)
                     {
                        _loc25_ += 8;
                     }
                     else if(_loc25_ > 7)
                     {
                        _loc25_ -= 8;
                     }
                     _loc26_ = var_66.getScale() + "_" + _loc15_.member + "_" + _loc25_ + "_" + _loc21_;
                     _loc27_ = var_66.getAsset(_loc26_);
                     if(_loc27_ == null)
                     {
                        continue;
                     }
                     _loc12_.asset = _loc27_.content as BitmapData;
                     _loc12_.offsetX = -_loc27_.offset.x - _loc5_ / 2 + _loc22_;
                     _loc12_.offsetY = -_loc27_.offset.y + _loc23_ + var_1061;
                     if(var_865)
                     {
                        _loc12_.relativeDepth = -0.409 - 0.1 * spriteCount * _loc24_;
                     }
                     else
                     {
                        _loc12_.relativeDepth = -0.01 - 0.1 * spriteCount * _loc24_;
                     }
                     if(_loc15_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc14_++;
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_305 != param1.getUpdateID() || var_1414 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = var_1520;
            if(var_416 == "float")
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
            }
            _loc5_ = (_loc5_ % 360 + 360) % 360;
            if(_loc4_ != var_1537 || param3)
            {
               var_1537 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               var_66.setDirectionAngle(AvatarSetType.const_31,_loc4_);
            }
            if(_loc5_ != var_1536 || param3)
            {
               var_1536 = _loc5_;
               if(var_1536 != var_1537)
               {
                  _loc5_ -= 112.5;
                  _loc5_ = (_loc5_ + 360) % 360;
                  var_66.setDirectionAngle(AvatarSetType.const_41,_loc5_);
               }
            }
            var_305 = param1.getUpdateID();
            var_1414 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_409,var_416,var_1521);
         if(var_1249 > 0)
         {
            param1.appendAction(AvatarAction.const_295,AvatarAction.const_1349[var_1249]);
         }
         if(var_1535 > 0)
         {
            param1.appendAction(AvatarAction.const_923,var_1535);
         }
         if(var_2328 > 0)
         {
            param1.appendAction(AvatarAction.const_984,var_2328);
         }
         if(var_1062 > 0)
         {
            param1.appendAction(AvatarAction.const_1022,var_1062);
         }
         if(var_726 > 0)
         {
            param1.appendAction(AvatarAction.const_884,var_726);
         }
         if(var_1860)
         {
            param1.appendAction(AvatarAction.const_266);
         }
         if(var_1805 || var_1279)
         {
            param1.appendAction(AvatarAction.const_410);
         }
         if(var_1859)
         {
            param1.appendAction(AvatarAction.const_275);
         }
         if(_effectType > 0)
         {
            param1.appendAction(AvatarAction.const_381,_effectType);
         }
         param1.endActionAppends();
         var_407 = param1.isAnimating();
         var _loc2_:int = const_1087;
         for each(_loc3_ in var_66.getSprites())
         {
            if(_loc3_.id != "avatarImage")
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
   }
}
