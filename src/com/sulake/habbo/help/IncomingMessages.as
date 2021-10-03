package com.sulake.habbo.help
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.help.CallForHelpPendingCallsDeletedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.CallForHelpReplyMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.CallForHelpResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.FaqCategoriesMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.FaqCategoryMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.FaqClientFaqsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.FaqSearchResultsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.FaqTextMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.HotelMergeNameChangeEvent;
   import com.sulake.habbo.communication.messages.incoming.help.IssueCloseNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.help.TutorialStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GetGuestRoomResultEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserMessageData;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UsersMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.CallForHelpReplyMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.CallForHelpResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.FaqCategoriesMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.FaqCategoryMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.FaqClientFaqsMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.FaqSearchResultsMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.FaqTextMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.IssueCloseNotificationMessageParser;
   import com.sulake.habbo.communication.messages.parser.help.TutorialStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.help.enum.CallForHelpResultEnum;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.data.FaqCategory;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.help.data.FaqItem;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class IncomingMessages
   {
       
      
      private var _userId:int = -1;
      
      private var var_1731:int = -1;
      
      private var var_25:HabboHelp;
      
      public function IncomingMessages(param1:HabboHelp, param2:IHabboCommunicationManager)
      {
         super();
         var_25 = param1;
         var _loc3_:IHabboCommunicationManager = param2;
         _loc3_.addHabboConnectionMessageEvent(new CallForHelpReplyMessageEvent(onCallForHelpReply));
         _loc3_.addHabboConnectionMessageEvent(new CallForHelpResultMessageEvent(onCallForHelpResult));
         _loc3_.addHabboConnectionMessageEvent(new CallForHelpPendingCallsDeletedMessageEvent(onPendingCallsForHelpDeleted));
         _loc3_.addHabboConnectionMessageEvent(new FaqClientFaqsMessageEvent(onFaqClientFaqs));
         _loc3_.addHabboConnectionMessageEvent(new FaqCategoriesMessageEvent(onFaqCategories));
         _loc3_.addHabboConnectionMessageEvent(new FaqTextMessageEvent(onFaqText));
         _loc3_.addHabboConnectionMessageEvent(new FaqSearchResultsMessageEvent(onFaqSearchResults));
         _loc3_.addHabboConnectionMessageEvent(new FaqCategoryMessageEvent(onFaqCategory));
         _loc3_.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(onRoomEntryInfo));
         _loc3_.addHabboConnectionMessageEvent(new RoomReadyMessageEvent(onRoomReady));
         _loc3_.addHabboConnectionMessageEvent(new GetGuestRoomResultEvent(onGuestRoomResult));
         _loc3_.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
         _loc3_.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(onUserNameChange));
         _loc3_.addHabboConnectionMessageEvent(new UserChangeMessageEvent(onUserChange));
         _loc3_.addHabboConnectionMessageEvent(new UsersMessageEvent(onUsers));
         _loc3_.addHabboConnectionMessageEvent(new IssueCloseNotificationMessageEvent(onIssueClose));
         _loc3_.addHabboConnectionMessageEvent(new TutorialStatusMessageEvent(onTutorialStatus));
         _loc3_.addHabboConnectionMessageEvent(new ChangeUserNameResultMessageEvent(onChangeUserNameResult));
         _loc3_.addHabboConnectionMessageEvent(new CheckUserNameResultMessageEvent(onCheckUserNameResult));
         _loc3_.addHabboConnectionMessageEvent(new HotelMergeNameChangeEvent(onHotelMergeNameChange));
      }
      
      private function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(!var_25)
         {
            return;
         }
         if(false)
         {
            var_25.tutorialUI.onChangeUserNameResult(param1);
         }
         if(false)
         {
            var_25.hotelMergeUI.onChangeUserNameResult(param1);
         }
      }
      
      private function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!var_25)
         {
            return;
         }
         if(false)
         {
            var_25.tutorialUI.onCheckUserNameResult(param1);
         }
         if(false)
         {
            var_25.hotelMergeUI.onCheckUserNameResult(param1);
         }
      }
      
      private function onFaqText(param1:IMessageEvent) : void
      {
         var _loc2_:FaqTextMessageParser = FaqTextMessageEvent(param1).getParser();
         var _loc3_:FaqIndex = var_25.getFaq();
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.storeAnswerText(_loc2_.questionId,_loc2_.answerText);
         var _loc4_:FaqItem = _loc3_.getItem(_loc2_.questionId);
         if(_loc4_ != null)
         {
            var_25.tellUI(HabboHelpViewEnum.const_231,_loc4_);
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageParser = UserNameChangedMessageEvent(param1).getParser();
         if(_userId != _loc2_.webId)
         {
            return;
         }
         var_25.ownUserName = _loc2_.newName;
         if(false)
         {
            var_25.tutorialUI.onUserNameChanged(_loc2_.newName);
         }
         if(false)
         {
            var_25.hotelMergeUI.onUserNameChanged(_loc2_.newName);
         }
      }
      
      private function onRoomEntryInfo(param1:IMessageEvent) : void
      {
         var _loc2_:RoomEntryInfoMessageParser = RoomEntryInfoMessageEvent(param1).getParser();
         if(_loc2_.guestRoom && _loc2_.owner)
         {
            var_25.enableCallForGuideBotUI();
         }
         else
         {
            var_25.disableCallForGuideBotUI();
         }
      }
      
      private function onCallForHelpResult(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:CallForHelpResultMessageParser = CallForHelpResultMessageEvent(param1).getParser();
         var _loc3_:int = _loc2_.resultType;
         switch(_loc3_)
         {
            case 1:
               _loc4_ = "null";
               break;
            case 2:
               _loc4_ = "null";
               break;
            default:
               _loc4_ = "null";
         }
         var_25.showCallForHelpResult(_loc4_);
      }
      
      private function onFaqCategory(param1:IMessageEvent) : void
      {
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc2_:FaqCategoryMessageParser = FaqCategoryMessageEvent(param1).getParser();
         var _loc3_:FaqIndex = var_25.getFaq();
         var _loc4_:Map = _loc2_.data;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:int = _loc2_.categoryId;
         var _loc6_:FaqCategory = _loc3_.getCategory(_loc5_);
         if(_loc6_ == null)
         {
            return;
         }
         _loc6_.description = _loc2_.description;
         _loc6_.setTimeStamp();
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc8_ = _loc4_.getKey(_loc7_);
            _loc9_ = _loc4_.getWithIndex(_loc7_);
            _loc6_.storeItem(_loc8_,_loc9_);
            _loc7_++;
         }
         var_25.tellUI(HabboHelpViewEnum.const_268,_loc6_);
      }
      
      private function getCloseReasonKey(param1:int) : String
      {
         if(param1 == 1)
         {
            return "useless";
         }
         if(param1 == 2)
         {
            return "abusive";
         }
         return "resolved";
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = UserChangeMessageEvent(param1);
         if(var_1731 != _loc2_.id)
         {
            return;
         }
         if(var_25 == null || true)
         {
            return;
         }
         var_25.tutorialUI.onUserChanged();
      }
      
      private function onCallForHelpReply(param1:IMessageEvent) : void
      {
         var _loc2_:CallForHelpReplyMessageParser = CallForHelpReplyMessageEvent(param1).getParser();
         var_25.showCallForHelpReply(_loc2_.message);
      }
      
      private function onIssueClose(param1:IMessageEvent) : void
      {
         var _loc2_:IssueCloseNotificationMessageEvent = param1 as IssueCloseNotificationMessageEvent;
         var _loc3_:IssueCloseNotificationMessageParser = _loc2_.getParser();
         var_25.windowManager.alert("${mod.alert.title}","${help.cfh.closed." + getCloseReasonKey(_loc3_.closeReason) + "}",0,onAlertClose);
      }
      
      private function onFaqClientFaqs(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc2_:FaqClientFaqsMessageParser = FaqClientFaqsMessageEvent(param1).getParser();
         var _loc3_:FaqIndex = var_25.getFaq();
         var _loc4_:Map = _loc2_.urgentData;
         var _loc5_:Map = _loc2_.normalData;
         if(_loc3_ == null || _loc4_ == null || _loc5_ == null)
         {
            return;
         }
         _loc6_ = _loc3_.getFrontPageUrgentCategory();
         _loc6_.reset();
         _loc6_.setTimeStamp();
         _loc7_ = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc6_.storeItem(_loc4_.getKey(_loc7_),_loc4_.getWithIndex(_loc7_));
            _loc7_++;
         }
         _loc6_ = _loc3_.getFrontPageNormalCategory();
         _loc6_.reset();
         _loc6_.setTimeStamp();
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc6_.storeItem(_loc5_.getKey(_loc7_),_loc5_.getWithIndex(_loc7_));
            _loc7_++;
         }
         var_25.tellUI(HabboHelpViewEnum.const_151);
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectMessageParser = UserObjectEvent(param1).getParser();
         _userId = _loc2_.id;
         var_25.ownUserName = _loc2_.name;
      }
      
      private function onPendingCallsForHelpDeleted(param1:IMessageEvent) : void
      {
         var_25.showUI(HabboHelpViewEnum.const_332);
      }
      
      private function onTutorialStatus(param1:IMessageEvent) : void
      {
         if(var_25 == null)
         {
            return;
         }
         var _loc2_:TutorialStatusMessageParser = (param1 as TutorialStatusMessageEvent).getParser();
         var_25.updateTutorial(_loc2_.hasChangedLooks,_loc2_.hasChangedName,_loc2_.hasCalledGuideBot);
      }
      
      private function onRoomReady(param1:IMessageEvent) : void
      {
         var _loc2_:RoomReadyMessageParser = RoomReadyMessageEvent(param1).getParser();
         if(_loc2_.roomType.indexOf("model_") == 0)
         {
            return;
         }
         var _loc3_:* = "nav_venue_" + _loc2_.roomType + "/" + 0 + "_name";
         var_25.userRegistry.registerRoom(var_25.localization.getKey(_loc3_));
      }
      
      private function onGuestRoomResult(param1:IMessageEvent) : void
      {
         var _loc2_:GetGuestRoomResultMessageParser = GetGuestRoomResultEvent(param1).getParser();
         var_25.userRegistry.registerRoom(_loc2_.data.roomName);
      }
      
      private function onFaqCategories(param1:IMessageEvent) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc2_:FaqCategoriesMessageParser = FaqCategoriesMessageEvent(param1).getParser();
         var _loc3_:FaqIndex = var_25.getFaq();
         var _loc4_:Map = _loc2_.data;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_.getKey(_loc5_);
            _loc7_ = _loc4_.getWithIndex(_loc5_);
            _loc8_ = _loc7_.getValue("name");
            _loc9_ = _loc3_.getCategory(_loc6_,_loc8_,true);
            _loc9_.itemCount = _loc7_.getValue("count");
            _loc5_++;
         }
         var_25.showUI(HabboHelpViewEnum.const_462);
      }
      
      private function onHotelMergeNameChange(param1:HotelMergeNameChangeEvent) : void
      {
         if(!var_25)
         {
            return;
         }
         var_25.initHotelMergeUI();
      }
      
      private function onFaqSearchResults(param1:IMessageEvent) : void
      {
         var _loc2_:FaqSearchResultsMessageParser = FaqSearchResultsMessageEvent(param1).getParser();
         var _loc3_:FaqIndex = var_25.getFaq();
         var _loc4_:Map = _loc2_.data;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:FaqCategory = _loc3_.getSearchResultCategory();
         _loc5_.reset();
         _loc5_.setTimeStamp();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc5_.storeItem(_loc4_.getKey(_loc6_),_loc4_.getWithIndex(_loc6_));
            _loc6_++;
         }
         var_25.showUI(HabboHelpViewEnum.const_558);
         var_25.tellUI(HabboHelpViewEnum.const_558,_loc5_);
      }
      
      private function onUsers(param1:IMessageEvent) : void
      {
         var _loc5_:* = null;
         var _loc2_:UsersMessageEvent = param1 as UsersMessageEvent;
         var _loc3_:UsersMessageParser = _loc2_.getParser();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.getUserCount())
         {
            _loc5_ = _loc3_.getUser(_loc4_);
            if(_loc5_.webID != _userId && _loc5_.userType == RoomObjectTypeEnum.const_310)
            {
               var_25.userRegistry.registerUser(_loc5_.webID,_loc5_.name);
            }
            if(_loc5_.webID == _userId)
            {
               var_1731 = _loc5_.id;
            }
            _loc4_++;
         }
         var_25.tellUI(HabboHelpViewEnum.const_631);
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
   }
}
