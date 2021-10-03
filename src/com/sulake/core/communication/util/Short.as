package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_813:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_813 = new ByteArray();
         var_813.writeShort(param1);
         var_813.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_813.position = 0;
         if(false)
         {
            _loc1_ = var_813.readShort();
            var_813.position = 0;
         }
         return _loc1_;
      }
   }
}
