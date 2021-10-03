package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.help.tutorial.NameSuggestionListRenderer;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   
   public class HotelMergeNameChangeView
   {
      
      private static var var_1528:uint = 13232628;
      
      private static var var_1826:uint = 11129827;
       
      
      private var var_1258:String;
      
      private var var_857:Boolean = false;
      
      private var var_602:IWindowContainer;
      
      private var var_856:NameSuggestionListRenderer;
      
      private var _window:IFrameWindow;
      
      private var var_281:IWindowContainer;
      
      private var var_355:String;
      
      private var var_1257:IWindowContainer;
      
      private var _controller:HotelMergeUI;
      
      private var var_35:IWindowContainer;
      
      public function HotelMergeNameChangeView(param1:HotelMergeUI)
      {
         super();
         _controller = param1;
      }
      
      public function setNameAvailableView() : void
      {
         if(_window == null)
         {
            return;
         }
         nameCheckWaitEnd(true);
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _controller.localization.registerParameter("help.tutorial.name.available","name",var_355);
         _loc1_.text = _controller.localization.getKey("help.tutorial.name.available");
         var _loc2_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = var_355;
         var _loc3_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = false;
      }
      
      private function showView(param1:IWindowContainer) : void
      {
         var_857 = false;
         if(var_35)
         {
            var_35.visible = false;
         }
         var_35 = param1;
         var_35.visible = true;
         if(_window)
         {
            _window.content.width = var_35.width;
            _window.content.height = var_35.height;
         }
      }
      
      private function getName() : String
      {
         var _loc1_:* = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
      
      private function nameOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1528;
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = _controller.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_)
         {
            return null;
         }
         return _controller.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function nameSelected(param1:WindowMouseEvent) : void
      {
         nameCheckWaitEnd(true);
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         setNormalView();
         var _loc4_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.text = _loc3_;
      }
      
      private function nameOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1826;
         }
      }
      
      private function showSelectionView() : void
      {
         if(!var_602)
         {
            var_602 = createWindow("hotel_merge_name_selection_xml") as IWindowContainer;
            if(!var_602)
            {
               return;
            }
            _window.content.addChild(var_602);
         }
         _window.caption = _controller.localization.getKey("hotel_merge.name_change.title.select");
         var _loc1_:IButtonWindow = _window.findChildByName("select_name_button") as IButtonWindow;
         if(_loc1_)
         {
            _loc1_.disable();
         }
         setNormalView();
         showView(var_602);
      }
      
      private function showConfirmationView() : void
      {
         if(!var_281)
         {
            var_281 = createWindow("hotel_merge_name_confirmation_xml") as IWindowContainer;
            if(!var_281)
            {
               return;
            }
            _window.content.addChild(var_281);
         }
         _window.caption = _controller.localization.getKey("hotel_merge.name_change.title.confirm");
         var _loc1_:ITextWindow = var_281.findChildByName("final_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = var_355;
         }
         showView(var_281);
      }
      
      public function get id() : String
      {
         return TutorialUI.const_245;
      }
      
      public function dispose() : void
      {
         disposeWindow();
         if(var_856 != null)
         {
            var_856.dispose();
            var_856 = null;
         }
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!var_857)
         {
            if(param1.type == WindowEvent.const_138)
            {
               if(param2.name == "input")
               {
                  _loc3_ = _window.findChildByName("select_name_button");
                  _loc4_ = param2 as ITextFieldWindow;
                  if(_loc3_ && _loc4_)
                  {
                     if(_loc4_.text.length > 2)
                     {
                        _loc3_.enable();
                     }
                     else
                     {
                        _loc3_.disable();
                     }
                  }
               }
            }
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "change_name_button":
               showSelectionView();
               break;
            case "keep_name_button":
               var_355 = _controller.myName;
               showConfirmationView();
               break;
            case "check_name_button":
               _controller.checkName(getName());
               nameCheckWaitBegin();
               break;
            case "select_name_button":
               _loc5_ = getName();
               if(_loc5_.length < 1)
               {
                  return;
               }
               if(var_355 != _loc5_)
               {
                  var_1258 = _loc5_;
                  _controller.checkName(_loc5_);
                  nameCheckWaitBegin();
               }
               else
               {
                  showConfirmationView();
               }
               break;
            case "cancel_selection_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "confirm_name_button":
               _controller.changeName(var_355);
               break;
            case "cancel_confirmation_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "header_button_close":
               disposeWindow();
         }
      }
      
      public function showMainView() : void
      {
         if(!_window)
         {
            _window = createWindow("hotel_merge_name_change_xml") as IFrameWindow;
            _window.center();
            _window.procedure = windowEventHandler;
            var_1257 = _window.content.getChildAt(0) as IWindowContainer;
         }
         _controller.localization.registerParameter("hotel_merge.name_change.current","name",_controller.myName);
         _window.caption = _controller.localization.getKey("hotel_merge.name_change.title.main");
         showView(var_1257);
      }
      
      public function setNameNotAvailableView(param1:int, param2:String, param3:Array) : void
      {
         var _loc8_:* = null;
         nameCheckWaitEnd(false);
         if(var_35 != var_602)
         {
            showSelectionView();
         }
         var_1258 = null;
         var_355 = null;
         if(_window == null)
         {
            return;
         }
         var _loc4_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         switch(param1)
         {
            case ChangeUserNameResultMessageEvent.var_1017:
               _controller.localization.registerParameter("help.tutorial.name.taken","name",param2);
               _loc4_.text = _controller.localization.getKey("help.tutorial.name.taken");
               break;
            case ChangeUserNameResultMessageEvent.var_1015:
               _controller.localization.registerParameter("help.tutorial.name.invalid","name",param2);
               _loc4_.text = _controller.localization.getKey("help.tutorial.name.invalid");
               break;
            case ChangeUserNameResultMessageEvent.var_1018:
               break;
            case ChangeUserNameResultMessageEvent.var_1020:
               _loc4_.text = _controller.localization.getKey("help.tutorial.name.long");
               break;
            case ChangeUserNameResultMessageEvent.var_1016:
               _loc4_.text = _controller.localization.getKey("help.tutorial.name.short");
               break;
            case ChangeUserNameResultMessageEvent.var_1197:
               _loc4_.text = _controller.localization.getKey("help.tutorial.name.change_not_allowed");
               break;
            case ChangeUserNameResultMessageEvent.var_1196:
               _loc4_.text = _controller.localization.getKey("help.tutorial.name.merge_hotel_down");
         }
         var _loc5_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == ChangeUserNameResultMessageEvent.var_1196 || param1 == ChangeUserNameResultMessageEvent.var_1197)
         {
            _loc5_.visible = false;
            return;
         }
         _loc5_.visible = true;
         var_856 = new NameSuggestionListRenderer(_controller);
         var _loc6_:int = var_856.render(param3,_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.numChildren)
         {
            _loc8_ = _loc5_.getChildAt(_loc7_);
            _loc8_.color = var_1528;
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,nameSelected);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,nameOver);
            _loc8_.addEventListener(WindowMouseEvent.const_27,nameOut);
            _loc7_++;
         }
      }
      
      public function nameCheckWaitEnd(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(_window && true)
         {
            if(param1)
            {
               _loc2_ = _window.findChildByName("select_name_button");
               if(_loc2_)
               {
                  _loc2_.enable();
               }
            }
            _loc2_ = _window.findChildByName("check_name_button");
            if(_loc2_)
            {
               _loc2_.enable();
            }
            _loc2_ = _window.findChildByName("input");
            if(_loc2_)
            {
               _loc2_.enable();
            }
         }
         var_857 = false;
      }
      
      public function set checkedName(param1:String) : void
      {
         var_355 = param1;
         if(var_1258 == var_355)
         {
            showConfirmationView();
            return;
         }
         setNameAvailableView();
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function setNormalView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = _controller.localization.getKey("help.tutorial.name.info");
         var _loc2_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = false;
      }
      
      private function disposeWindow() : void
      {
         var_1257 = null;
         var_602 = null;
         var_281 = null;
         var_35 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function nameCheckWaitBegin() : void
      {
         var _loc1_:* = null;
         if(_window && true)
         {
            _loc1_ = _window.findChildByName("select_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("check_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("input");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("info_text");
            if(_loc1_)
            {
               _loc1_.caption = _controller.localization.getKey("help.tutorial.name.wait_while_checking");
            }
         }
         var_857 = true;
      }
   }
}
