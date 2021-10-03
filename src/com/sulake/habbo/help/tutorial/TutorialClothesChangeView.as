package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import flash.display.BitmapData;
   
   public class TutorialClothesChangeView implements ITutorialUIView
   {
       
      
      private var _main:TutorialUI;
      
      private var var_634:IWindowContainer;
      
      public function TutorialClothesChangeView(param1:IItemListWindow, param2:TutorialUI)
      {
         super();
         _main = param2;
         var _loc3_:IWindowContainer = param2.buildXmlWindow("tutorial_change_clothes") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.procedure = windowProcedure;
         param1.addListItem(_loc3_ as IWindow);
         setToolbarIconHighlight(true);
         _main.help.toolbar.events.addEventListener(HabboToolbarShowMenuEvent.const_46,onShowMenuEvent);
         _main.prepareForTutorial();
      }
      
      public function get id() : String
      {
         return TutorialUI.const_320;
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param2.name)
         {
            case "button_cancel":
               if(param1.type == WindowMouseEvent.const_47)
               {
                  _main.showView(TutorialUI.const_88);
               }
         }
      }
      
      private function showToolbarIconHighlightArrow() : void
      {
         var _loc2_:* = null;
         if(var_634 != null)
         {
            return;
         }
         var_634 = _main.buildXmlWindow("tutorial_arrow") as IWindowContainer;
         var _loc1_:IBitmapWrapperWindow = var_634.findChildByName("arrow") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc2_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_highlight_blue_arrow"));
            _loc1_.bitmap = (_loc2_.content as BitmapData).clone();
         }
         _main.help.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.MEMENU_ARROW,var_634));
      }
      
      public function get view() : IWindowContainer
      {
         return null;
      }
      
      private function onShowMenuEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(param1.menuId == HabboToolbarIconEnum.MEMENU && param1.type == HabboToolbarShowMenuEvent.const_46)
         {
            setToolbarIconHighlight(false);
            hideToolbarIconHighlightArrow();
            _main.help.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_384));
         }
      }
      
      private function hideToolbarIconHighlightArrow() : void
      {
         if(var_634 != null)
         {
            var_634.dispose();
            var_634 = null;
         }
      }
      
      public function setToolbarIconHighlight(param1:Boolean) : void
      {
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_165,HabboToolbarIconEnum.MEMENU);
         if(param1)
         {
            _loc2_.iconState = "highlight_blue";
            showToolbarIconHighlightArrow();
         }
         else
         {
            _loc2_.iconState = "0";
            hideToolbarIconHighlightArrow();
         }
         _main.help.toolbar.events.dispatchEvent(_loc2_);
      }
      
      public function dispose() : void
      {
         setToolbarIconHighlight(false);
         _main.help.toolbar.events.removeEventListener(HabboToolbarShowMenuEvent.const_46,onShowMenuEvent);
      }
   }
}
