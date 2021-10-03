package com.sulake.habbo.moderation
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.messages.incoming.moderation.CfhChatlogEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.IssueDeletedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.IssueInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.IssuePickFailedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorActionResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorInitMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorRoomInfoEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomChatlogEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitsEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.UserChatlogEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicSpaceCastLibsEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorUserInfoMessageComposer;
   import com.sulake.habbo.communication.messages.parser.moderation.CfhChatlogMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueDeletedMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueInfoMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   import com.sulake.habbo.communication.messages.parser.moderation.ModeratorActionResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitData;
   import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.ModeratorRoomInfoMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.ModeratorUserInfoMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.RoomChatlogMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.RoomVisitsMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.UserChatlogMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.PublicSpaceCastLibsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class ModerationMessageHandler
   {
       
      
      private var var_946:Array;
      
      private var var_948:Array;
      
      private var var_947:Array;
      
      private var var_790:Array;
      
      private var var_949:Array;
      
      private var var_59:ModerationManager;
      
      private var _connection:IConnection;
      
      public function ModerationMessageHandler(param1:ModerationManager)
      {
         var_949 = new Array();
         var_946 = new Array();
         var_948 = new Array();
         var_947 = new Array();
         var_790 = new Array();
         super();
         var_59 = param1;
         _connection = param1.connection;
         _connection.addMessageEvent(new IssueInfoMessageEvent(onIssueInfo));
         _connection.addMessageEvent(new ModeratorInitMessageEvent(onModeratorInit));
         _connection.addMessageEvent(new IssuePickFailedMessageEvent(onIssuePickFailed));
         _connection.addMessageEvent(new IssueDeletedMessageEvent(onIssueDeleted));
         _connection.addMessageEvent(new ModeratorUserInfoEvent(onUserInfo));
         _connection.addMessageEvent(new ModeratorRoomInfoEvent(onRoomInfo));
         _connection.addMessageEvent(new CfhChatlogEvent(onCfhChatlog));
         _connection.addMessageEvent(new UserChatlogEvent(onUserChatlog));
         _connection.addMessageEvent(new RoomChatlogEvent(onRoomChatlog));
         _connection.addMessageEvent(new RoomVisitsEvent(onRoomVisits));
         _connection.addMessageEvent(new RoomEntryInfoMessageEvent(onRoomEnter));
         _connection.addMessageEvent(new PublicSpaceCastLibsEvent(onPublicSpaceCastLibs));
         _connection.addMessageEvent(new CloseConnectionMessageEvent(onRoomExit));
         _connection.addMessageEvent(new ModeratorActionResultMessageEvent(onModeratorActionResult));
      }
      
      public function removeRoomInfoListener(param1:RoomToolCtrl) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_947)
         {
            if(_loc3_ != param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         var_947 = _loc2_;
      }
      
      public function addRoomVisitsListener(param1:RoomVisitsCtrl) : void
      {
         var_946.push(param1);
      }
      
      private function onCfhChatlog(param1:CfhChatlogEvent) : void
      {
         var _loc2_:CfhChatlogMessageParser = param1.getParser();
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_.data.room);
         var _loc4_:Dictionary = new Dictionary();
         _loc4_[_loc2_.data.callerUserId] = "yes";
         _loc4_[_loc2_.data.reportedUserId] = "yes";
         onChatlog("Call For Help Chatlog: " + _loc2_.data.chatRecordId,WindowTracker.const_987,_loc2_.data.callId,_loc3_,_loc4_);
      }
      
      private function onIssueInfo(param1:IssueInfoMessageEvent) : void
      {
         if(param1 == null || var_59 == null)
         {
            return;
         }
         var _loc2_:IssueInfoMessageParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IssueMessageData = _loc2_.issueData;
         var_59.issueManager.playSound(_loc3_);
         var_59.issueManager.updateIssue(_loc3_);
         var_59.issueManager.updatePriorities();
      }
      
      private function onUserChatlog(param1:UserChatlogEvent) : void
      {
         var _loc2_:UserChatlogMessageParser = param1.getParser();
         var _loc3_:Dictionary = new Dictionary();
         _loc3_[_loc2_.data.userId] = "yes";
         onChatlog("User Chatlog: " + _loc2_.data.userName,WindowTracker.const_1001,_loc2_.data.userId,_loc2_.data.rooms,_loc3_);
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function onPublicSpaceCastLibs(param1:PublicSpaceCastLibsEvent) : void
      {
         var _loc2_:PublicSpaceCastLibsMessageParser = param1.getParser();
         this.var_59.startPanel.publicSpaceEntered(_loc2_);
      }
      
      private function onChatlog(param1:String, param2:int, param3:int, param4:Array, param5:Dictionary) : void
      {
         var _loc6_:* = null;
         for each(_loc6_ in var_948)
         {
            _loc6_.onChatlog(param1,param2,param3,param4,param5);
         }
      }
      
      private function onRoomVisits(param1:RoomVisitsEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:RoomVisitsMessageParser = param1.getParser();
         for each(_loc3_ in var_946)
         {
            _loc3_.onRoomVisits(_loc2_.data);
         }
      }
      
      private function onModeratorInit(param1:ModeratorInitMessageEvent) : void
      {
         var _loc6_:* = null;
         if(param1 == null || var_59 == null)
         {
            return;
         }
         var _loc2_:ModeratorInitMessageParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ModeratorInitData = _loc2_.data;
         var _loc4_:Array = _loc3_.issues;
         var _loc5_:Array = _loc3_.messageTemplates;
         for each(_loc6_ in _loc4_)
         {
            var_59.issueManager.updateIssue(_loc6_);
         }
         var_59.issueManager.updatePriorities();
         var_59.initMsg = _loc3_;
         var_59.startPanel.show();
      }
      
      private function onUserInfo(param1:ModeratorUserInfoEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:ModeratorUserInfoMessageParser = param1.getParser();
         Logger.log("GOT USER INFO: " + _loc2_.data.userId + ", " + _loc2_.data.cautionCount);
         for each(_loc3_ in var_949)
         {
            _loc3_.onUserInfo(_loc2_.data);
         }
      }
      
      public function removeChatlogListener(param1:ChatlogCtrl) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_948)
         {
            if(_loc3_ != param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         var_948 = _loc2_;
      }
      
      private function onRoomEnter(param1:RoomEntryInfoMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:RoomEntryInfoMessageParser = param1.getParser();
         if(_loc2_.guestRoom)
         {
            this.var_59.currentFlatId = _loc2_.guestRoomId;
            this.var_59.startPanel.guestRoomEntered(_loc2_);
         }
         else
         {
            this.var_59.currentFlatId = 0;
         }
         for each(_loc3_ in var_790)
         {
            _loc3_.onRoomChange();
         }
      }
      
      private function onIssuePickFailed(param1:IssuePickFailedMessageEvent) : void
      {
         var event:IssuePickFailedMessageEvent = param1;
         var_59.windowManager.alert("Error","Issue picking failed",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function removeUserInfoListener(param1:UserInfoCtrl) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_949)
         {
            if(_loc3_ != param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         var_949 = _loc2_;
      }
      
      public function addChatlogListener(param1:ChatlogCtrl) : void
      {
         var_948.push(param1);
      }
      
      private function onRoomInfo(param1:ModeratorRoomInfoEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:ModeratorRoomInfoMessageParser = param1.getParser();
         for each(_loc3_ in var_947)
         {
            _loc3_.onRoomInfo(_loc2_.data);
         }
      }
      
      public function removeRoomEnterListener(param1:RoomToolCtrl) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_790)
         {
            if(_loc3_ != param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         var_790 = _loc2_;
      }
      
      private function onRoomExit(param1:CloseConnectionMessageEvent) : void
      {
         var _loc2_:* = null;
         this.var_59.currentFlatId = 0;
         this.var_59.startPanel.roomExited();
         for each(_loc2_ in var_790)
         {
            _loc2_.onRoomChange();
         }
      }
      
      private function onRoomChatlog(param1:RoomChatlogEvent) : void
      {
         var _loc2_:RoomChatlogMessageParser = param1.getParser();
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_.data);
         var _loc4_:Dictionary = new Dictionary();
         onChatlog("Room Chatlog: " + _loc2_.data.roomName,WindowTracker.const_664,_loc2_.data.roomId,_loc3_,_loc4_);
      }
      
      public function addUserInfoListener(param1:UserInfoCtrl) : void
      {
         var_949.push(param1);
      }
      
      public function addRoomEnterListener(param1:RoomToolCtrl) : void
      {
         var_790.push(param1);
      }
      
      private function onModeratorActionResult(param1:ModeratorActionResultMessageEvent) : void
      {
         var _loc2_:ModeratorActionResultMessageParser = param1.getParser();
         Logger.log("GOT MOD ACTION RESULT: " + _loc2_.userId + ", " + _loc2_.success);
         if(_loc2_.success)
         {
            var_59.connection.send(new GetModeratorUserInfoMessageComposer(_loc2_.userId));
         }
         else
         {
            var_59.windowManager.alert("Alert","Moderation action failed",0,onAlertClose);
         }
      }
      
      public function removeRoomVisitsListener(param1:RoomVisitsCtrl) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_946)
         {
            if(_loc3_ != param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         var_946 = _loc2_;
      }
      
      public function addRoomInfoListener(param1:RoomToolCtrl) : void
      {
         var_947.push(param1);
      }
      
      private function onIssueDeleted(param1:IssueDeletedMessageEvent) : void
      {
         if(param1 == null || var_59 == null)
         {
            return;
         }
         var _loc2_:IssueDeletedMessageParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_59.issueManager.removeIssue(_loc2_.issueId);
      }
   }
}
