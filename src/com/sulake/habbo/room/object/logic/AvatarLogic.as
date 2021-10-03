package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_827:int = 500;
      
      private static const const_826:Number = 1.5;
      
      private static const const_829:int = 28;
      
      private static const const_828:int = 29;
       
      
      private var var_685:int = 0;
      
      private var var_1102:int = 0;
      
      private var var_746:int = 0;
      
      private var var_1475:int = 0;
      
      private var var_583:int = 0;
      
      private var var_584:int = 0;
      
      private var var_1186:int = 0;
      
      private var var_1185:int = 0;
      
      private var var_363:Vector3d = null;
      
      private var var_1101:int = 0;
      
      private var var_1006:int = 0;
      
      private var var_1474:int = 0;
      
      private var _selected:Boolean = false;
      
      public function AvatarLogic()
      {
         super();
         var_1474 = getTimer() + getBlinkInterval();
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(var_1101 > 0)
         {
            if(param1 > var_1101)
            {
               param2.setNumber(RoomObjectVariableEnum.const_201,0);
               var_1101 = 0;
               var_583 = 0;
               var_685 = 0;
            }
            else if(var_685 == 0 && var_583 == 0)
            {
               var_583 = param1 + getTalkingPauseInterval();
               var_685 = var_583 + getTalkingPauseLength();
            }
            else if(var_583 > 0 && param1 > var_583)
            {
               param2.setNumber(RoomObjectVariableEnum.const_201,0);
               var_583 = 0;
            }
            else if(var_685 > 0 && param1 > var_685)
            {
               param2.setNumber(RoomObjectVariableEnum.const_201,1);
               var_685 = 0;
            }
         }
         if(var_746 > 0 && param1 > var_746)
         {
            param2.setNumber(RoomObjectVariableEnum.const_210,0);
            var_746 = 0;
         }
         if(var_1102 > 0 && param1 > var_1102)
         {
            param2.setNumber(RoomObjectVariableEnum.const_292,0);
            var_1102 = 0;
         }
         if(var_1186 > 0 && param1 > var_1186)
         {
            param2.setNumber(RoomObjectVariableEnum.const_1033,0);
            var_1186 = 0;
         }
         if(var_1006 > 0)
         {
            if(param1 > var_1006)
            {
               param2.setNumber(RoomObjectVariableEnum.const_420,0);
               var_1006 = 0;
            }
            else if((var_1006 - param1) % 10000 < 1000)
            {
               param2.setNumber(RoomObjectVariableEnum.const_339,1);
            }
            else
            {
               param2.setNumber(RoomObjectVariableEnum.const_339,0);
            }
         }
         if(param1 > var_1474)
         {
            param2.setNumber(RoomObjectVariableEnum.const_706,1);
            var_1474 = param1 + getBlinkInterval();
            var_1185 = param1 + getBlinkLength();
         }
         if(var_1185 > 0 && param1 > var_1185)
         {
            param2.setNumber(RoomObjectVariableEnum.const_706,0);
            var_1185 = 0;
         }
         if(var_584 > 0 && param1 > var_584)
         {
            param2.setNumber(RoomObjectVariableEnum.const_502,var_1475);
            var_584 = 0;
         }
      }
      
      private function updateEffect(param1:int, param2:IRoomObjectModelController) : void
      {
         if(param1 == const_829)
         {
            var_584 = getTimer() + const_827;
            var_1475 = const_828;
         }
         else if(param2.getNumber(RoomObjectVariableEnum.const_502) == const_828)
         {
            var_584 = getTimer() + const_827;
            var_1475 = param1;
            param1 = const_829;
         }
         else
         {
            var_584 = 0;
         }
         param2.setNumber(RoomObjectVariableEnum.const_502,param1);
      }
      
      private function getBlinkInterval() : int
      {
         return 4500 + Math.random() * 1000;
      }
      
      private function getBlinkLength() : int
      {
         return 50 + Math.random() * 200;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectMoveUpdateMessage;
            if(_loc3_ != null && targetIsWarping(_loc3_.realTargetLoc))
            {
               Logger.log("Target warp warning!");
               _loc4_ = new AvatarWalkWarpingWarningEvent();
               eventDispatcher.dispatchEvent(_loc4_);
            }
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_394,_loc5_.postureType);
            _loc2_.setString(RoomObjectVariableEnum.const_675,_loc5_.parameter);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_201,1);
            var_1101 = getTimer() + _loc6_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarTypingUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarTypingUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_996,Number(_loc7_.isTyping));
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_351,_loc8_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarGestureUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarGestureUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_292,_loc9_.gesture);
            var_1102 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc10_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_210,1);
               var_746 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_210,0);
               var_746 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarDanceUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarDanceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_934,_loc11_.danceStyle);
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc12_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_398,Number(_loc12_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarEffectUpdateMessage)
         {
            _loc13_ = param1 as RoomObjectAvatarEffectUpdateMessage;
            _loc14_ = _loc13_.effect;
            updateEffect(_loc14_,_loc2_);
            return;
         }
         if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
         {
            _loc15_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_420,_loc15_.itemType);
            var_1006 = getTimer() + 100000;
            return;
         }
         if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
         {
            _loc16_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_339,_loc16_.itemType);
            return;
         }
         if(param1 is RoomObjectAvatarSignUpdateMessage)
         {
            _loc17_ = param1 as RoomObjectAvatarSignUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1033,_loc17_.signType);
            var_1186 = getTimer() + 5000;
            return;
         }
         if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
         {
            _loc18_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_581,_loc18_.rawData);
            _loc2_.setNumber(RoomObjectVariableEnum.const_1387,Number(_loc18_.isAdmin));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc19_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc20_ = _loc2_.getString(RoomObjectVariableEnum.const_174);
            _loc21_ = _loc19_.figure;
            _loc22_ = _loc19_.gender;
            if(_loc20_ != null && _loc20_.indexOf(".bds-") != -1)
            {
               _loc21_ += _loc20_.substr(_loc20_.indexOf(".bds-"));
            }
            _loc2_.setString(RoomObjectVariableEnum.const_174,_loc21_);
            _loc2_.setString(RoomObjectVariableEnum.const_924,_loc22_);
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc23_ = param1 as RoomObjectAvatarSelectedMessage;
            _selected = _loc23_.selected;
            var_363 = null;
            return;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(var_363 == null || var_363.x != _loc2_.x || var_363.y != _loc2_.y || var_363.z != _loc2_.z)
               {
                  if(var_363 == null)
                  {
                     var_363 = new Vector3d();
                  }
                  var_363.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_411,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            updateActions(param1,object.getModelController());
         }
      }
      
      private function getTalkingPauseInterval() : int
      {
         return 100 + Math.random() * 200;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_380,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         var_363 = null;
      }
      
      private function getTalkingPauseLength() : int
      {
         return 75 + Math.random() * 75;
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc5_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_229,_loc3_,_loc4_);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
         }
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_826 || Math.abs(_loc2_.y - param1.y) > const_826)
         {
            return true;
         }
         return false;
      }
   }
}
