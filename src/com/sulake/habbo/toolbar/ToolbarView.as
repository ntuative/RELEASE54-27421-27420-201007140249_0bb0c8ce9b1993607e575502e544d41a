package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ToolbarView
   {
       
      
      private var var_1075:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_506:String = "LEFT";
      
      private var var_206:IWindowContainer;
      
      private var var_611:Array;
      
      private var var_1556:Number = 15;
      
      private var _events:IEventDispatcher;
      
      private var var_273:ToolbarBarMenuAnimator;
      
      private var var_1557:Number = 5;
      
      private var var_272:Array;
      
      private var var_130:Number = 50;
      
      private var var_1299:Number = 0;
      
      private var var_2454:Array;
      
      private var _toolbarMarginTop:Number = 1;
      
      private var var_1076:Boolean = true;
      
      public function ToolbarView(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IEventDispatcher)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc10_:* = null;
         var_2454 = new Array();
         var_272 = new Array();
         var_611 = new Array();
         super();
         _events = param3;
         _loc4_ = param2.getAssetByName("toolbar_window_xml");
         _loc5_ = XmlAsset(_loc4_);
         if(_loc5_ == null)
         {
            return;
         }
         _window = param1.buildFromXML(_loc5_.content as XML,2) as IWindowContainer;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var _loc6_:IBitmapWrapperWindow = _window.findChildByName("bg") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc10_ = param2.getAssetByName("toolbar_bg") as BitmapDataAsset;
            _loc6_.bitmap = _loc10_.content as BitmapData;
         }
         _window.tags.push("habbo_toolbar");
         var_130 = _window.width;
         var_206 = param1.createWindow("extrabar_container_window","",HabboWindowType.const_52,HabboWindowStyle.const_1042,0 | 0,new Rectangle(0,0,1,1),null,0,0) as IWindowContainer;
         _window.tags.push("habbo_extrabar");
         _loc4_ = param2.getAssetByName("toolbar_xml");
         _loc5_ = XmlAsset(_loc4_);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc7_:XML = XML(_loc5_.content);
         var_1076 = String(_loc7_.relocate_by_drag.@state) == "KickUserMessageComposer";
         if(var_1076)
         {
            _window.addEventListener(WindowMouseEvent.const_47,onToolbarMouseDown);
            _window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
            _window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
         }
         _window.context.getDesktopWindow().addEventListener(WindowEvent.const_43,onRoomViewResized);
         _toolbarMarginTop = _loc7_.toolbar.@margin_top;
         var_1299 = _loc7_.toolbar.@margin_bottom;
         var_1556 = _loc7_.toolbar.@min_group_margin;
         var_1557 = _loc7_.toolbar.@margin_to_extrabar;
         var_273 = new ToolbarBarMenuAnimator(param1,this);
         var _loc8_:XMLList = XMLList(_loc7_.toolbar).children();
         var _loc9_:XMLList = XMLList(_loc7_.extras).children();
         createGroupsFromXmlList(_loc8_,var_272,param1,param2,_window,var_273);
         createGroupsFromXmlList(_loc9_,var_611,param1,param2,var_206,var_273);
         alignWindows();
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         alignWindows();
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:ToolbarIconGroup = getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setContent(param1,param2);
            alignWindows();
         }
      }
      
      public function removeIcon(param1:String) : void
      {
         var _loc2_:ToolbarIconGroup = getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            _loc2_.removeContent(param1);
            alignWindows();
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_272.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         while(false)
         {
            _loc1_ = var_611.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_206 != null)
         {
            var_206.dispose();
            var_206 = null;
         }
      }
      
      public function getIconByMenuId(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconByMenuId(param1);
         }
         return null;
      }
      
      private function onToolbarMouseDown(param1:WindowEvent) : void
      {
         if(var_1076)
         {
            var_1075 = true;
         }
      }
      
      public function get barSize() : Number
      {
         return var_130;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Point = null) : void
      {
         var _loc4_:ToolbarIcon = getIconByMenuId(param1);
         if(_loc4_ != null)
         {
            _loc4_.animateWindowIn(param1,param2,var_130,var_506,param3);
         }
      }
      
      private function alignWindows() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = NaN;
         if(_window == null || var_206 == null)
         {
            return;
         }
         var _loc1_:IDesktopWindow = _window.context.getDesktopWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _window.visible = true;
         switch(orientation)
         {
            case "LEFT":
               _window.width = var_130;
               _window.height = _loc1_.height;
               _window.x = 0;
               _window.y = 0;
               var_206.x = var_130 + var_1557;
               var_206.y = 0;
               _loc4_ = 0;
               break;
            case "RIGHT":
               _window.width = var_130;
               _window.height = _loc1_.height;
               _window.x = _loc1_.width - var_130;
               _window.y = 0;
               var_206.x = 0;
               var_206.y = 0;
               _loc4_ = 0;
               break;
            case "TOP":
               _window.width = _loc1_.width;
               _window.height = var_130;
               _window.x = 0;
               _window.y = 0;
               var_206.x = 0;
               var_206.y = var_130 + var_1557;
               _loc4_ = 0;
               break;
            case "BOTTOM":
               _window.width = _loc1_.width;
               _window.height = var_130;
               _window.x = 0;
               _window.y = _loc1_.height - var_130;
               var_206.x = 0;
               var_206.y = 0;
               _loc4_ = 0;
         }
         _loc4_ -= var_1299;
         _loc4_ -= _toolbarMarginTop;
         var _loc5_:IWindow = _window.findChildByName("bg");
         if(_loc5_ != null)
         {
            _loc5_.rectangle = _window.rectangle;
         }
         var _loc6_:* = 0;
         _loc2_ = 0;
         while(_loc2_ < var_272.length)
         {
            _loc3_ = var_272[_loc2_];
            _loc6_ += _loc3_.iconCount * _loc3_.defaultIconSize;
            _loc2_++;
         }
         var _loc7_:* = 0;
         var _loc8_:Number = _toolbarMarginTop;
         var _loc9_:* = 1;
         if(_loc6_ > _loc4_)
         {
            _loc9_ = Number(_loc4_ / _loc6_);
         }
         else
         {
            _loc9_ = Number(Math.max(1,_loc4_ / (_loc6_ / 0.7)));
            if(false)
            {
               if(orientation == "LEFT" || orientation == "RIGHT")
               {
                  _loc7_ = Number(Math.max(var_1556,(0 - _loc6_ * _loc9_ - _toolbarMarginTop - var_1299) / -1));
               }
               else
               {
                  _loc7_ = Number(Math.max(var_1556,(0 - _loc6_ * _loc9_ - _toolbarMarginTop - var_1299) / -1));
               }
            }
         }
         _loc2_ = 0;
         while(_loc2_ < var_272.length)
         {
            _loc3_ = var_272[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.orientation = var_506;
               _loc3_.iconSize = _loc3_.defaultIconSize * _loc9_;
               _loc3_.position = _loc8_;
               _loc8_ += _loc3_.size + _loc7_;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_611.length)
         {
            _loc3_ = var_611[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.position = _loc2_;
            }
            _loc2_++;
         }
         if(var_273 != null)
         {
            var_273.refresh();
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         if(var_1076 && var_1075)
         {
            var_1075 = false;
         }
      }
      
      private function createGroupsFromXmlList(param1:XMLList, param2:Array, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IWindowContainer, param6:ToolbarBarMenuAnimator) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         while(_loc10_ < param1.length())
         {
            _loc7_ = param1[_loc10_];
            _loc8_ = _loc7_.children();
            _loc9_ = new ToolbarIconGroup(param3,param4,_loc10_,_events,param5,param6,var_130);
            _loc9_.defaultIconSize = _loc7_.@icon_size;
            _loc9_.iconSize = _loc9_.defaultIconSize;
            _loc9_.orientation = _loc7_.@default_orientation;
            _loc9_.windowMargin = _loc7_.@window_margin;
            _loc9_.windowBottomMargin = _loc7_.@window_bottom_margin;
            if(_loc9_.addContentIndexFromXmlList(_loc7_))
            {
               param2.push(_loc9_);
            }
            _loc10_++;
         }
      }
      
      public function get orientation() : String
      {
         return var_506;
      }
      
      public function getIconLoc(param1:String) : Point
      {
         var _loc2_:ToolbarIcon = getIconById(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return new Point(_loc2_.x,_loc2_.y);
      }
      
      private function getTargetOrientationFromXY(param1:Number, param2:Number) : String
      {
         var _loc3_:IDesktopWindow = _window.context.getDesktopWindow();
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 <= var_130)
         {
            return "LEFT";
         }
         if(param1 >= _loc3_.width - var_130)
         {
            return "RIGHT";
         }
         if(param2 <= var_130)
         {
            return "TOP";
         }
         if(param2 >= _loc3_.height - var_130)
         {
            return "BOTTOM";
         }
         return null;
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer) : void
      {
         alignWindows();
         var _loc3_:ToolbarIcon = getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.hideWindow(param1,param2,var_130,var_506);
         }
      }
      
      public function setIconState(param1:String, param2:String) : void
      {
         var _loc3_:ToolbarIcon = getIconById(param1);
         if(_loc3_ != null)
         {
            _loc3_.state = param2;
            alignWindows();
         }
      }
      
      private function getGroupForIcon(param1:String) : ToolbarIconGroup
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < var_272.length)
         {
            _loc2_ = var_272[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < var_611.length)
         {
            _loc2_ = var_611[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function getIconById(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconById(param1);
         }
         return null;
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer) : void
      {
         var _loc3_:ToolbarIcon = getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.animateWindowOut(param1,param2,var_506);
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_1076 && var_1075)
         {
            _loc2_ = getTargetOrientationFromXY(param1.stageX,param1.stageY);
            if(_loc2_ != null && _loc2_ != var_506)
            {
               var_506 = _loc2_;
               alignWindows();
               if(_events != null)
               {
                  _loc3_ = new HabboToolbarEvent(HabboToolbarEvent.TOOLBAR_ORIENTATION);
                  _loc3_.orientation = var_506;
                  _events.dispatchEvent(_loc3_);
               }
            }
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer) : void
      {
         alignWindows();
         var _loc3_:ToolbarIcon = getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.positionWindow(param1,param2,var_130,var_506);
         }
      }
      
      public function setIcon(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:ToolbarIconGroup = getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setIcon(param1,param2);
            alignWindows();
         }
      }
   }
}
