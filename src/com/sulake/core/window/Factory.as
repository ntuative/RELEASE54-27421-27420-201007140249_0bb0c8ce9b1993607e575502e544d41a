package com.sulake.core.window
{
   import com.sulake.core.window.components.ActivatorController;
   import com.sulake.core.window.components.BackgroundController;
   import com.sulake.core.window.components.BitmapWrapperController;
   import com.sulake.core.window.components.BorderController;
   import com.sulake.core.window.components.ButtonController;
   import com.sulake.core.window.components.CanvasController;
   import com.sulake.core.window.components.CheckBoxController;
   import com.sulake.core.window.components.ContainerButtonController;
   import com.sulake.core.window.components.ContainerController;
   import com.sulake.core.window.components.DisplayObjectWrapperController;
   import com.sulake.core.window.components.DropMenuController;
   import com.sulake.core.window.components.DropMenuItemController;
   import com.sulake.core.window.components.FrameController;
   import com.sulake.core.window.components.HeaderController;
   import com.sulake.core.window.components.IconController;
   import com.sulake.core.window.components.InteractiveController;
   import com.sulake.core.window.components.ItemGridController;
   import com.sulake.core.window.components.ItemListController;
   import com.sulake.core.window.components.PasswordFieldController;
   import com.sulake.core.window.components.RadioButtonController;
   import com.sulake.core.window.components.RegionController;
   import com.sulake.core.window.components.ScalerController;
   import com.sulake.core.window.components.ScrollableItemListWindow;
   import com.sulake.core.window.components.ScrollbarController;
   import com.sulake.core.window.components.ScrollbarLiftController;
   import com.sulake.core.window.components.SelectableButtonController;
   import com.sulake.core.window.components.SelectorController;
   import com.sulake.core.window.components.TabButtonController;
   import com.sulake.core.window.components.TabContainerButtonController;
   import com.sulake.core.window.components.TabContextController;
   import com.sulake.core.window.components.TabSelectorController;
   import com.sulake.core.window.components.TextController;
   import com.sulake.core.window.components.TextFieldController;
   import com.sulake.core.window.components.ToolTipController;
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class Factory
   {
       
      
      protected var var_16:Dictionary;
      
      public function Factory()
      {
         super();
         var_16 = new Dictionary();
         var_16["null"] = WindowController;
         var_16["null"] = ActivatorController;
         var_16["null"] = BackgroundController;
         var_16["null"] = BorderController;
         var_16["null"] = ButtonController;
         var_16["null"] = ButtonController;
         var_16["null"] = SelectableButtonController;
         var_16["null"] = SelectableButtonController;
         var_16["null"] = SelectableButtonController;
         var_16["null"] = BitmapWrapperController;
         var_16["null"] = CanvasController;
         var_16["null"] = CheckBoxController;
         var_16["null"] = ContainerController;
         var_16["null"] = ContainerButtonController;
         var_16["null"] = InteractiveController;
         var_16["null"] = DisplayObjectWrapperController;
         var_16["null"] = ScrollbarLiftController;
         var_16["null"] = DropMenuController;
         var_16["null"] = DropMenuItemController;
         var_16["null"] = FrameController;
         var_16["null"] = HeaderController;
         var_16["null"] = IconController;
         var_16["null"] = ItemListController;
         var_16["null"] = ItemListController;
         var_16["null"] = ItemListController;
         var_16["null"] = ItemGridController;
         var_16["null"] = ItemGridController;
         var_16["null"] = ItemGridController;
         var_16["null"] = PasswordFieldController;
         var_16["null"] = RadioButtonController;
         var_16["null"] = RegionController;
         var_16["null"] = ScalerController;
         var_16["null"] = ScrollbarController;
         var_16["null"] = ScrollbarController;
         var_16["null"] = ButtonController;
         var_16["null"] = ButtonController;
         var_16["null"] = ButtonController;
         var_16["null"] = ButtonController;
         var_16["null"] = ScrollbarLiftController;
         var_16["null"] = ScrollbarLiftController;
         var_16["null"] = WindowController;
         var_16["null"] = WindowController;
         var_16["null"] = ScrollableItemListWindow;
         var_16["null"] = SelectorController;
         var_16["null"] = TabSelectorController;
         var_16["null"] = TabButtonController;
         var_16["null"] = TabContainerButtonController;
         var_16["null"] = ContainerController;
         var_16["null"] = TabContextController;
         var_16["null"] = TabSelectorController;
         var_16["null"] = TextController;
         var_16["null"] = TextFieldController;
         var_16["null"] = ToolTipController;
      }
      
      public function getWindowClassByType(param1:uint) : Class
      {
         return var_16[param1];
      }
   }
}
