package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.Palette;
   import com.sulake.habbo.avatar.structure.figure.SetType;
   import flash.utils.Dictionary;
   
   public class FigureData implements IStructureData, IFigureData
   {
       
      
      private var var_491:Dictionary;
      
      private var _palettes:Dictionary;
      
      public function FigureData()
      {
         super();
         _palettes = new Dictionary();
         var_491 = new Dictionary();
      }
      
      public function dispose() : void
      {
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            _palettes[String(_loc2_.@id)] = new Palette(_loc2_);
         }
         for each(_loc3_ in param1.sets.settype)
         {
            var_491[String(_loc3_.@type)] = new SetType(_loc3_);
         }
         return true;
      }
      
      public function getPalette(param1:int) : IPalette
      {
         return _palettes[String(param1)];
      }
      
      public function injectXML(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1.sets.settype)
         {
            _loc3_ = var_491[String(_loc2_.@type)];
            if(_loc3_ != null)
            {
               _loc3_.cleanUp(_loc2_);
            }
            else
            {
               var_491[String(_loc2_.@type)] = new SetType(_loc2_);
            }
         }
         appendXML(param1);
      }
      
      public function getDefaultPartSet(param1:String, param2:String) : IFigurePartSet
      {
         var _loc3_:SetType = var_491[param1] as SetType;
         if(_loc3_)
         {
            return _loc3_.getDefaultPartSet(param2);
         }
         return null;
      }
      
      public function getSetType(param1:String) : ISetType
      {
         return var_491[param1];
      }
      
      public function appendXML(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            _loc4_ = _palettes[String(_loc2_.@id)];
            if(_loc4_ == null)
            {
               _palettes[String(_loc2_.@id)] = new Palette(_loc2_);
            }
            else
            {
               _loc4_.append(_loc2_);
            }
         }
         for each(_loc3_ in param1.sets.settype)
         {
            _loc5_ = var_491[String(_loc3_.@type)];
            if(_loc5_ == null)
            {
               var_491[String(_loc3_.@type)] = new SetType(_loc3_);
            }
            else
            {
               _loc5_.append(_loc3_);
            }
         }
         return false;
      }
      
      public function getMandatorySetTypeIds(param1:String, param2:int) : Array
      {
         var _loc4_:* = null;
         var _loc3_:Array = new Array();
         for each(_loc4_ in var_491)
         {
            if(_loc4_ && _loc4_.isMandatory(param1,param2))
            {
               _loc3_.push(_loc4_.type);
            }
         }
         return _loc3_;
      }
   }
}
