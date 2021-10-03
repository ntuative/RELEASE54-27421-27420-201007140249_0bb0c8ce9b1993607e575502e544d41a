package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.events.EventDispatcher;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_724:int = 8;
      
      public static const const_1670:int = 10;
      
      public static const const_1283:int = 6;
      
      private static var var_1033:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1222:int = 0;
      
      public static const const_1566:int = 1;
      
      public static const const_1598:int = 2;
      
      public static const const_1648:int = 3;
      
      public static const const_1680:int = 4;
      
      public static const const_1689:int = 5;
      
      public static const const_1582:int = 9;
      
      public static const const_1505:int = 7;
       
      
      private var var_175:uint = 0;
      
      private var var_1034:uint = 0;
      
      private var var_706:Date;
      
      private var var_1749:int = -1;
      
      private var var_98:Function;
      
      private var var_487:Boolean = false;
      
      private var var_68:EventDispatcher;
      
      private var var_2441:int = -1;
      
      private var var_1221:uint = 0;
      
      private var var_1750:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_847:uint;
      
      private var var_22:ByteArray;
      
      private var var_705:uint;
      
      private var var_1503:Boolean = false;
      
      private var var_2440:int = -1;
      
      private var var_1504:String = "2.0";
      
      private var var_174:Boolean = false;
      
      private var var_1751:Boolean = false;
      
      private var var_351:String;
      
      private var var_595:uint = 0;
      
      private var var_1222:int = 0;
      
      private var var_403:String = "";
      
      private var var_704:int = 8;
      
      private var var_1505:Boolean = false;
      
      public function FZipFile(param1:EventDispatcher, param2:String = "utf-8")
      {
         var_98 = parseFileHead;
         super();
         var_351 = param2;
         var_68 = param1;
         _extraFields = new Dictionary();
         var_22 = new ByteArray();
         var_22.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_595;
      }
      
      public function set filename(param1:String) : void
      {
         var_403 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_174 && false)
         {
            var_22.position = 0;
            if(var_1033)
            {
               var_22.uncompress.apply(var_22,["deflate"]);
            }
            else
            {
               var_22.uncompress();
            }
            var_22.position = 0;
            var_174 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_403;
      }
      
      public function get date() : Date
      {
         return var_706;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && var_98(param1))
         {
         }
         return var_98 === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1505)
         {
            var_98 = parseFileIdle;
            var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_118,"Data descriptors are not supported."));
            return false;
         }
         if(var_175 == 0)
         {
            var_98 = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_175)
            {
               return false;
            }
            parseContent(param1);
            var_98 = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1504;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_174)
         {
            uncompress();
         }
         var_22.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_22.readUTFBytes(var_22.bytesAvailable);
         }
         else
         {
            _loc3_ = var_22.readMultiByte(var_22.bytesAvailable,param2);
         }
         var_22.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_704 === const_724 && !var_1503)
         {
            if(var_1033)
            {
               param1.readBytes(var_22,0,var_175);
            }
            else
            {
               if(!var_487)
               {
                  var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_118,"Adler32 checksum not found."));
                  return;
               }
               var_22.writeByte(120);
               _loc2_ = uint(~var_1749 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_22.writeByte(_loc2_);
               param1.readBytes(var_22,2,var_175);
               var_22.position = var_22.length;
               var_22.writeUnsignedInt(var_847);
            }
            var_174 = true;
         }
         else
         {
            if(var_704 != const_1222)
            {
               var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_118,"Compression method " + var_704 + " is not supported."));
               return;
            }
            param1.readBytes(var_22,0,var_175);
            var_174 = false;
         }
         var_22.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1034 + var_1221 > 0)
            {
               var_98 = parseFileHeadExt;
            }
            else
            {
               var_98 = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_22.length = 0;
         var_22.position = 0;
         var_174 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_22.writeUTFBytes(param1);
            }
            else
            {
               var_22.writeMultiByte(param1,param2);
            }
            var_705 = ChecksumUtil.CRC32(var_22);
            var_487 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_706 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1222 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1222 << 8 | 20);
         param1.writeShort(var_351 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_724);
         var _loc5_:Date = var_706 != null ? var_706 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_705);
         param1.writeUnsignedInt(var_175);
         param1.writeUnsignedInt(var_595);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_351 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_403);
         }
         else
         {
            _loc8_.writeMultiByte(var_403,var_351);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_487)
            {
               _loc16_ = var_174;
               if(_loc16_)
               {
                  uncompress();
               }
               var_847 = ChecksumUtil.Adler32(var_22,0,var_22.length);
               var_487 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_847);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_351 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1750);
            }
            else
            {
               _loc8_.writeMultiByte(var_1750,var_351);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_175 > 0)
         {
            if(var_1033)
            {
               _loc13_ = 0;
               param1.writeBytes(var_22,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_22,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_175;
      }
      
      protected function compress() : void
      {
         if(!var_174)
         {
            if(false)
            {
               var_22.position = 0;
               var_595 = var_22.length;
               if(var_1033)
               {
                  var_22.compress.apply(var_22,["deflate"]);
                  var_175 = var_22.length;
               }
               else
               {
                  var_22.compress();
                  var_175 = -6;
               }
               var_22.position = 0;
               var_174 = true;
            }
            else
            {
               var_175 = 0;
               var_595 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1034 + var_1221)
         {
            parseHeadExt(param1);
            var_98 = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_351 == "utf-8")
         {
            var_403 = param1.readUTFBytes(var_1034);
         }
         else
         {
            var_403 = param1.readMultiByte(var_1034,var_351);
         }
         var _loc2_:uint = var_1221;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               var_68.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_118,"Parse error in file " + var_403 + ": Extra field data size too big."));
               return;
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_847 = param1.readUnsignedInt();
               var_487 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1222 = _loc2_ >> 8;
         var_1504 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_704 = param1.readUnsignedShort();
         var_1503 = (_loc3_ & 1) !== 0;
         var_1505 = (_loc3_ & 8) !== 0;
         var_1751 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_351 = "utf-8";
         }
         if(var_704 === const_1283)
         {
            var_2440 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2441 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_704 === const_724)
         {
            var_1749 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_706 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_705 = param1.readUnsignedInt();
         var_175 = param1.readUnsignedInt();
         var_595 = param1.readUnsignedInt();
         var_1034 = param1.readUnsignedShort();
         var_1221 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_22,0,param1.length);
            var_705 = ChecksumUtil.CRC32(var_22);
            var_487 = false;
         }
         else
         {
            var_22.length = 0;
            var_22.position = 0;
            var_174 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_403 + "\n  date:" + var_706 + "\n  sizeCompressed:" + var_175 + "\n  sizeUncompressed:" + var_595 + "\n  versionHost:" + var_1222 + "\n  versionNumber:" + var_1504 + "\n  compressionMethod:" + var_704 + "\n  encrypted:" + var_1503 + "\n  hasDataDescriptor:" + var_1505 + "\n  hasCompressedPatchedData:" + var_1751 + "\n  filenameEncoding:" + var_351 + "\n  crc32:" + var_705.toString(16) + "\n  adler32:" + var_847.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_174)
         {
            uncompress();
         }
         return var_22;
      }
   }
}
