package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_124;
         param1["bound_to_parent_rect"] = const_87;
         param1["child_window"] = const_1009;
         param1["embedded_controller"] = const_323;
         param1["resize_to_accommodate_children"] = const_59;
         param1["input_event_processor"] = const_45;
         param1["internal_event_handling"] = const_649;
         param1["mouse_dragging_target"] = const_240;
         param1["mouse_dragging_trigger"] = const_346;
         param1["mouse_scaling_target"] = const_290;
         param1["mouse_scaling_trigger"] = const_481;
         param1["horizontal_mouse_scaling_trigger"] = const_196;
         param1["vertical_mouse_scaling_trigger"] = const_217;
         param1["observe_parent_input_events"] = const_927;
         param1["optimize_region_to_layout_size"] = const_492;
         param1["parent_window"] = const_1030;
         param1["relative_horizontal_scale_center"] = const_166;
         param1["relative_horizontal_scale_fixed"] = const_139;
         param1["relative_horizontal_scale_move"] = const_331;
         param1["relative_horizontal_scale_strech"] = const_257;
         param1["relative_scale_center"] = const_929;
         param1["relative_scale_fixed"] = const_760;
         param1["relative_scale_move"] = const_985;
         param1["relative_scale_strech"] = const_865;
         param1["relative_vertical_scale_center"] = const_170;
         param1["relative_vertical_scale_fixed"] = const_132;
         param1["relative_vertical_scale_move"] = const_349;
         param1["relative_vertical_scale_strech"] = const_288;
         param1["on_resize_align_left"] = const_576;
         param1["on_resize_align_right"] = const_511;
         param1["on_resize_align_center"] = const_482;
         param1["on_resize_align_top"] = const_746;
         param1["on_resize_align_bottom"] = const_432;
         param1["on_resize_align_middle"] = const_485;
         param1["on_accommodate_align_left"] = const_946;
         param1["on_accommodate_align_right"] = const_451;
         param1["on_accommodate_align_center"] = const_538;
         param1["on_accommodate_align_top"] = const_896;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_587;
         param1["route_input_events_to_parent"] = const_413;
         param1["use_parent_graphic_context"] = const_30;
         param1["draggable_with_mouse"] = const_969;
         param1["scalable_with_mouse"] = const_1056;
         param1["reflect_horizontal_resize_to_parent"] = const_479;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_258;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
