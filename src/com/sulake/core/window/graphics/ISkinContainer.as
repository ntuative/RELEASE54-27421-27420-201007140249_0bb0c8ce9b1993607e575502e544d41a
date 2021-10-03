package com.sulake.core.window.graphics
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import com.sulake.core.window.utils.DefaultAttStruct;
   
   public interface ISkinContainer
   {
       
      
      function getSkinRendererByTypeAndStyle(param1:uint, param2:uint) : ISkinRenderer;
      
      function get assets() : IAssetLibrary;
      
      function dispose() : void;
      
      function addSkinRenderer(param1:uint, param2:uint, param3:ISkinRenderer, param4:DefaultAttStruct) : void;
      
      function getDefaultAttributesByTypeAndStyle(param1:uint, param2:uint) : DefaultAttStruct;
      
      function getTheActualState(param1:uint, param2:uint, param3:uint) : uint;
   }
}
