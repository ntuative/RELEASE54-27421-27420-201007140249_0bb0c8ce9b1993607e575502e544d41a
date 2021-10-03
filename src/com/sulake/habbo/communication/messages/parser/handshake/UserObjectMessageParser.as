package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_409:String;
      
      private var var_2481:String;
      
      private var var_2485:int;
      
      private var var_2484:int;
      
      private var var_629:String;
      
      private var var_1234:String;
      
      private var _name:String;
      
      private var var_579:int;
      
      private var var_999:int;
      
      private var var_2482:int;
      
      private var _respectTotal:int;
      
      private var var_2483:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2484;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1234;
      }
      
      public function get customData() : String
      {
         return this.var_2481;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_579;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2485;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2483;
      }
      
      public function get figure() : String
      {
         return this.var_409;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_629;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_409 = param1.readString();
         this.var_629 = param1.readString();
         this.var_2481 = param1.readString();
         this.var_1234 = param1.readString();
         this.var_2482 = param1.readInteger();
         this.var_2483 = param1.readString();
         this.var_2485 = param1.readInteger();
         this.var_2484 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_999 = param1.readInteger();
         this.var_579 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2482;
      }
      
      public function get respectLeft() : int
      {
         return this.var_999;
      }
   }
}
