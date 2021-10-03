package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.messages.RoomWidgetDanceMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenInventoryMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetShowOwnRoomsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetWaveMessage;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class MeMenuMainView implements IMeMenuView
   {
       
      
      private var _widget:MeMenuWidget;
      
      private var _window:IWindowContainer;
      
      private var var_159:Dictionary;
      
      public function MeMenuMainView()
      {
         super();
      }
      
      private function getClubAssetNameBase() : String
      {
         switch(_widget.habboClubLevel)
         {
            case HabboClubLevelEnum.const_44:
            case HabboClubLevelEnum.const_56:
               return "club";
            case HabboClubLevelEnum.const_49:
               return "vip";
            default:
               return null;
         }
      }
      
      private function setElementImage(param1:String, param2:String, param3:Number = 1.0) : void
      {
         var _loc4_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         var _loc5_:BitmapDataAsset = _widget.assets.getAssetByName(param2) as BitmapDataAsset;
         if(_loc4_ == null)
         {
            Logger.log("Could not find element: " + param1);
            return;
         }
         if(_loc5_ == null || _loc5_.content == null)
         {
            Logger.log("Could not find asset: " + param2);
            return;
         }
         var _loc6_:BitmapData = _loc5_.content as BitmapData;
         _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         var _loc7_:int = (_loc4_.width - _loc6_.width) / 2;
         var _loc8_:int = (_loc4_.height - _loc6_.height) / 2;
         _loc4_.bitmap.copyPixels(_loc6_,_loc6_.rect,new Point(_loc7_,_loc8_));
         _loc4_.blend = param3;
      }
      
      public function setIconAssets(param1:String, param2:String, param3:String = null, param4:String = null) : void
      {
         if(true)
         {
            return;
         }
         if(param3 != null)
         {
            var_159[param1][0] = param3;
         }
         if(param4 != null)
         {
            var_159[param1][1] = param4;
         }
         setElementImage(param1,param3);
      }
      
      private function setElementText(param1:String, param2:String) : void
      {
         var _loc3_:ITextWindow = _window.findChildByName(param1) as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.text = param2;
         }
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      private function onAlertClicked(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = NaN;
         var _loc9_:* = null;
         if(_widget == null)
         {
            return;
         }
         var _loc2_:XmlAsset = _widget.assets.getAssetByName("memenu_main") as XmlAsset;
         Logger.log("Show window: " + _loc2_);
         _window = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         _window.name = param1;
         for(_loc3_ in var_159)
         {
            _loc6_ = var_159[_loc3_];
            if(!(_loc6_ == null || _loc6_.length == 0))
            {
               _loc7_ = _loc6_[0];
               _loc8_ = 1;
               switch(_loc3_)
               {
                  case "dance_icon":
                  case "wave_icon":
                     if(false)
                     {
                        _loc8_ = 0.5;
                     }
                     break;
                  case "effects_icon":
                     if(false)
                     {
                        _loc8_ = 0.5;
                     }
                     break;
                  case "hc_icon":
                     _loc7_ = getClubAssetNameBase() + _loc7_;
                     if(true)
                     {
                        setElementText("hc_text",_widget.localizations.getKey("widget.memenu.hc.join"));
                     }
                     else
                     {
                        if(true)
                        {
                           _loc9_ = "widget.memenu.vip";
                        }
                        else
                        {
                           _loc9_ = "widget.memenu.hc";
                        }
                        if(false)
                        {
                           _loc9_ += ".long";
                        }
                        _widget.localizations.registerParameter(_loc9_,"days",String(_widget.habboClubDays));
                        _widget.localizations.registerParameter(_loc9_,"months",String(_widget.habboClubPeriods));
                        setElementText("hc_text",_widget.localizations.getKey(_loc9_));
                     }
                     break;
                  case "news_icon":
                     if(true)
                     {
                        _loc8_ = 0.5;
                     }
               }
               setElementImage(_loc3_,_loc7_,_loc8_);
            }
         }
         _loc5_ = 0;
         while(_loc5_ < _window.numChildren)
         {
            _loc4_ = _window.getChildAt(_loc5_);
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOverOrOut);
            _loc4_.addEventListener(WindowMouseEvent.const_27,onMouseOverOrOut);
            _loc5_++;
         }
         _widget.mainContainer.addChild(_window);
      }
      
      public function init(param1:MeMenuWidget, param2:String) : void
      {
         var_159 = new Dictionary();
         var_159["rooms_icon"] = ["gohome_white","gohome_color"];
         var_159["dance_icon"] = ["dance_white","dance_color"];
         var_159["clothes_icon"] = ["clothes_white","clothes_color"];
         var_159["effects_icon"] = ["effects_white","effects_color"];
         var_159["badges_icon"] = ["badges_white","badges_color"];
         var_159["wave_icon"] = ["wave_white","wave_color"];
         var_159["hc_icon"] = ["_white","_color"];
         var_159["settings_icon"] = ["settings_white","settings_color"];
         var_159["credits_icon"] = ["credits_white","credits_color"];
         var_159["news_icon"] = ["news_white","news_color"];
         _widget = param1;
         createWindow(param2);
      }
      
      private function onMouseOverOrOut(param1:WindowMouseEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         var _loc4_:* = _loc3_ + "_icon";
         var _loc7_:String = "";
         var _loc8_:int = param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER ? 1 : 0;
         switch(_loc3_)
         {
            case "dance":
               if(false)
               {
                  return;
               }
               break;
            case "news":
               if(true)
               {
                  return;
               }
               break;
            case "wave":
               if(false)
               {
                  return;
               }
               break;
            case "effects":
               if(false)
               {
                  return;
               }
               break;
            case "hc":
               _loc7_ = getClubAssetNameBase();
         }
         _loc4_ = _loc3_ + "_icon";
         _loc5_ = var_159[_loc4_];
         if(_loc5_ != null)
         {
            _loc6_ = _loc7_ + _loc5_[_loc8_];
            setElementImage(_loc4_,_loc6_);
         }
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc4_:* = false;
         var _loc5_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "dance":
               if(false)
               {
                  return;
               }
               _widget.changeView(MeMenuWidget.const_866);
               break;
            case "wave":
               if(false)
               {
                  return;
               }
               if(false)
               {
                  _widget.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(RoomWidgetDanceMessage.const_926));
                  _widget.isDancing = false;
               }
               _widget.messageListener.processWidgetMessage(new RoomWidgetWaveMessage());
               _widget.hide();
               break;
            case "effects":
               if(false)
               {
                  return;
               }
               _widget.changeView(MeMenuWidget.const_585);
               break;
            case "rooms":
               _widget.messageListener.processWidgetMessage(new RoomWidgetShowOwnRoomsMessage());
               _widget.hide();
               break;
            case "badges":
               _widget.messageListener.processWidgetMessage(new RoomWidgetOpenInventoryMessage(RoomWidgetOpenInventoryMessage.const_993));
               _widget.hide();
               break;
            case "clothes":
               _widget.changeView(MeMenuWidget.const_265);
               break;
            case "hc":
               _widget.messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_893));
               _widget.hide();
               break;
            case "settings":
               _widget.changeView(MeMenuWidget.const_684);
               break;
            case "news":
               if(false && false)
               {
                  ExternalInterface.call("FlashExternalInterface.openHabblet","news");
                  _widget.hide();
               }
               break;
            case "credits":
               _loc4_ = _widget.config.getKey("client.credits.embed.enabled","false") == "KickUserMessageComposer";
               if(false && _loc4_)
               {
                  ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
               }
               else
               {
                  _loc5_ = _widget.config.getKey("link.format.credits","/credits");
                  HabboWebTools.navigateToURL(_loc5_,"habboMain");
                  _widget.windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onAlertClicked);
               }
               _widget.hide();
               break;
            default:
               Logger.log("Me Menu Main View: unknown button: " + _loc3_);
         }
      }
      
      public function dispose() : void
      {
         _widget = null;
         _window.dispose();
         _window = null;
      }
   }
}
