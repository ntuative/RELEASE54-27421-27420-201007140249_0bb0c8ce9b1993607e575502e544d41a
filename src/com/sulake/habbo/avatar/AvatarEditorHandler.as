package com.sulake.habbo.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.avatar.WardrobeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.GetWardrobeMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.SaveWardrobeOutfitMessageComposer;
   
   public class AvatarEditorHandler
   {
       
      
      private var _communication:IHabboCommunicationManager;
      
      private var _controller:HabboAvatarEditor;
      
      public function AvatarEditorHandler(param1:HabboAvatarEditor, param2:IHabboCommunicationManager)
      {
         super();
         _controller = param1;
         _communication = param2;
         _communication.addHabboConnectionMessageEvent(new WardrobeMessageEvent(onWardrobe));
         _communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(onUserRights));
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         _controller.update();
      }
      
      public function getWardrobe() : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc1_:* = new GetWardrobeMessageComposer();
         _communication.getHabboMainConnection(null).send(_loc1_);
         _loc1_.dispose();
         _loc1_ = null;
      }
      
      private function onWardrobe(param1:WardrobeMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(_controller && false)
         {
            _controller.wardrobe.updateSlots(param1.state,param1.outfits);
         }
      }
      
      public function saveWardrobeOutfit(param1:int, param2:IOutfit) : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc3_:* = new SaveWardrobeOutfitMessageComposer(param1,param2.figure,param2.gender);
         _communication.getHabboMainConnection(null).send(_loc3_);
         _loc3_.dispose();
         _loc3_ = null;
      }
      
      public function dispose() : void
      {
         _communication = null;
         _controller = null;
      }
   }
}
