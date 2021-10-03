package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1095:int = 31;
      
      private static const const_1094:int = 32;
      
      private static const const_516:int = 30;
      
      private static const const_777:int = 20;
      
      private static const const_515:int = 10;
       
      
      private var var_635:Boolean = false;
      
      private var var_232:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_232 = new Array();
         super();
         super.setAnimation(const_516);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!var_635)
            {
               var_635 = true;
               var_232 = new Array();
               var_232.push(const_1095);
               var_232.push(const_1094);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_515)
         {
            if(var_635)
            {
               var_635 = false;
               var_232 = new Array();
               if(_direction == 2)
               {
                  var_232.push(const_777 + 5 - param1);
                  var_232.push(const_515 + 5 - param1);
               }
               else
               {
                  var_232.push(const_777 + param1);
                  var_232.push(const_515 + param1);
               }
               var_232.push(const_516);
               return;
            }
            super.setAnimation(const_516);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
         {
            if(false)
            {
               super.setAnimation(var_232.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
