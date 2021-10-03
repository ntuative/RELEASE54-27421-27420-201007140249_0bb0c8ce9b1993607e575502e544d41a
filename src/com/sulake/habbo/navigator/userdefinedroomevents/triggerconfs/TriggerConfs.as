package com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs
{
   public class TriggerConfs
   {
       
      
      private var var_552:Array;
      
      public function TriggerConfs()
      {
         var_552 = new Array();
         super();
         this.var_552.push(new AvatarSaysSomething());
         this.var_552.push(new AvatarEntersStuff());
         this.var_552.push(new AvatarExitsStuff());
         this.var_552.push(new TriggerOnce());
         this.var_552.push(new StuffIsUsed());
         this.var_552.push(new UseStuffAndStateSnapshotMatches());
      }
      
      public function getByCode(param1:int) : TriggerConf
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_552)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get confs() : Array
      {
         return var_552;
      }
   }
}
