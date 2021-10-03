package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1403:BigInteger;
      
      private var var_687:BigInteger;
      
      private var var_1639:BigInteger;
      
      private var var_1640:BigInteger;
      
      private var var_2195:BigInteger;
      
      private var var_1787:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1403 = param1;
         var_1639 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2195.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1640 = new BigInteger();
         var_1640.fromRadix(param1,param2);
         var_2195 = var_1640.modPow(var_687,var_1403);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1787.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1403.toString() + ",generator: " + var_1639.toString() + ",secret: " + param1);
         var_687 = new BigInteger();
         var_687.fromRadix(param1,param2);
         var_1787 = var_1639.modPow(var_687,var_1403);
         return true;
      }
   }
}
