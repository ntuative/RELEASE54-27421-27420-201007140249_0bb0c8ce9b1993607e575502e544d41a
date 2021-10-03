package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   
   public class Outfit implements IOutfit, IAvatarImageListener
   {
       
      
      private var var_599:String;
      
      private var var_409:String;
      
      private var _view:OutfitView;
      
      private var _isDisposed:Boolean;
      
      private var _controller:HabboAvatarEditor;
      
      public function Outfit(param1:HabboAvatarEditor, param2:String, param3:String)
      {
         super();
         _controller = param1;
         _view = new OutfitView(param1.windowManager,param1.assets,param2 != "");
         switch(param3)
         {
            case FigureData.const_66:
            case "m":
            case "M":
               param3 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param3 = "null";
         }
         var_409 = param2;
         var_599 = param3;
         update();
      }
      
      public function get gender() : String
      {
         return var_599;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function update() : void
      {
         var _loc2_:* = null;
         var _loc1_:IAvatarImage = _controller.avatarRenderManager.createAvatarImage(figure,AvatarScaleType.SMALL,var_599,this);
         if(_loc1_)
         {
            _loc1_.setDirection(AvatarSetType.const_31,int(FigureData.const_670));
            _loc2_ = _loc1_.getImage(AvatarSetType.const_31,true);
            if(_view)
            {
               _view.udpate(_loc2_);
            }
            _loc1_.dispose();
         }
      }
      
      public function get figure() : String
      {
         return var_409;
      }
      
      public function get view() : OutfitView
      {
         return _view;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         update();
      }
      
      public function dispose() : void
      {
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
         var_409 = null;
         var_599 = null;
         _isDisposed = true;
      }
   }
}
