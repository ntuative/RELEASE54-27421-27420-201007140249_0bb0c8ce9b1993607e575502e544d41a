package com.sulake.habbo.messenger.domain
{
   import com.sulake.habbo.messenger.Util;
   
   public class Conversations
   {
      
      private static var var_1300:int = 1;
       
      
      private var _closedConversations:Array;
      
      private var var_420:IConversationsDeps;
      
      private var var_131:Array;
      
      private var _startIndex:int;
      
      public function Conversations(param1:IConversationsDeps)
      {
         var_131 = new Array();
         _closedConversations = new Array();
         super();
         var_420 = param1;
      }
      
      public function addConversation(param1:int) : Conversation
      {
         var _loc2_:Boolean = false && false;
         var _loc3_:Conversation = addConversationInt(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         if(false)
         {
            var_131[0].setSelected(true);
         }
         if(_loc2_)
         {
            _loc3_.addMessage(new Message(Message.const_758,0,var_420.getText("messenger.moderationinfo"),""));
         }
         return _loc3_;
      }
      
      private function addConversationInt(param1:int) : Conversation
      {
         var _loc2_:Conversation = findConversation(param1);
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         _loc2_ = findClosedConversation(param1);
         if(_loc2_ != null)
         {
            Util.remove(_closedConversations,_loc2_);
            var_131.push(_loc2_);
            return _loc2_;
         }
         _loc2_ = var_420.createConversation(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var_131.push(_loc2_);
         return _loc2_;
      }
      
      private function fixStartIndex() : void
      {
         _startIndex = Math.min(_startIndex,0 - var_420.getTabCount());
         _startIndex = Math.max(0,_startIndex);
      }
      
      public function get startIndex() : int
      {
         return _startIndex;
      }
      
      private function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_131)
         {
            _loc1_.setSelected(false);
         }
      }
      
      private function getOnlineText(param1:Boolean) : String
      {
         return var_420.getText(!!param1 ? "messenger.notification.online" : "messenger.notification.offline");
      }
      
      public function findSelectedConversation() : Conversation
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_131)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function method_8() : void
      {
         var _loc1_:Conversation = findSelectedConversation();
         var _loc2_:int = var_131.indexOf(_loc1_);
         Util.remove(var_131,_loc1_);
         _closedConversations.push(_loc1_);
         _loc1_.setSelected(false);
         while(_loc2_ >= 0)
         {
            if(false)
            {
               var_131[_loc2_].setSelected(true);
               break;
            }
            _loc2_--;
         }
         fixStartIndex();
      }
      
      public function findConversation(param1:int) : Conversation
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_131)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function setSelected(param1:Conversation) : void
      {
         clearSelections();
         param1.setSelected(true);
         var _loc2_:int = var_131.indexOf(param1);
         while(_startIndex + var_420.getTabCount() <= _loc2_)
         {
            ++_startIndex;
         }
      }
      
      public function setOnlineStatusAndUpdateView(param1:int, param2:Boolean) : void
      {
         var _loc3_:Conversation = findConversation(param1);
         if(_loc3_ == null)
         {
            _loc3_ = findClosedConversation(param1);
         }
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Message = getOnlineInfoMsg(param2);
         _loc3_.addMessage(_loc4_);
         var_420.addMsgToView(_loc3_,_loc4_);
      }
      
      public function changeStartIndex(param1:int) : void
      {
         _startIndex += param1;
      }
      
      public function get openConversations() : Array
      {
         return var_131;
      }
      
      private function findClosedConversation(param1:int) : Conversation
      {
         var _loc2_:* = null;
         for each(_loc2_ in _closedConversations)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function getOnlineInfoMsg(param1:Boolean) : Message
      {
         return new Message(Message.const_572,0,getOnlineText(param1),Util.getFormattedNow());
      }
      
      public function setFollowingAllowedAndUpdateView(param1:int, param2:Boolean) : void
      {
         var _loc3_:Conversation = findConversation(param1);
         if(_loc3_ == null)
         {
            _loc3_ = findClosedConversation(param1);
         }
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.followingAllowed = param2;
         if(_loc3_.selected)
         {
            var_420.refresh(false);
         }
      }
      
      public function addTestUser() : void
      {
         this.addConversation(var_1300++);
      }
      
      public function addMessageAndUpdateView(param1:Message) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Conversation = addConversation(param1.senderId);
         if(_loc3_ == null)
         {
            Logger.log("Received message from non friend " + param1.senderId + ". Ignoring");
            return;
         }
         var _loc4_:Boolean = _loc3_.newMessageArrived;
         _loc3_.setNewMessageArrived(true);
         _loc3_.addMessage(param1);
         var_420.addMsgToView(_loc3_,param1);
         if(_loc2_ != var_131.length || _loc4_ != _loc3_.newMessageArrived)
         {
            var_420.refresh(false);
         }
      }
   }
}
