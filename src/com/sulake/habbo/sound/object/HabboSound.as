package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1077:SoundChannel = null;
      
      private var var_877:Boolean;
      
      private var var_1078:Sound = null;
      
      private var var_795:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1078 = param1;
         var_1078.addEventListener(Event.COMPLETE,onComplete);
         var_795 = 1;
         var_877 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_877;
      }
      
      public function stop() : Boolean
      {
         var_1077.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_877 = false;
         var_1077 = var_1078.play(0);
         this.volume = var_795;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_795;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1077.position;
      }
      
      public function get length() : Number
      {
         return var_1078.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_795 = param1;
         if(var_1077 != null)
         {
            var_1077.soundTransform = new SoundTransform(var_795);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_877 = true;
      }
   }
}
