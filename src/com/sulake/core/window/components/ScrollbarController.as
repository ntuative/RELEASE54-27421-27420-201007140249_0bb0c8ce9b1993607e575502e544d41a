package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ScrollbarController extends InteractiveController implements IScrollbarWindow
   {
      
      private static const const_1105:String = "increment";
      
      private static const const_517:String = "slider_bar";
      
      private static const const_1104:String = "decrement";
      
      private static const const_783:String = "slider_track";
       
      
      private var _horizontal:Boolean;
      
      protected var var_23:IScrollableWindow;
      
      private var var_610:Boolean = false;
      
      protected var var_836:Number = 0.1;
      
      private var var_876:String;
      
      protected var _offset:Number = 0;
      
      public function ScrollbarController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0, param12:IScrollableWindow = null)
      {
         var _loc14_:* = null;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_170 = false;
         var_23 = param12;
         _horizontal = param2 == WindowType.const_476;
         var _loc13_:Array = new Array();
         groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc13_,true);
         for each(_loc14_ in _loc13_)
         {
            _loc14_.procedure = scrollButtonEventProc;
         }
         updateLiftSizeAndPosition();
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         switch(param1.name)
         {
            case ScrollbarController.const_517:
               if(param2.type == WindowNotifyEvent.const_252)
               {
                  if(!var_610)
                  {
                     if(_horizontal)
                     {
                        setScrollPosition(ScrollbarLiftController(param1).offsetX);
                     }
                     else
                     {
                        setScrollPosition(ScrollbarLiftController(param1).offsetY);
                     }
                  }
               }
         }
         var _loc3_:Boolean = super.update(param1,param2);
         if(param2.type == WindowNotifyEvent.const_412)
         {
            if(var_23 == null)
            {
               resolveScrollTarget();
            }
         }
         if(param1 == this)
         {
            if(param2.type == WindowNotifyEvent.const_182)
            {
               updateLiftSizeAndPosition();
            }
            else if(param2.type == MouseEvent.MOUSE_WHEEL)
            {
               if(MouseEvent(param2).delta > 0)
               {
                  if(_horizontal)
                  {
                     scrollH -= var_836;
                  }
                  else
                  {
                     scrollV -= var_836;
                  }
               }
               else if(_horizontal)
               {
                  scrollH += var_836;
               }
               else
               {
                  scrollV += var_836;
               }
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      override public function enable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(super.enable())
         {
            _loc1_ = new Array();
            groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc1_,true);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               IWindow(_loc1_[_loc2_]).enable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      protected function get track() : WindowController
      {
         return findChildByName(const_783) as WindowController;
      }
      
      private function nullEventProc(param1:WindowEvent, param2:IWindow) : void
      {
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(!_horizontal)
         {
            setScrollPosition(param1);
            updateLiftSizeAndPosition();
         }
      }
      
      public function set scrollable(param1:IScrollableWindow) : void
      {
         if(var_23 != null && true)
         {
            IWindow(var_23).removeEventListener(WindowEvent.const_43,onScrollableResized);
         }
         var_23 = param1;
         if(var_23 != null && true)
         {
            IWindow(var_23).addEventListener(WindowEvent.const_43,onScrollableResized);
            updateLiftSizeAndPosition();
         }
      }
      
      protected function get lift() : WindowController
      {
         return track.findChildByName(const_517) as WindowController;
      }
      
      protected function setScrollPosition(param1:Number) : void
      {
         if(var_23 == null)
         {
            if(!resolveScrollTarget())
            {
               return;
            }
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(_horizontal)
         {
            _offset = param1;
            var_23.scrollH = _offset;
         }
         else
         {
            _offset = param1;
            var_23.scrollV = _offset;
         }
      }
      
      override public function dispose() : void
      {
         scrollable = null;
         super.dispose();
      }
      
      public function get scrollH() : Number
      {
         return !!_horizontal ? Number(_offset) : Number(0);
      }
      
      public function get horizontal() : Boolean
      {
         return _horizontal;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_] as PropertyStruct;
            if(_loc3_.key == "scrollable")
            {
               var_876 = _loc3_.value as String;
            }
            _loc4_++;
         }
         super.properties = param1;
      }
      
      override public function disable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(super.disable())
         {
            _loc1_ = new Array();
            groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc1_,true);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               IWindow(_loc1_[_loc2_]).disable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      public function get scrollV() : Number
      {
         return !!_horizontal ? 0 : Number(_offset);
      }
      
      private function resolveScrollTarget() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(var_23 != null)
         {
            if(true)
            {
               return true;
            }
         }
         if(var_876 != null)
         {
            _loc1_ = findParentByName(var_876) as IScrollableWindow;
            if(_loc1_ == null && var_12 is IWindowContainer)
            {
               _loc1_ = IWindowContainer(var_12).findChildByName(var_876) as IScrollableWindow;
               if(_loc1_)
               {
                  scrollable = _loc1_;
                  return true;
               }
            }
         }
         if(var_12 is IScrollableWindow)
         {
            scrollable = IScrollableWindow(var_12);
            return true;
         }
         if(var_12 is IWindowContainer && !(var_12 is IDesktopWindow))
         {
            _loc2_ = uint(IWindowContainer(var_12).numChildren);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = IWindowContainer(var_12).getChildAt(_loc4_) as IScrollableWindow;
               if(_loc3_)
               {
                  scrollable = _loc3_;
                  return true;
               }
               _loc4_++;
            }
         }
         return false;
      }
      
      public function get scrollable() : IScrollableWindow
      {
         return var_23;
      }
      
      private function scrollButtonEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.const_47)
         {
            if(param2.name == const_1105)
            {
               if(var_23)
               {
                  var_610 = true;
                  if(_horizontal)
                  {
                     scrollH += 0 / 0;
                  }
                  else
                  {
                     scrollV += 0 / 0;
                  }
                  var_610 = false;
                  _loc3_ = true;
               }
            }
            else if(param2.name == const_1104)
            {
               if(var_23)
               {
                  var_610 = true;
                  if(_horizontal)
                  {
                     scrollH -= 0 / 0;
                  }
                  else
                  {
                     scrollV -= 0 / 0;
                  }
                  var_610 = false;
                  _loc3_ = true;
               }
            }
            else if(param2.name == const_783)
            {
               _loc4_ = new Point();
               param2.getGlobalPosition(_loc4_);
               _loc4_.x = _context.getDesktopWindow().mouseX - _loc4_.x;
               _loc4_.y = _context.getDesktopWindow().mouseY - _loc4_.y;
               _loc5_ = WindowController(param2).getChildByName(ScrollbarController.const_517).rectangle;
               if(_horizontal)
               {
                  if(_loc4_.x < _loc5_.x)
                  {
                     scrollH -= (var_23.visibleRegion.width - 0) / 0;
                  }
                  else if(_loc4_.x > _loc5_.right)
                  {
                     scrollH += (var_23.visibleRegion.width - 0) / 0;
                  }
               }
               else if(_loc4_.y < _loc5_.y)
               {
                  scrollV -= (var_23.visibleRegion.height - 0) / 0;
               }
               else if(_loc4_.y > _loc5_.bottom)
               {
                  scrollV += (var_23.visibleRegion.height - 0) / 0;
               }
               _loc3_ = true;
            }
         }
         if(param1.type == WindowMouseEvent.const_1039)
         {
            if(WindowMouseEvent(param1).delta > 0)
            {
               if(_horizontal)
               {
                  scrollH -= var_836;
               }
               else
               {
                  scrollV -= var_836;
               }
            }
            else if(_horizontal)
            {
               scrollH += var_836;
            }
            else
            {
               scrollV += var_836;
            }
            _loc3_ = true;
         }
         if(_loc3_)
         {
            updateLiftSizeAndPosition();
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:String = "";
         if(var_23 is IWindow)
         {
            _loc2_ = IWindow(var_23).name;
         }
         else if(var_876 != null)
         {
            _loc2_ = var_876;
         }
         _loc1_.push(new PropertyStruct("scrollable",_loc2_,"String",_loc2_ != ""));
         return _loc1_;
      }
      
      public function get vertical() : Boolean
      {
         return !_horizontal;
      }
      
      private function updateLiftSizeAndPosition() : void
      {
         var _loc1_:* = NaN;
         var _loc4_:int = 0;
         if(var_23 == null)
         {
            if(_disposed || !resolveScrollTarget())
            {
               return;
            }
         }
         var _loc2_:WindowController = track;
         var _loc3_:WindowController = lift;
         if(_loc3_ != null)
         {
            if(_horizontal)
            {
               _loc1_ = Number(var_23.visibleRegion.width / var_23.scrollableRegion.width);
               if(_loc1_ > 1)
               {
                  _loc1_ = 1;
               }
               _loc4_ = _loc1_ * _loc2_.width;
               _loc3_.width = _loc4_;
               _loc3_.x = 0 * (_loc2_.width - _loc4_);
            }
            else
            {
               _loc1_ = Number(var_23.visibleRegion.height / var_23.scrollableRegion.height);
               if(_loc1_ > 1)
               {
                  _loc1_ = 1;
               }
               _loc4_ = _loc1_ * _loc2_.height;
               _loc3_.height = _loc4_;
               _loc3_.y = 0 * (_loc2_.height - _loc4_);
            }
         }
         if(_loc1_ == 1)
         {
            disable();
         }
         else
         {
            enable();
         }
      }
      
      private function onScrollableResized(param1:Event) : void
      {
         updateLiftSizeAndPosition();
         setScrollPosition(_offset);
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(_horizontal)
         {
            setScrollPosition(param1);
            updateLiftSizeAndPosition();
         }
      }
   }
}
