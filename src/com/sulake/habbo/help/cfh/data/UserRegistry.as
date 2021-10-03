package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1153:int = 80;
       
      
      private var var_562:Map;
      
      private var var_802:String = "";
      
      private var var_1427:Array;
      
      public function UserRegistry()
      {
         var_562 = new Map();
         var_1427 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_562.getValue(var_1427.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_802;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_562.getValue(param1) != null)
         {
            var_562.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_802);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_802 == "")
         {
            var_1427.push(param1);
         }
         var_562.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_562;
      }
      
      public function unregisterRoom() : void
      {
         var_802 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_562.length > const_1153)
         {
            _loc1_ = var_562.getKey(0);
            var_562.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_802 = param1;
         if(var_802 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
