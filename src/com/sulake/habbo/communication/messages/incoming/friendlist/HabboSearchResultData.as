package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2463:Boolean;
      
      private var var_2462:int;
      
      private var var_2465:Boolean;
      
      private var var_1539:String;
      
      private var var_1234:String;
      
      private var var_2116:int;
      
      private var var_1862:String;
      
      private var var_2464:String;
      
      private var var_1861:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2116 = param1.readInteger();
         this.var_1539 = param1.readString();
         this.var_1862 = param1.readString();
         this.var_2463 = param1.readBoolean();
         this.var_2465 = param1.readBoolean();
         param1.readString();
         this.var_2462 = param1.readInteger();
         this.var_1861 = param1.readString();
         this.var_2464 = param1.readString();
         this.var_1234 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1234;
      }
      
      public function get avatarName() : String
      {
         return this.var_1539;
      }
      
      public function get avatarId() : int
      {
         return this.var_2116;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2463;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2464;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1861;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2465;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1862;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2462;
      }
   }
}
