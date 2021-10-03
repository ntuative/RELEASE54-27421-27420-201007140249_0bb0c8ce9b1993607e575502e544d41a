package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1115:int = 0;
      
      private var var_1355:int = 0;
      
      private var var_2020:String = "";
      
      private var var_1116:int = 0;
      
      private var var_2021:String = "";
      
      private var var_2025:int = 0;
      
      private var var_1603:String = "";
      
      private var var_1920:int = 0;
      
      private var var_2022:int = 0;
      
      private var var_2024:String = "";
      
      private var var_2023:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1920 = param1;
         var_2024 = param2;
         var_1603 = param3;
         var_2020 = param4;
         var_2021 = param5;
         if(param6)
         {
            var_1355 = 1;
         }
         else
         {
            var_1355 = 0;
         }
         var_2025 = param7;
         var_2022 = param8;
         var_1116 = param9;
         var_2023 = param10;
         var_1115 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1920,var_2024,var_1603,var_2020,var_2021,var_1355,var_2025,var_2022,var_1116,var_2023,var_1115];
      }
      
      public function dispose() : void
      {
      }
   }
}
