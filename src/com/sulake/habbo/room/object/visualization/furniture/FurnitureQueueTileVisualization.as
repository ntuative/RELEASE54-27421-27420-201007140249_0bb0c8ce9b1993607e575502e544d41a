package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1112:int = 1;
      
      private static const const_1094:int = 3;
      
      private static const const_1111:int = 2;
      
      private static const const_1113:int = 15;
       
      
      private var var_890:int;
      
      private var var_232:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_232 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1111)
         {
            var_232 = new Array();
            var_232.push(const_1112);
            var_890 = const_1113;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_890 > 0)
         {
            --var_890;
         }
         if(var_890 == 0)
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
