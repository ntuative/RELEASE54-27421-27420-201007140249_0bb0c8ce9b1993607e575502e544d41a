package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_600:String = "RWUAM_RESPECT_USER";
      
      public static const const_612:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_589:String = "RWUAM_START_TRADING";
      
      public static const const_553:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_754:String = "RWUAM_WHISPER_USER";
      
      public static const const_751:String = "RWUAM_IGNORE_USER";
      
      public static const const_447:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_592:String = "RWUAM_BAN_USER";
      
      public static const const_726:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_382:String = "RWUAM_KICK_USER";
      
      public static const const_598:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_757:String = " RWUAM_RESPECT_PET";
      
      public static const const_427:String = "RWUAM_KICK_BOT";
      
      public static const const_1207:String = "RWUAM_TRAIN_PET";
      
      public static const const_687:String = "RWUAM_PICKUP_PET";
      
      public static const const_563:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_625:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
