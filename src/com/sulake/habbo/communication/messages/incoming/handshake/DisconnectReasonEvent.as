package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1704:int = 5;
      
      public static const const_1621:int = 113;
      
      public static const const_1565:int = 29;
      
      public static const const_1552:int = 0;
      
      public static const const_1533:int = 102;
      
      public static const const_1586:int = 25;
      
      public static const const_1611:int = 20;
      
      public static const const_1607:int = 116;
      
      public static const const_1516:int = 114;
      
      public static const const_1678:int = 101;
      
      public static const const_1675:int = 108;
      
      public static const const_1589:int = 112;
      
      public static const const_1608:int = 100;
      
      public static const const_1654:int = 24;
      
      public static const const_1229:int = 10;
      
      public static const const_1713:int = 111;
      
      public static const const_1553:int = 23;
      
      public static const const_1667:int = 26;
      
      public static const const_1421:int = 2;
      
      public static const const_1513:int = 22;
      
      public static const const_1645:int = 17;
      
      public static const const_1673:int = 18;
      
      public static const const_1719:int = 3;
      
      public static const const_1596:int = 109;
      
      public static const const_1343:int = 1;
      
      public static const const_1664:int = 103;
      
      public static const const_1604:int = 11;
      
      public static const const_1615:int = 28;
      
      public static const const_1641:int = 104;
      
      public static const const_1613:int = 13;
      
      public static const const_1661:int = 107;
      
      public static const const_1559:int = 27;
      
      public static const const_1577:int = 118;
      
      public static const const_1531:int = 115;
      
      public static const const_1721:int = 16;
      
      public static const const_1541:int = 19;
      
      public static const const_1585:int = 4;
      
      public static const const_1555:int = 105;
      
      public static const const_1601:int = 117;
      
      public static const const_1629:int = 119;
      
      public static const const_1517:int = 106;
      
      public static const const_1511:int = 12;
      
      public static const const_1640:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1343:
            case const_1229:
               return "banned";
            case const_1421:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
