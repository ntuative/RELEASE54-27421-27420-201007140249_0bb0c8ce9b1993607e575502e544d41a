package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.AcceptBuddyMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.DeclineBuddyMessageComposer;
   import com.sulake.habbo.friendlist.domain.FriendListTab;
   import com.sulake.habbo.friendlist.domain.FriendRequest;
   import com.sulake.habbo.friendlist.events.FriendRequestEvent;
   
   public class FriendRequestsView implements ITabView, IFriendRequestsView
   {
      
      private static const const_1488:String = "no_reqs_info";
       
      
      private var var_1621:IContainerButtonWindow;
      
      private var _friendList:HabboFriendList;
      
      private var var_1622:IContainerButtonWindow;
      
      private var var_51:IItemListWindow;
      
      public function FriendRequestsView()
      {
         super();
      }
      
      public function fillList(param1:IItemListWindow) : void
      {
         var _loc2_:* = null;
         var_51 = param1;
         for each(_loc2_ in _friendList.friendRequests.requests)
         {
            getRequestEntry(_loc2_);
            refreshRequestEntry(_loc2_);
            param1.addListItem(_loc2_.view);
         }
         _friendList.friendRequests.refreshShading();
      }
      
      private function onAcceptAllButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         _friendList.view.showInfo(param1,"${friendlist.tip.acceptall}");
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Accept all clicked");
         if(_friendList.categories.getFriendCount(false) + _friendList.friendRequests.requests.length > _friendList.friendRequests.limit)
         {
            _friendList.showLimitReachedAlert();
            return;
         }
         var _loc3_:AcceptBuddyMessageComposer = new AcceptBuddyMessageComposer();
         for each(_loc4_ in _friendList.friendRequests.requests)
         {
            if(_loc4_.state != FriendRequest.const_312 && _loc4_.state != FriendRequest.const_328)
            {
               _loc3_.addAcceptedRequest(_loc4_.requestId);
               _loc4_.state = FriendRequest.const_312;
               refreshRequestEntry(_loc4_);
               if(_friendList && false)
               {
                  _friendList.events.dispatchEvent(new FriendRequestEvent(FriendRequestEvent.const_53,_loc4_.requestId));
               }
            }
         }
         _friendList.send(_loc3_);
         refresh();
      }
      
      public function fillFooter(param1:IWindowContainer) : void
      {
         var_1621 = IContainerButtonWindow(param1.findChildByName("accept_all_but"));
         var_1622 = IContainerButtonWindow(param1.findChildByName("reject_all_but"));
         var_1622.procedure = onDismissAllButtonClick;
         var_1621.procedure = onAcceptAllButtonClick;
         refreshButtons();
      }
      
      private function setEnabled(param1:IContainerButtonWindow, param2:Boolean) : void
      {
         if(!param1)
         {
            return;
         }
         if(param2)
         {
            param1.enable();
         }
         else
         {
            param1.disable();
         }
      }
      
      private function onDismissAllButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         _friendList.view.showInfo(param1,"${friendlist.tip.declineall}");
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Dismiss all clicked");
         var _loc3_:DeclineBuddyMessageComposer = new DeclineBuddyMessageComposer();
         _friendList.send(_loc3_);
         for each(_loc4_ in _friendList.friendRequests.requests)
         {
            if(_loc4_.state != FriendRequest.const_312 && _loc4_.state != FriendRequest.const_328)
            {
               _loc4_.state = FriendRequest.const_328;
               refreshRequestEntry(_loc4_);
               if(_friendList && false)
               {
                  _friendList.events.dispatchEvent(new FriendRequestEvent(FriendRequestEvent.const_262,_loc4_.requestId));
               }
            }
         }
         refresh();
      }
      
      public function init(param1:HabboFriendList) : void
      {
         _friendList = param1;
      }
      
      public function refreshShading(param1:FriendRequest, param2:Boolean) : void
      {
         if(var_51 == null)
         {
            return;
         }
         param1.view.color = _friendList.laf.getRowShadingColor(FriendListTab.const_89,param2);
         setButtonBg(param1.view,"reject");
         setButtonBg(param1.view,"accept");
      }
      
      private function setButtonBg(param1:IWindowContainer, param2:String) : void
      {
         var _loc3_:IWindow = param1.findChildByName(param2);
         if(_loc3_ != null)
         {
            _loc3_.color = param1.color;
         }
      }
      
      private function refresh() : void
      {
         refreshButtons();
         _friendList.refreshToolBarIcon();
      }
      
      private function onDeclineButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         _friendList.view.showInfo(param1,"${friendlist.tip.decline}");
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("decline clicked: " + _loc3_);
         declineRequest(_loc3_);
      }
      
      private function getRequestEntry(param1:FriendRequest) : void
      {
         var _loc2_:IWindowContainer = IWindowContainer(_friendList.getXmlWindow("friend_request_entry"));
         param1.view = _loc2_;
      }
      
      public function tabClicked(param1:int) : void
      {
         if(var_51 == null)
         {
            return;
         }
         _friendList.friendRequests.clearAndUpdateView(true);
      }
      
      public function refreshRequestEntry(param1:FriendRequest) : void
      {
         if(var_51 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = param1.view;
         Util.hideChildren(_loc2_);
         _friendList.refreshText(_loc2_,"requester_name_text",true,param1.requesterName);
         if(param1.state == FriendRequest.const_150)
         {
            _friendList.refreshIcon(_loc2_,"accept",true,onAcceptButtonClick,param1.requestId);
            _friendList.refreshIcon(_loc2_,"reject",true,onDeclineButtonClick,param1.requestId);
         }
         else if(param1.state == FriendRequest.const_312)
         {
            _friendList.refreshText(_loc2_,"info_text",true,"${friendlist.request.accepted}");
         }
         else if(param1.state == FriendRequest.const_328)
         {
            _friendList.refreshText(_loc2_,"info_text",true,"${friendlist.request.declined}");
         }
         else if(param1.state == FriendRequest.const_933)
         {
            _friendList.refreshText(_loc2_,"info_text",true,"${friendlist.request.failed}");
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = _friendList.friendRequests.getCountOfOpenRequests() > 0;
         setEnabled(var_1621,_loc1_);
         setEnabled(var_1622,_loc1_);
      }
      
      public function acceptRequest(param1:int) : void
      {
         var _loc2_:FriendRequest = _friendList.friendRequests.getRequest(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.state = FriendRequest.const_312;
         if(_friendList.categories.getFriendCount(false) >= _friendList.friendRequests.limit)
         {
            _friendList.showLimitReachedAlert();
            return;
         }
         var _loc3_:AcceptBuddyMessageComposer = new AcceptBuddyMessageComposer();
         _loc3_.addAcceptedRequest(_loc2_.requestId);
         _friendList.send(_loc3_);
         refreshRequestEntry(_loc2_);
         refresh();
         if(_friendList && false)
         {
            _friendList.events.dispatchEvent(new FriendRequestEvent(FriendRequestEvent.const_53,param1));
         }
      }
      
      public function removeRequest(param1:FriendRequest) : void
      {
         if(var_51 == null)
         {
            return;
         }
         var_51.removeListItem(param1.view);
         refreshButtons();
      }
      
      public function addRequest(param1:FriendRequest) : void
      {
         if(var_51 == null)
         {
            return;
         }
         getRequestEntry(param1);
         refreshRequestEntry(param1);
         var_51.addListItem(param1.view);
         _friendList.friendRequests.refreshShading();
         refreshButtons();
      }
      
      private function onAcceptButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         _friendList.view.showInfo(param1,"${friendlist.tip.accept}");
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("accept clicked: " + _loc3_);
         acceptRequest(_loc3_);
      }
      
      public function getEntryCount() : int
      {
         return _friendList.friendRequests.getCountOfOpenRequests();
      }
      
      public function declineRequest(param1:int) : void
      {
         var _loc2_:FriendRequest = _friendList.friendRequests.getRequest(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.state = FriendRequest.const_328;
         var _loc3_:DeclineBuddyMessageComposer = new DeclineBuddyMessageComposer();
         _loc3_.addDeclinedRequest(param1);
         _friendList.send(_loc3_);
         refreshRequestEntry(_loc2_);
         refresh();
         if(_friendList && false)
         {
            _friendList.events.dispatchEvent(new FriendRequestEvent(FriendRequestEvent.const_262,param1));
         }
      }
   }
}
