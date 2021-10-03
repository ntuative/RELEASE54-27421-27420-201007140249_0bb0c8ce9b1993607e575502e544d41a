package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import iid.IIDHabboWindowManager;
   
   public class HabboToolbar extends Component implements IHabboToolbar
   {
       
      
      private var _view:ToolbarView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_38:Boolean = false;
      
      private var var_323:IHabboCommunicationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      public function HabboToolbar(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         _assetLibrary = param3;
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      public function get size() : int
      {
         if(_view != null)
         {
            return _view.barSize;
         }
         return 0;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         var_323.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(onAuthenticationOK));
      }
      
      private function onSetToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         var _loc2_:* = null;
         if(_view != null && var_38)
         {
            if(param1.assetName != null)
            {
               _loc2_ = solveAssetBitmapData(param1.iconId,param1.assetName);
               _view.setIconBitmap(param1.iconId,_loc2_);
            }
            else
            {
               _view.setIcon(param1.iconId);
            }
         }
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_323 = IHabboCommunicationManager(param2);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      private function onRemoveToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(_view != null && var_38)
         {
            _view.removeIcon(param1.iconId);
         }
      }
      
      private function solveAssetBitmapData(param1:String, param2:String = null) : BitmapData
      {
         if(param2 == null)
         {
            switch(param1)
            {
               case HabboToolbarIconEnum.CATALOGUE:
                  param2 = "catalogue_icon";
                  break;
               case HabboToolbarIconEnum.FRIENDLIST:
                  param2 = "friendlist_icon";
                  break;
               case HabboToolbarIconEnum.HAND:
                  param2 = "hand_icon";
                  break;
               case HabboToolbarIconEnum.HELP:
                  param2 = "help_icon";
                  break;
               case HabboToolbarIconEnum.INVENTORY:
                  param2 = "inventory_icon";
                  break;
               case HabboToolbarIconEnum.MEMENU:
                  param2 = "memenu_icon";
                  break;
               case HabboToolbarIconEnum.MESSENGER:
                  param2 = "messenger_icon";
                  break;
               case HabboToolbarIconEnum.NAVIGATOR:
                  param2 = "navigator_icon";
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  param2 = "roominfo_icon";
                  break;
               case HabboToolbarIconEnum.SETTINGS:
                  param2 = "settings_icon";
                  break;
               case HabboToolbarIconEnum.ZOOM:
                  param2 = "zoomout_icon";
            }
         }
         var _loc3_:BitmapDataAsset = _assetLibrary.getAssetByName(param2) as BitmapDataAsset;
         if(_loc3_ == null)
         {
            Logger.log("* Toolbar icon asset \'" + param2 + "\' not found!");
            return null;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         return _loc4_.clone();
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         _view = new ToolbarView(_windowManager,_assetLibrary,events);
         if(_view == null)
         {
            return;
         }
         events.addEventListener(HabboToolbarSetIconEvent.const_119,onSetToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_876,onSetToolbarIconBitmapEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_179,onRemoveToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_165,onSetToolbarIconStateEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_46,onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_404,onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_678,onDisplayWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_939,onHideWindowEvent);
         var_38 = true;
         events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.const_86));
      }
      
      public function get orientation() : String
      {
         if(_view != null)
         {
            return _view.orientation;
         }
         return "";
      }
      
      private function onHideWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(var_38 && _view != null)
         {
            _view.hideWindow(param1.menuId,param1.window);
         }
      }
      
      private function onSetToolbarIconBitmapEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(_view != null && var_38)
         {
            _view.setIconBitmap(param1.iconId,param1.bitmapData);
         }
      }
      
      override public function dispose() : void
      {
         var_38 = false;
         if(var_323)
         {
            var_323.release(new IIDHabboCommunicationManager());
            var_323 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         super.dispose();
      }
      
      private function onDisplayWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(var_38 && _view != null)
         {
            _view.positionWindow(param1.menuId,param1.window);
         }
      }
      
      private function onAnimateWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(var_38 && _view != null)
         {
            if(param1.type == HabboToolbarShowMenuEvent.const_46)
            {
               if(param1.alignToIcon)
               {
                  _view.animateWindowIn(param1.menuId,param1.window);
               }
               else
               {
                  _view.animateWindowIn(param1.menuId,param1.window,new Point(param1.window.x,param1.window.y));
               }
            }
            else
            {
               _view.animateWindowOut(param1.menuId,param1.window);
            }
         }
      }
      
      private function onSetToolbarIconStateEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(_view != null && var_38)
         {
            _view.setIconState(param1.iconId,param1.iconState);
         }
      }
   }
}
