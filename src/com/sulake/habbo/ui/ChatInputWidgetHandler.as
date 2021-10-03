package com.sulake.habbo.ui
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputDisplayEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatInputWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatTypingMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ChatInputWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      private var var_935:Number = 0.0;
      
      private var var_545:Point = null;
      
      private var _toolbar:IHabboToolbar;
      
      public function ChatInputWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.CHAT_INPUT_WIDGET;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         _toolbar = _container.toolbar;
      }
      
      public function update() : void
      {
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
         if(_container != null && false && null != null)
         {
            _container.events.dispatchEvent(null);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetChatInputWidgetMessage.const_566);
         _loc1_.push(RoomWidgetChatTypingMessage.const_617);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
         _toolbar = null;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case RoomWidgetChatInputWidgetMessage.const_566:
               _loc2_ = param1 as RoomWidgetChatInputWidgetMessage;
               if(_loc2_ != null)
               {
                  positionWindow(_loc2_.window);
               }
               break;
            case RoomWidgetChatTypingMessage.const_617:
               _loc3_ = param1 as RoomWidgetChatTypingMessage;
               if(_loc3_ != null)
               {
                  _container.roomSession.sendChatTypingMessage(_loc3_.isTyping);
               }
         }
         return null;
      }
      
      private function positionWindow(param1:IWindowContainer) : void
      {
         if(_toolbar == null)
         {
            return;
         }
         _toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_678,HabboToolbarIconEnum.CHATINPUT,param1));
         _container.events.dispatchEvent(new RoomWidgetChatInputDisplayEvent(RoomWidgetChatInputDisplayEvent.const_744,_container.sessionDataManager.isAnyRoomController));
      }
   }
}
