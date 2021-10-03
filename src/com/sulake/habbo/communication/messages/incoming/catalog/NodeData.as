package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class NodeData
   {
       
      
      private var _color:int;
      
      private var _pageId:int;
      
      private var var_2400:Boolean;
      
      private var _localization:String;
      
      private var var_1093:Array;
      
      private var var_1458:Boolean;
      
      private var _icon:int;
      
      public function NodeData(param1:IMessageDataWrapper)
      {
         super();
         var_2400 = Boolean(param1.readInteger());
         _color = param1.readInteger();
         _icon = param1.readInteger();
         _pageId = param1.readInteger();
         _localization = param1.readString();
         var_1093 = new Array();
         var_1458 = Boolean(param1.readInteger());
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1093.push(new NodeData(param1));
            _loc3_++;
         }
      }
      
      public function get icon() : int
      {
         return _icon;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get localization() : String
      {
         return _localization;
      }
      
      public function get pageId() : int
      {
         return _pageId;
      }
      
      public function get nodes() : Array
      {
         return var_1093;
      }
      
      public function get navigateable() : Boolean
      {
         return var_2400;
      }
      
      public function get disabled() : Boolean
      {
         return var_1458;
      }
   }
}
