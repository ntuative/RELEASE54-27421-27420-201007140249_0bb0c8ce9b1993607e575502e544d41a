package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboIconType;
   
   public class ClubEndingNotification
   {
       
      
      private var _catalog:IHabboCatalog;
      
      private var _window:IFrameWindow;
      
      public function ClubEndingNotification(param1:int, param2:Boolean, param3:IAssetLibrary, param4:IHabboWindowManager, param5:IHabboCatalog, param6:IHabboLocalizationManager)
      {
         super();
         if(!param3 || !param4 || !param5 || !param6)
         {
            return;
         }
         _catalog = param5;
         param6.registerParameter("notifications.text.club_ending","days",param1.toString());
         var _loc7_:XmlAsset = param3.getAssetByName("club_ending_notification_xml") as XmlAsset;
         if(_loc7_ == null)
         {
            return;
         }
         _window = param4.buildFromXML(_loc7_.content as XML) as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         var _loc8_:IIconWindow = _window.findChildByName("club_icon") as IIconWindow;
         if(_loc8_)
         {
            if(param2)
            {
               _loc8_.style = HabboIconType.const_1385;
            }
            else
            {
               _loc8_.style = HabboIconType.const_1225;
            }
         }
         _window.procedure = eventHandler;
         _window.center();
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "open_catalog_button":
               if(_catalog)
               {
                  _catalog.openCatalogPage(CatalogPageName.const_228,true);
               }
               dispose();
               break;
            case "header_button_close":
            case "cancel_button":
               dispose();
               return;
         }
      }
      
      public function get visible() : Boolean
      {
         return _window && false;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _catalog = null;
      }
   }
}
