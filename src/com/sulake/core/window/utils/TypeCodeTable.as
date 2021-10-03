package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_638;
         param1["bitmap"] = const_652;
         param1["border"] = const_763;
         param1["border_notify"] = const_1332;
         param1["button"] = const_378;
         param1["button_thick"] = const_658;
         param1["button_icon"] = const_1264;
         param1["button_group_left"] = const_609;
         param1["button_group_center"] = const_647;
         param1["button_group_right"] = const_750;
         param1["canvas"] = const_672;
         param1["checkbox"] = const_629;
         param1["closebutton"] = const_931;
         param1["container"] = const_352;
         param1["container_button"] = const_674;
         param1["display_object_wrapper"] = const_699;
         param1["dropmenu"] = const_465;
         param1["dropmenu_item"] = const_507;
         param1["frame"] = const_302;
         param1["frame_notify"] = const_1386;
         param1["header"] = const_596;
         param1["icon"] = const_888;
         param1["itemgrid"] = const_981;
         param1["itemgrid_horizontal"] = const_429;
         param1["itemgrid_vertical"] = const_605;
         param1["itemlist"] = const_908;
         param1["itemlist_horizontal"] = const_318;
         param1["itemlist_vertical"] = const_333;
         param1["maximizebox"] = const_1278;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1302;
         param1["submenu"] = const_1015;
         param1["minimizebox"] = const_1234;
         param1["notify"] = const_1361;
         param1["null"] = const_753;
         param1["password"] = const_659;
         param1["radiobutton"] = const_666;
         param1["region"] = const_463;
         param1["restorebox"] = const_1346;
         param1["scaler"] = const_532;
         param1["scaler_horizontal"] = const_1414;
         param1["scaler_vertical"] = const_1382;
         param1["scrollbar_horizontal"] = const_476;
         param1["scrollbar_vertical"] = const_716;
         param1["scrollbar_slider_button_up"] = const_942;
         param1["scrollbar_slider_button_down"] = const_1029;
         param1["scrollbar_slider_button_left"] = const_847;
         param1["scrollbar_slider_button_right"] = const_1003;
         param1["scrollbar_slider_bar_horizontal"] = const_886;
         param1["scrollbar_slider_bar_vertical"] = const_1002;
         param1["scrollbar_slider_track_horizontal"] = const_1016;
         param1["scrollbar_slider_track_vertical"] = const_880;
         param1["scrollable_itemlist"] = const_1360;
         param1["scrollable_itemlist_vertical"] = const_389;
         param1["scrollable_itemlist_horizontal"] = const_999;
         param1["selector"] = const_535;
         param1["selector_list"] = const_745;
         param1["submenu"] = const_1015;
         param1["tab_button"] = const_665;
         param1["tab_container_button"] = const_991;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_1019;
         param1["tab_selector"] = const_648;
         param1["text"] = const_752;
         param1["input"] = const_728;
         param1["toolbar"] = const_1226;
         param1["tooltip"] = const_336;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
