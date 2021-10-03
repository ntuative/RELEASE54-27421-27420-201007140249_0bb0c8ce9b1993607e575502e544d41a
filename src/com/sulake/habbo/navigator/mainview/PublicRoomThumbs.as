package com.sulake.habbo.navigator.mainview
{
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
   import flash.utils.Dictionary;
   
   public class PublicRoomThumbs
   {
       
      
      private var var_1501:Dictionary;
      
      public function PublicRoomThumbs()
      {
         var_1501 = new Dictionary();
         super();
         add("hh_room_bar");
         add("hh_room_bar_ING2");
         add("hh_room_beauty_salon_general");
         add("hh_room_cafe");
         add("hh_room_chill");
         add("hh_room_cinema");
         add("hh_room_clubmammoth");
         add("hh_room_disco");
         add("hh_room_emperors");
         add("hh_room_erics");
         add("hh_room_floorlobbies");
         add("hh_room_gate_park");
         add("hh_room_gold");
         add("hh_room_habburger");
         add("hh_room_hallway");
         add("hh_room_kitchen");
         add("hh_room_library");
         add("hh_room_lobby");
         add("hh_room_lobby_bb");
         add("hh_room_lobby_sw");
         add("hh_room_netcafe");
         add("hh_room_nlobby");
         add("hh_room_orient");
         add("hh_room_park");
         add("hh_room_picnic");
         add("hh_room_pizza");
         add("hh_room_pool");
         add("hh_room_pub");
         add("hh_room_rooftop");
         add("hh_room_schoolyard");
         add("hh_room_space_cafe");
         add("hh_room_sport");
         add("hh_room_starlounge");
         add("hh_room_sun_terrace");
         add("hh_room_tearoom");
         add("hh_room_terrace");
         add("hh_room_tv_studio");
         add("hh_room_tv_studio_nikejoga");
         add("hh_room_tv_studio_viva");
         add("hh_room_floatinggarden");
         add("hh_room_theater_halloween");
         add("hh_room_den");
         add("hh_room_ballroom");
         add("hh_room_dustylounge");
         add("hh_room_theater_xmas");
         add("hh_room_old_skool");
         add("hh_room_theater");
         add("hh_room_theater_easter");
         add("hh_room_sunsetcafe");
         add("hh_room_theater_valentine");
         add("hh_room_library_halloween");
         add("hh_room_theater_carneval");
         add("hh_room_icecafe");
         add("hh_room_park_general");
         add("hh_room_floorlobbies_skylight");
         add("hh_room_floorlobbies_basement");
         add("hh_room_park_fi");
         add("hh_room_floorlobbies_median");
         add("hh_room_nlobby_static_cn");
         add("hh_room_tv_studio_general");
      }
      
      private function hasPic(param1:String) : Boolean
      {
         return false;
      }
      
      private function add(param1:String) : void
      {
         var_1501[param1] = param1;
      }
      
      public function resolveRoomImageName(param1:OfficialRoomEntryData) : String
      {
         var _loc3_:* = null;
         var _loc2_:Array = param1.publicRoomData.castLibs.split(",");
         for each(_loc3_ in _loc2_)
         {
            if(hasPic(_loc3_))
            {
               return _loc3_;
            }
         }
         return _loc2_[0];
      }
   }
}
