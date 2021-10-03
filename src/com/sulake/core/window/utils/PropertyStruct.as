package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_573:String = "Rectangle";
      
      public static const const_54:String = "Boolean";
      
      public static const const_717:String = "Number";
      
      public static const const_62:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_708:String = "Point";
      
      public static const const_914:String = "Array";
      
      public static const const_913:String = "uint";
      
      public static const const_441:String = "hex";
      
      public static const const_838:String = "Map";
       
      
      private var var_650:String;
      
      private var var_187:Object;
      
      private var var_2480:Boolean;
      
      private var _type:String;
      
      private var var_2170:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_650 = param1;
         var_187 = param2;
         _type = param3;
         var_2170 = param4;
         var_2480 = param3 == const_838 || param3 == const_914 || param3 == const_708 || param3 == const_573;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_441:
               return "0x" + uint(var_187).toString(16);
            case const_54:
               return Boolean(var_187) == true ? "KickUserMessageComposer" : "false";
            case const_708:
               return "Point(" + Point(var_187).x + ", " + Point(var_187).y + ")";
            case const_573:
               return "Rectangle(" + Rectangle(var_187).x + ", " + Rectangle(var_187).y + ", " + Rectangle(var_187).width + ", " + Rectangle(var_187).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_838:
               _loc3_ = var_187 as Map;
               _loc1_ = "<var key=\"" + var_650 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_914:
               _loc4_ = var_187 as Array;
               _loc1_ = "<var key=\"" + var_650 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_708:
               _loc5_ = var_187 as Point;
               _loc1_ = "<var key=\"" + var_650 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_573:
               _loc6_ = var_187 as Rectangle;
               _loc1_ = "<var key=\"" + var_650 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_441:
               _loc1_ = "<var key=\"" + var_650 + "\" value=\"" + "0x" + uint(var_187).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_650 + "\" value=\"" + var_187 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_187;
      }
      
      public function get valid() : Boolean
      {
         return var_2170;
      }
      
      public function get key() : String
      {
         return var_650;
      }
   }
}
