package com.sulake.habbo.avatar.generic
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class BodyView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      private const const_522:String = "tab_girl";
      
      private const const_521:String = "tab_boy";
      
      public function BodyView(param1:IAvatarEditorCategoryModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3,param1);
         var_157 = FigureData.FACE;
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_521:
                  _model.controller.gender = FigureData.const_66;
                  param1.stopPropagation();
                  break;
               case const_522:
                  _model.controller.gender = FigureData.FEMALE;
                  param1.stopPropagation();
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case const_521:
               case const_522:
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_27)
         {
            switch(param2.name)
            {
               case const_521:
               case const_522:
                  updateGenderTab();
            }
         }
      }
      
      override public function getWindowContainer() : IWindowContainer
      {
         if(!var_172)
         {
            init();
         }
         updateGenderTab();
         return _window;
      }
      
      public function updateGenderTab() : void
      {
         if(_model == null)
         {
            return;
         }
         switch(_model.controller.gender)
         {
            case FigureData.const_66:
               activateTab(const_521);
               inactivateTab(const_522);
               break;
            case FigureData.FEMALE:
               activateTab(const_522);
               inactivateTab(const_521);
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         updateGenderTab();
      }
      
      override public function reset() : void
      {
         super.reset();
         var_157 = FigureData.FACE;
      }
      
      override public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _loc1_ = _assetLibrary.getAssetByName("avatareditor_generic_base") as XmlAsset;
            if(_loc1_)
            {
               _window = IWindowContainer(_windowManager.buildFromXML(_loc1_.content as XML));
               _window.visible = false;
               _window.procedure = windowEventProc;
            }
         }
         if(!var_36)
         {
            var_36 = new Dictionary();
            var_36["null"] = new AvatarEditorGridView(_model,FigureData.FACE,_windowManager,_assetLibrary);
         }
         else
         {
            for each(_loc2_ in var_36)
            {
               _loc2_.initFromList();
            }
         }
         var_172 = true;
         updateGridView();
         attachImages();
         updateGenderTab();
      }
   }
}
