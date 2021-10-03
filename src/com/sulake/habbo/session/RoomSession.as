package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.messages.outgoing.poll.PollAnswerComposer;
   import com.sulake.habbo.communication.messages.outgoing.poll.PollRejectComposer;
   import com.sulake.habbo.communication.messages.outgoing.poll.PollStartComposer;
   import com.sulake.habbo.communication.messages.outgoing.poll.VoteAnswerMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.register.UpdateFigureDataMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.AssignRightsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.BanUserMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.KickBotMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.KickUserMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.LetUserInMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.RemoveRightsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.avatar.DanceMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.avatar.SignMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.avatar.WaveMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.CancelTypingMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ShoutMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.StartTypingMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.WhisperMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.GetPetCommandsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.RemovePetFromFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.SetClothingChangeDataMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.CreditFurniRedeemMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.PresentOpenMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerChangeStateMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerGetPresetsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerSavePresetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.ChangeQueueMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.OpenConnectionMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.OpenFlatConnectionMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   
   public class RoomSession implements IRoomSession
   {
       
      
      private var var_1273:Boolean = false;
      
      private var var_1858:Boolean = false;
      
      private var var_1276:Boolean = false;
      
      private var _roomId:int = 0;
      
      private var _roomResources:String = "";
      
      private var _connection:IConnection;
      
      private var var_38:String = "RSE_CREATED";
      
      private var var_1060:UserDataManager;
      
      private var var_1274:Boolean = false;
      
      private var _roomCategory:int = 0;
      
      private var var_1275:Boolean = false;
      
      private var _password:String = "";
      
      public function RoomSession(param1:int, param2:int, param3:String = "", param4:String = "")
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         _password = param3;
         _roomResources = param4;
         var_1060 = new UserDataManager();
      }
      
      private function sendOpenFlatConnectionMessage() : Boolean
      {
         if(_connection == null)
         {
            return false;
         }
         _connection.send(new OpenFlatConnectionMessageComposer(_roomId,_password));
         return true;
      }
      
      public function get isTradingRoom() : Boolean
      {
         return var_1276;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1274 = param1;
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_1060.dispose();
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1275;
      }
      
      public function set isTradingRoom(param1:Boolean) : void
      {
         var_1276 = param1;
      }
      
      public function kickUser(param1:int) : void
      {
         _connection.send(new KickUserMessageComposer(param1,roomId,roomCategory));
      }
      
      public function sendWaveMessage() : void
      {
         _connection.send(new WaveMessageComposer());
      }
      
      public function sendPollRejectMessage(param1:int) : void
      {
         _connection.send(new PollRejectComposer(param1));
      }
      
      public function sendPollAnswerMessage(param1:int, param2:int, param3:Array) : void
      {
         _connection.send(new PollAnswerComposer(param1,param2,param3));
      }
      
      public function sendPresentOpenMessage(param1:int) : void
      {
         _connection.send(new PresentOpenMessageComposer(param1));
      }
      
      public function letUserIn(param1:String, param2:Boolean) : void
      {
         _connection.send(new LetUserInMessageComposer(param1,param2));
      }
      
      public function sendPollStartMessage(param1:int) : void
      {
         _connection.send(new PollStartComposer(param1));
      }
      
      public function quit() : void
      {
         if(_connection != null)
         {
            _connection.send(new QuitMessageComposer());
         }
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1275 = param1;
      }
      
      public function changeQueue(param1:int) : void
      {
         if(_connection == null)
         {
            return;
         }
         _connection.send(new ChangeQueueMessageComposer(param1));
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         var_1273 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function reset(param1:int, param2:int) : void
      {
         if(param1 != _roomId || param2 != _roomCategory)
         {
            _roomId = param1;
            _roomCategory = param2;
            var_1274 = false;
            var_1273 = false;
            var_1276 = false;
            var_1275 = false;
         }
      }
      
      public function start() : Boolean
      {
         if(var_38 == RoomSessionEvent.const_356 && _connection != null)
         {
            var_38 = RoomSessionEvent.const_99;
            if(isPrivateRoom)
            {
               return sendOpenFlatConnectionMessage();
            }
            return sendOpenConnectionMessage(_roomId,0,true);
         }
         return false;
      }
      
      public function sendCreditFurniRedeemMessage(param1:int) : void
      {
         _connection.send(new CreditFurniRedeemMessageComposer(param1));
      }
      
      public function get isPrivateRoom() : Boolean
      {
         return _roomCategory == 0;
      }
      
      private function sendOpenConnectionMessage(param1:int, param2:int, param3:Boolean) : Boolean
      {
         if(_connection == null)
         {
            return false;
         }
         _connection.send(new OpenConnectionMessageComposer(param3,param1,param2));
         return true;
      }
      
      public function banUser(param1:int) : void
      {
         _connection.send(new BanUserMessageComposer(param1,roomId,roomCategory));
      }
      
      public function sendRoomDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : void
      {
         var _loc6_:String = "000000" + param3.toString(16).toUpperCase();
         var _loc7_:String = "#" + _loc6_.substr(_loc6_.length - 6);
         _connection.send(new RoomDimmerSavePresetMessageComposer(param1,param2,_loc7_,param4,param5,_roomId,_roomCategory));
      }
      
      public function sendChatTypingMessage(param1:Boolean) : void
      {
         if(param1)
         {
            _connection.send(new StartTypingMessageComposer(_roomId,_roomCategory));
         }
         else
         {
            _connection.send(new CancelTypingMessageComposer(_roomId,_roomCategory));
         }
      }
      
      public function removeRights(param1:int) : void
      {
         var _loc2_:Array = new Array();
         _loc2_.push(param1);
         var _loc3_:RemoveRightsMessageComposer = new RemoveRightsMessageComposer(_loc2_);
         _connection.send(_loc3_);
      }
      
      public function sendDanceMessage(param1:int) : void
      {
         _connection.send(new DanceMessageComposer(param1));
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1274;
      }
      
      public function get state() : String
      {
         return var_38;
      }
      
      public function sendRoomDimmerChangeStateMessage() : void
      {
         _connection.send(new RoomDimmerChangeStateMessageComposer(_roomId,_roomCategory));
      }
      
      public function sendShoutMessage(param1:String) : void
      {
         _connection.send(new ShoutMessageComposer(param1));
      }
      
      public function sendVote(param1:int) : void
      {
         _connection.send(new VoteAnswerMessageComposer(param1));
      }
      
      public function assignRights(param1:int) : void
      {
         _connection.send(new AssignRightsMessageComposer(param1));
      }
      
      public function kickBot(param1:int) : void
      {
         _connection.send(new KickBotMessageComposer(param1));
      }
      
      public function sendRoomDimmerGetPresetsMessage() : void
      {
         _connection.send(new RoomDimmerGetPresetsMessageComposer(_roomId,_roomCategory));
      }
      
      public function requestPetCommands(param1:int) : void
      {
         _connection.send(new GetPetCommandsMessageComposer(param1));
      }
      
      public function set connection(param1:IConnection) : void
      {
         if(param1 == null)
         {
            return;
         }
         _connection = param1;
         if(var_1060 != null)
         {
            var_1060.connection = param1;
         }
      }
      
      public function set arePetsAllowed(param1:Boolean) : void
      {
         var_1858 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return var_1273;
      }
      
      public function sendUpdateClothingChangeFurniture(param1:int, param2:String, param3:String) : void
      {
         if(_connection == null)
         {
            return;
         }
         var _loc4_:* = new SetClothingChangeDataMessageComposer(param1,param2,param3);
         _connection.send(_loc4_);
         _loc4_.dispose();
         _loc4_ = null;
      }
      
      public function sendWhisperMessage(param1:String, param2:String) : void
      {
         _connection.send(new WhisperMessageComposer(param1,param2));
      }
      
      public function get arePetsAllowed() : Boolean
      {
         return var_1858;
      }
      
      public function pickUpPet(param1:int) : void
      {
         _connection.send(new RemovePetFromFlatMessageComposer(param1));
      }
      
      public function get userDataManager() : IUserDataManager
      {
         return var_1060 as IUserDataManager;
      }
      
      public function sendSignMessage(param1:int) : void
      {
         if(param1 >= 0 && param1 <= 14)
         {
            _connection.send(new SignMessageComposer(param1));
         }
      }
      
      public function sendChatMessage(param1:String) : void
      {
         _connection.send(new ChatMessageComposer(param1));
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function sendUpdateFigureData(param1:String, param2:String) : void
      {
         if(_connection == null)
         {
            return;
         }
         var _loc3_:* = new UpdateFigureDataMessageComposer(param1,param2);
         _connection.send(_loc3_);
         _loc3_.dispose();
         _loc3_ = null;
      }
   }
}
