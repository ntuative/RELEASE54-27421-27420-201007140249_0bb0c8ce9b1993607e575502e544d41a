package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_448:uint;
      
      private var var_1137:IUnknown;
      
      private var var_1389:String;
      
      private var var_1138:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1138 = param1;
         var_1389 = getQualifiedClassName(var_1138);
         var_1137 = param2;
         var_448 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1138;
      }
      
      public function get disposed() : Boolean
      {
         return var_1137 == null;
      }
      
      public function get references() : uint
      {
         return var_448;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_448) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1137;
      }
      
      public function get iis() : String
      {
         return var_1389;
      }
      
      public function reserve() : uint
      {
         return ++var_448;
      }
      
      public function dispose() : void
      {
         var_1138 = null;
         var_1389 = null;
         var_1137 = null;
         var_448 = 0;
      }
   }
}
