package com.sulake.habbo.avatar.geometry
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import flash.utils.Dictionary;
   
   public class AvatarModelGeometry
   {
       
      
      private var var_524:Matrix4x4;
      
      private var var_895:Vector3D;
      
      private var var_151:Dictionary;
      
      private var var_760:Dictionary;
      
      private var var_1580:AvatarSet;
      
      public function AvatarModelGeometry(param1:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var_895 = new Vector3D(0,0,10,0);
         super();
         var_524 = new Matrix4x4();
         var_760 = new Dictionary();
         var_1580 = new AvatarSet(param1.avatarset[0]);
         var_151 = new Dictionary();
         var _loc2_:XML = param1.camera[0];
         if(_loc2_ != null)
         {
            _loc10_ = parseFloat(_loc2_.x.text());
            _loc11_ = parseFloat(_loc2_.y.text());
            _loc12_ = parseFloat(_loc2_.z.text());
            var_895.x = _loc10_;
            var_895.y = _loc11_;
            var_895.z = _loc12_;
         }
         for each(_loc3_ in param1.canvas)
         {
            _loc13_ = String(_loc3_.@scale);
            _loc14_ = new Dictionary();
            for each(_loc4_ in _loc3_.geometry)
            {
               _loc5_ = new AvatarCanvas(_loc4_);
               _loc14_[String(_loc4_.@id)] = _loc5_;
            }
            var_151[_loc13_] = _loc14_;
         }
         for each(_loc6_ in param1.type)
         {
            _loc7_ = new Dictionary();
            for each(_loc8_ in _loc6_.bodypart)
            {
               _loc9_ = new GeometryBodyPart(_loc8_);
               _loc7_[String(_loc8_.@id)] = _loc9_;
            }
            var_760[String(_loc6_.@id)] = _loc7_;
         }
      }
      
      public function getParts(param1:String, param2:String, param3:uint, param4:Array) : Array
      {
         var _loc5_:* = null;
         if(hasBodyPart(param1,param2))
         {
            _loc5_ = getBodyPartsOfType(param1)[param2] as GeometryBodyPart;
            var_524 = var_524.identity().rotateY(param3);
            return _loc5_.getParts(var_524,var_895,param4);
         }
         return [];
      }
      
      public function isMainAvatarSet(param1:String) : Boolean
      {
         var _loc2_:AvatarSet = var_1580.findAvatarSet(param1);
         if(_loc2_ != null)
         {
            return _loc2_.isMain;
         }
         return false;
      }
      
      private function hasBodyPart(param1:String, param2:String) : Boolean
      {
         var _loc3_:* = null;
         if(typeExists(param1))
         {
            _loc3_ = var_760[param1] as Dictionary;
            return _loc3_[param2] != null;
         }
         return false;
      }
      
      public function method_3(param1:String, param2:String) : GeometryBodyPart
      {
         var _loc3_:Dictionary = getBodyPartsOfType(param1);
         return _loc3_[param2];
      }
      
      public function removeDynamicItems() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_760)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.removeDynamicParts();
            }
         }
      }
      
      private function getBodyPartIDs(param1:String) : Array
      {
         var _loc4_:* = null;
         var _loc2_:Dictionary = getBodyPartsOfType(param1);
         var _loc3_:Array = new Array();
         for(_loc4_ in var_760)
         {
            _loc3_.push(_loc4_);
         }
         return _loc3_;
      }
      
      public function getCanvas(param1:String, param2:String) : AvatarCanvas
      {
         var _loc4_:* = null;
         var _loc3_:Dictionary = var_151[param1];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_[param2] as AvatarCanvas;
         }
         return _loc4_;
      }
      
      public function getBodyPartOfItem(param1:String, param2:String) : GeometryBodyPart
      {
         var _loc4_:* = null;
         var _loc3_:Dictionary = getBodyPartsOfType(param1);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.hasPart(param2))
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      private function typeExists(param1:String) : Boolean
      {
         return false;
      }
      
      public function getBodyPartsAtAngle(param1:String, param2:uint, param3:IActionDefinition) : Array
      {
         var _loc8_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         var _loc4_:String = param3.geometryType;
         if(_loc4_ == null)
         {
            Logger.log("[AvatarModelGeometry] ERROR: Geometry ID not found for action: " + param3);
            return [];
         }
         var _loc5_:Dictionary = getBodyPartsOfType(_loc4_);
         var _loc6_:Dictionary = getBodyPartsInAvatarSet(_loc5_,param1);
         var _loc7_:Array = new Array();
         var _loc9_:Array = new Array();
         var_524 = var_524.identity().rotateY(param2);
         for each(_loc8_ in _loc6_)
         {
            _loc8_.applyTransform(var_524);
            _loc10_ = _loc8_.getDistance(var_895);
            _loc7_.push([_loc10_,_loc8_]);
         }
         _loc7_.sort(orderByDistance);
         for each(_loc11_ in _loc7_)
         {
            _loc8_ = _loc11_[1] as GeometryBodyPart;
            _loc9_.push(_loc8_.id);
         }
         return _loc9_;
      }
      
      private function getBodyPartsOfType(param1:String) : Dictionary
      {
         if(typeExists(param1))
         {
            return var_760[param1] as Dictionary;
         }
         return new Dictionary();
      }
      
      private function orderByDistance(param1:Array, param2:Array) : Number
      {
         var _loc3_:Number = param1[0] as Number;
         var _loc4_:Number = param2[0] as Number;
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      private function getBodyPartsInAvatarSet(param1:Dictionary, param2:String) : Dictionary
      {
         var _loc5_:* = null;
         var _loc3_:Dictionary = new Dictionary();
         var _loc4_:Array = this.getBodyPartIdsInAvatarSet(param2);
         for each(_loc5_ in param1)
         {
            if(_loc4_.indexOf(_loc5_.id) > -1)
            {
               _loc3_[_loc5_.id] = _loc5_;
            }
         }
         return _loc3_;
      }
      
      public function getBodyPartIdsInAvatarSet(param1:String) : Array
      {
         var _loc2_:* = [];
         var _loc3_:AvatarSet = var_1580.findAvatarSet(param1);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.getBodyParts();
         }
         return _loc2_;
      }
   }
}
