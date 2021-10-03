package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   
   public class TutorialMainView implements ITutorialUIView
   {
       
      
      private var _main:TutorialUI;
      
      public function TutorialMainView(param1:IItemListWindow, param2:TutorialUI)
      {
         var _loc6_:* = null;
         super();
         _main = param2;
         var _loc3_:IWindowContainer = param2.buildXmlWindow("tutorial_front_page") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.procedure = windowProcedure;
         var _loc4_:IItemListWindow = _loc3_.findChildByName("button_list") as IItemListWindow;
         var _loc5_:int = 0;
         _loc6_ = _loc3_.findChildByName("container_name");
         if(false)
         {
            _loc4_.removeListItem(_loc6_);
         }
         else
         {
            setButtonStateNormal(_loc3_.findChildByName("button_name"));
            _loc5_ += _loc6_.width;
         }
         _loc6_ = _loc3_.findChildByName("container_looks");
         if(false)
         {
            _loc4_.removeListItem(_loc6_);
         }
         else
         {
            setButtonStateNormal(_loc3_.findChildByName("button_looks"));
            _loc5_ += _loc6_.width;
         }
         _loc6_ = _loc3_.findChildByName("container_guidebot");
         if(true)
         {
            _loc4_.removeListItem(_loc6_);
         }
         else
         {
            setButtonStateNormal(_loc3_.findChildByName("button_guidebot"));
            _loc5_ += _loc6_.width;
         }
         _loc4_.width = _loc5_;
         param1.addListItem(_loc3_ as IWindow);
      }
      
      private function setButtonStateOver(param1:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:IBitmapWrapperWindow = param1 as IBitmapWrapperWindow;
         switch(param1.name)
         {
            case "button_name":
               _loc3_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_button_changename_over"));
               break;
            case "button_looks":
               _loc3_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_button_changelooks_over"));
               break;
            case "button_guidebot":
               _loc3_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_button_guidebot_over"));
         }
         if(_loc2_ != null && _loc3_ != null && _loc3_.content != null)
         {
            _loc2_.bitmap = (_loc3_.content as BitmapData).clone();
         }
      }
      
      public function get id() : String
      {
         return TutorialUI.const_88;
      }
      
      private function setButtonStateNormal(param1:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:IBitmapWrapperWindow = param1 as IBitmapWrapperWindow;
         switch(param1.name)
         {
            case "button_name":
               _loc3_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_button_changename"));
               break;
            case "button_looks":
               _loc3_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_button_changelooks"));
               break;
            case "button_guidebot":
               _loc3_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_button_guidebot"));
         }
         if(_loc2_ != null && _loc3_ != null && _loc3_.content != null)
         {
            _loc2_.bitmap = (_loc3_.content as BitmapData).clone();
         }
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param2.name)
         {
            case "button_looks":
               switch(param1.type)
               {
                  case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
                     _main.showView(TutorialUI.const_320);
                     break;
                  case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
                     setButtonStateOver(param2);
                     break;
                  case WindowMouseEvent.const_27:
                     setButtonStateNormal(param2);
               }
               break;
            case "button_name":
               switch(param1.type)
               {
                  case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
                     _main.showView(TutorialUI.const_245);
                     break;
                  case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
                     setButtonStateOver(param2);
                     break;
                  case WindowMouseEvent.const_27:
                     setButtonStateNormal(param2);
               }
               break;
            case "button_guidebot":
               switch(param1.type)
               {
                  case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
                     _main.showView(TutorialUI.const_504);
                     break;
                  case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
                     setButtonStateOver(param2);
                     break;
                  case WindowMouseEvent.const_27:
                     setButtonStateNormal(param2);
               }
         }
      }
      
      public function get view() : IWindowContainer
      {
         return null;
      }
      
      public function dispose() : void
      {
      }
   }
}
