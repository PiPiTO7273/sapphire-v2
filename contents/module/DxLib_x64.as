// 
// DxLib for HSP (2015/08/10)
// http://hsp.moe/
// https://twitter.com/hk1v
// by inovia.
// 
// 【本モジュールを利用するにはC#版に付属しているDxLib.dllが必要です】
// http://homepage2.nifty.com/natupaji/DxLib/dxdload.html
// 
// ※本モジュールをスムーズに使用するには、構造体に対する理解が必要です。
// また、C言語で書いてあるソースがそれとなく分かるぐらいの知識が必要です。
// （世の中にあるDxLibのサンプルコードのほとんどがC/C++/C#なので）
// HSPの知識だけですと、かなりきついと思います。
// 推奨レベル：★★★★☆(Lv.4) 当社比...?
// 
// 【旧バージョンのDxLib.as】
// http://hsp.moe/download/DxLib_old.as
// 【TIPS】
// 構造体が戻り値の場合、HSPがクラッシュする問題（解決方法）
// http://codetter.com/?p=1192
// DxLib関連のサンプル（HSP用）
// http://codetter.com/?extag=dxlib
// HSPとDxLibで2D描画の基礎ら辺とか(えくー氏)
// http://fe0km.blog.fc2.com/blog-entry-53.html
// hspからDXlibの利用方法について
// http://hsp.tv/play/pforum.php?mode=all&num=70321
#ifndef __DXLIB__
#define __DXLIB__
// 定義ファイルのバージョン（=作成時のDxLibのバージョン+連番4桁数字）
#define DEFINE_DXLIB_VERSION "3.14f0000"
#uselib "contents/module/DxLib_x64.dll"
#func global SetActiveStateChangeCallBackFunction "dx_SetActiveStateChangeCallBackFunction" sptr,sptr
#func global SetUseASyncChangeWindowModeFunction "dx_SetUseASyncChangeWindowModeFunction" int,sptr,
#func global SetMenuItemSelectCallBackFunction "dx_SetMenuItemSelectCallBackFunction" sptr
#func global SetWindowMenu "dx_SetWindowMenu" int,sptr
#func global SetRestoreShredPoint "dx_SetRestoreShredPoint" sptr
#func global SetRestoreGraphCallback "dx_SetRestoreGraphCallback" sptr
#func global ClearDrawScreen "dx_ClearDrawScreen"
#func global ClearDrawScreenZBuffer "dx_ClearDrawScreenZBuffer" sptr
#func global SetKeyInputStringColor "dx_SetKeyInputStringColor" int,int,int,int,int,int,int,int,int,int,int,int,int,int,int
#func global Paint "dx_Paint" int,int,int,int
#func global GraphFilterS "dx_GraphFilterS" int,int,int,int,int,int,int,int
#func global GraphFilterBltS "dx_GraphFilterBltS" int,int,int,int,int,int,int,int,int
#func global GraphFilterRectBltS "dx_GraphFilterRectBltS" int,int,int,int,int,int,int,int,int,int,int,int,int,int,int
#func global GraphBlendS "dx_GraphBlendS" int,int,int,int,int,int,int,int,int,int
#func global GraphBlendBltS "dx_GraphBlendBltS" int,int,int,int,int,int,int,int,int,int,int
#func global GraphBlendRectBltS "dx_GraphBlendRectBltS" int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int
#func global SetBlendGraphParamS "dx_SetBlendGraphParamS" int,int,int,int,int,int,int,int
#func global DxLib_Init "dx_DxLib_Init" 
#func global DxLib_End "dx_DxLib_End" 
#func global DxLib_GlobalStructInitialize "dx_DxLib_GlobalStructInitialize" 
#func global DxLib_IsInit "dx_DxLib_IsInit" 
#func global ProcessMessage "dx_ProcessMessage" 
#func global WaitTimer "dx_WaitTimer" int
#func global WaitKey "dx_WaitKey" 
#func global GetNowCount "dx_GetNowCount" int
#func global GetNowHiPerformanceCount "dx_GetNowHiPerformanceCount" int
#func global GetDateTime "dx_GetDateTime" sptr
#func global GetRand "dx_GetRand" int
#func global SRand "dx_SRand" int
#func global ErrorLogAdd "dx_ErrorLogAdd" str
#func global ErrorLogTabAdd "dx_ErrorLogTabAdd" 
#func global ErrorLogTabSub "dx_ErrorLogTabSub" 
#func global SetUseTimeStampFlag "dx_SetUseTimeStampFlag" int
#func global SetOutApplicationLogValidFlag "dx_SetOutApplicationLogValidFlag" int
#func global SetApplicationLogSaveDirectory "dx_SetApplicationLogSaveDirectory" str
#func global SetUseDateNameLogFile "dx_SetUseDateNameLogFile" int
#func global SetLogDrawOutFlag "dx_SetLogDrawOutFlag" int
#func global GetLogDrawFlag "dx_GetLogDrawFlag" 
#func global SetLogFontSize "dx_SetLogFontSize" int
#func global clsDx "dx_clsDx" 
#func global SetUseASyncLoadFlag "dx_SetUseASyncLoadFlag" int
#func global CheckHandleASyncLoad "dx_CheckHandleASyncLoad" int
#func global GetHandleASyncLoadResult "dx_GetHandleASyncLoadResult" int
#func global GetASyncLoadNum "dx_GetASyncLoadNum" 
#func global SetDeleteHandleFlag "dx_SetDeleteHandleFlag" int,sptr
#func global SetMouseDispFlag "dx_SetMouseDispFlag" int
#func global GetMousePoint "dx_GetMousePoint" sptr,sptr
#func global SetMousePoint "dx_SetMousePoint" int,int
#func global GetMouseInput "dx_GetMouseInput" 
#func global GetMouseWheelRotVol "dx_GetMouseWheelRotVol" int
#func global GetMouseHWheelRotVol "dx_GetMouseHWheelRotVol" int
#func global GetMouseWheelRotVolF "dx_GetMouseWheelRotVolF" int
#func global GetMouseHWheelRotVolF "dx_GetMouseHWheelRotVolF" int
#func global GetMouseInputLog "dx_GetMouseInputLog" sptr,sptr,sptr,int
#func global DxAlloc "dx_DxAlloc" int,str,int
#func global DxCalloc "dx_DxCalloc" int,str,int
#func global DxRealloc "dx_DxRealloc" sptr,int,str,int
#func global DxFree "dx_DxFree" sptr
#func global DxSetAllocSizeTrap "dx_DxSetAllocSizeTrap" int
#func global DxSetAllocPrintFlag "dx_DxSetAllocPrintFlag" int
#func global DxGetAllocSize "dx_DxGetAllocSize" 
#func global DxGetAllocNum "dx_DxGetAllocNum" 
#func global DxDumpAlloc "dx_DxDumpAlloc" 
#func global DxDrawAlloc "dx_DxDrawAlloc" int,int,int,int
#func global DxErrorCheckAlloc "dx_DxErrorCheckAlloc" 
#func global DxSetAllocSizeOutFlag "dx_DxSetAllocSizeOutFlag" int
#func global DxSetAllocMemoryErrorCheckFlag "dx_DxSetAllocMemoryErrorCheckFlag" int
#func global ConvertStringCharCodeFormat "dx_ConvertStringCharCodeFormat" int,sptr,int,sptr
#func global SetUseCharCodeFormat "dx_SetUseCharCodeFormat" int
#func global strcpyDx "dx_strcpyDx" str,str
#func global strpcpyDx "dx_strpcpyDx" str,str,int
#func global strpcpy2Dx "dx_strpcpy2Dx" str,str,int
#func global strncpyDx "dx_strncpyDx" str,str,int
#func global strncpy2Dx "dx_strncpy2Dx" str,str,int
#func global strrncpyDx "dx_strrncpyDx" str,str,int
#func global strrncpy2Dx "dx_strrncpy2Dx" str,str,int
#func global strpncpyDx "dx_strpncpyDx" str,str,int,int
#func global strpncpy2Dx "dx_strpncpy2Dx" str,str,int,int
#func global strcatDx "dx_strcatDx" str,str
#func global strlenDx "dx_strlenDx" str
#func global strlen2Dx "dx_strlen2Dx" str
#func global strcmpDx "dx_strcmpDx" str,str
#func global stricmpDx "dx_stricmpDx" str,str
#func global strncmpDx "dx_strncmpDx" str,str,int
#func global strncmp2Dx "dx_strncmp2Dx" str,str,int
#func global strpncmpDx "dx_strpncmpDx" str,str,int,int
#func global strpncmp2Dx "dx_strpncmp2Dx" str,str,int,int
#func global strgetchrDx "dx_strgetchrDx" str,int,sptr
#func global strgetchr2Dx "dx_strgetchr2Dx" str,int,sptr
#func global strputchrDx "dx_strputchrDx" str,int,int
#func global strputchr2Dx "dx_strputchr2Dx" str,int,int
#func global strstr2Dx "dx_strstr2Dx" str,str
#func global strrstr2Dx "dx_strrstr2Dx" str,str
#func global strchr2Dx "dx_strchr2Dx" str,int
#func global strrchr2Dx "dx_strrchr2Dx" str,int
#func global atoiDx "dx_atoiDx" str
#func global ProcessNetMessage "dx_ProcessNetMessage" int
#func global GetHostIPbyName "dx_GetHostIPbyName" str,sptr
#func global GetHostIPbyName_IPv6 "dx_GetHostIPbyName_IPv6" str,sptr
#func global ConnectNetWork "dx_ConnectNetWork" int,int
#func global ConnectNetWork_IPv6 "dx_ConnectNetWork_IPv6" int,int
#func global ConnectNetWork_ASync "dx_ConnectNetWork_ASync" int,int
#func global ConnectNetWork_IPv6_ASync "dx_ConnectNetWork_IPv6_ASync" int,int
#func global PreparationListenNetWork "dx_PreparationListenNetWork" int
#func global PreparationListenNetWork_IPv6 "dx_PreparationListenNetWork_IPv6" int
#func global StopListenNetWork "dx_StopListenNetWork" 
#func global CloseNetWork "dx_CloseNetWork" int
#func global GetNetWorkAcceptState "dx_GetNetWorkAcceptState" int
#func global GetNetWorkDataLength "dx_GetNetWorkDataLength" int
#func global GetNetWorkSendDataLength "dx_GetNetWorkSendDataLength" int
#func global GetNewAcceptNetWork "dx_GetNewAcceptNetWork" 
#func global GetLostNetWork "dx_GetLostNetWork" 
#func global GetNetWorkIP "dx_GetNetWorkIP" int,sptr
#func global GetNetWorkIP_IPv6 "dx_GetNetWorkIP_IPv6" int,sptr
#func global GetMyIPAddress "dx_GetMyIPAddress" sptr,int,sptr
#func global SetConnectTimeOutWait "dx_SetConnectTimeOutWait" int
#func global SetUseDXNetWorkProtocol "dx_SetUseDXNetWorkProtocol" int
#func global GetUseDXNetWorkProtocol "dx_GetUseDXNetWorkProtocol" 
#func global SetUseDXProtocol "dx_SetUseDXProtocol" int
#func global GetUseDXProtocol "dx_GetUseDXProtocol" 
#func global SetNetWorkCloseAfterLostFlag "dx_SetNetWorkCloseAfterLostFlag" int
#func global GetNetWorkCloseAfterLostFlag "dx_GetNetWorkCloseAfterLostFlag" 
#func global NetWorkRecv "dx_NetWorkRecv" int,sptr,int
#func global NetWorkRecvToPeek "dx_NetWorkRecvToPeek" int,sptr,int
#func global NetWorkRecvBufferClear "dx_NetWorkRecvBufferClear" int
#func global NetWorkSend "dx_NetWorkSend" int,sptr,int
#func global MakeUDPSocket "dx_MakeUDPSocket" int
#func global MakeUDPSocket_IPv6 "dx_MakeUDPSocket_IPv6" int
#func global DeleteUDPSocket "dx_DeleteUDPSocket" int
#func global NetWorkSendUDP "dx_NetWorkSendUDP" int,int,int,sptr,int
#func global NetWorkSendUDP_IPv6 "dx_NetWorkSendUDP_IPv6" int,int,int,sptr,int
#func global NetWorkRecvUDP "dx_NetWorkRecvUDP" int,sptr,sptr,sptr,int,int
#func global NetWorkRecvUDP_IPv6 "dx_NetWorkRecvUDP_IPv6" int,sptr,sptr,sptr,int,int
#func global CheckNetWorkRecvUDP "dx_CheckNetWorkRecvUDP" int
#func global StockInputChar "dx_StockInputChar" int
#func global ClearInputCharBuf "dx_ClearInputCharBuf" 
#func global GetOneChar "dx_GetOneChar" str,int
#func global GetOneCharWait "dx_GetOneCharWait" str,int
#func global GetCtrlCodeCmp "dx_GetCtrlCodeCmp" int
#func global DrawIMEInputString "dx_DrawIMEInputString" int,int,int
#func global SetUseIMEFlag "dx_SetUseIMEFlag" int
#func global SetInputStringMaxLengthIMESync "dx_SetInputStringMaxLengthIMESync" int
#func global SetIMEInputStringMaxLength "dx_SetIMEInputStringMaxLength" int
#func global GetStringPoint "dx_GetStringPoint" str,int
#func global GetStringPoint2 "dx_GetStringPoint2" str,int
#func global GetStringLength "dx_GetStringLength" str
#func global DrawObtainsString "dx_DrawObtainsString" int,int,int,str,int,int,int,int,int,int,int,int
#func global DrawObtainsString_CharClip "dx_DrawObtainsString_CharClip" int,int,int,str,int,int,int,int,int,int,int,int
#func global DrawObtainsBox "dx_DrawObtainsBox" int,int,int,int,int,int,int
#func global InputStringToCustom "dx_InputStringToCustom" int,int,int,str,int,int,int,int
#func global KeyInputString "dx_KeyInputString" int,int,int,str,int
#func global KeyInputSingleCharString "dx_KeyInputSingleCharString" int,int,int,str,int
#func global KeyInputNumber "dx_KeyInputNumber" int,int,int,int,int
#func global GetIMEInputModeStr "dx_GetIMEInputModeStr" str
#func global SetKeyInputStringColor2 "dx_SetKeyInputStringColor2" int,int
#func global ResetKeyInputStringColor2 "dx_ResetKeyInputStringColor2" int
#func global SetKeyInputStringFont "dx_SetKeyInputStringFont" int
#func global SetKeyInputStringEndCharaMode "dx_SetKeyInputStringEndCharaMode" int
#func global DrawKeyInputModeString "dx_DrawKeyInputModeString" int,int
#func global InitKeyInput "dx_InitKeyInput" 
#func global MakeKeyInput "dx_MakeKeyInput" int,int,int,int,int
#func global DeleteKeyInput "dx_DeleteKeyInput" int
#func global SetActiveKeyInput "dx_SetActiveKeyInput" int
#func global GetActiveKeyInput "dx_GetActiveKeyInput" 
#func global CheckKeyInput "dx_CheckKeyInput" int
#func global ReStartKeyInput "dx_ReStartKeyInput" int
#func global ProcessActKeyInput "dx_ProcessActKeyInput" 
#func global DrawKeyInputString "dx_DrawKeyInputString" int,int,int
#func global SetKeyInputSelectArea "dx_SetKeyInputSelectArea" int,int,int
#func global GetKeyInputSelectArea "dx_GetKeyInputSelectArea" sptr,sptr,int
#func global SetKeyInputDrawStartPos "dx_SetKeyInputDrawStartPos" int,int
#func global GetKeyInputDrawStartPos "dx_GetKeyInputDrawStartPos" int
#func global SetKeyInputCursorBrinkTime "dx_SetKeyInputCursorBrinkTime" int
#func global SetKeyInputCursorBrinkFlag "dx_SetKeyInputCursorBrinkFlag" int
#func global SetKeyInputString "dx_SetKeyInputString" str,int
#func global SetKeyInputNumber "dx_SetKeyInputNumber" int,int
#func global SetKeyInputNumberToFloat "dx_SetKeyInputNumberToFloat" float,int
#func global GetKeyInputString "dx_GetKeyInputString" str,int
#func global GetKeyInputNumber "dx_GetKeyInputNumber" int
#func global GetKeyInputNumberToFloat "dx_GetKeyInputNumberToFloat" int
#func global SetKeyInputCursorPosition "dx_SetKeyInputCursorPosition" int,int
#func global GetKeyInputCursorPosition "dx_GetKeyInputCursorPosition" int
#func global FileRead_open "dx_FileRead_open" str,int
#func global FileRead_size "dx_FileRead_size" str
#func global FileRead_close "dx_FileRead_close" int
#func global FileRead_tell "dx_FileRead_tell" int
#func global FileRead_seek "dx_FileRead_seek" int,sptr,int
#func global FileRead_read "dx_FileRead_read" sptr,int,int
#func global FileRead_idle_chk "dx_FileRead_idle_chk" int
#func global FileRead_eof "dx_FileRead_eof" int
#func global FileRead_gets "dx_FileRead_gets" str,int,int
#func global FileRead_createInfo "dx_FileRead_createInfo" str
#func global FileRead_getInfoNum "dx_FileRead_getInfoNum" int
#func global FileRead_deleteInfo "dx_FileRead_deleteInfo" int
#func global FileRead_fullyLoad "dx_FileRead_fullyLoad" str
#func global FileRead_fullyLoad_delete "dx_FileRead_fullyLoad_delete" int
#func global FileRead_fullyLoad_getImage "dx_FileRead_fullyLoad_getImage" int
#func global FileRead_fullyLoad_getSize "dx_FileRead_fullyLoad_getSize" int
#func global GetStreamFunctionDefault "dx_GetStreamFunctionDefault" 
#func global ConvertFullPath "dx_ConvertFullPath" str,str,str
#func global CheckHitKey "dx_CheckHitKey" int
#func global CheckHitKeyAll "dx_CheckHitKeyAll" int
#func global GetHitKeyStateAll "dx_GetHitKeyStateAll" sptr
#func global GetJoypadNum "dx_GetJoypadNum" 
#func global GetJoypadInputState "dx_GetJoypadInputState" int
#func global GetJoypadAnalogInput "dx_GetJoypadAnalogInput" sptr,sptr,int
#func global GetJoypadAnalogInputRight "dx_GetJoypadAnalogInputRight" sptr,sptr,int
#func global GetJoypadDirectInputState "dx_GetJoypadDirectInputState" int,sptr
#func global CheckJoypadXInput "dx_CheckJoypadXInput" int
#func global GetJoypadXInputState "dx_GetJoypadXInputState" int,sptr
#func global SetJoypadInputToKeyInput "dx_SetJoypadInputToKeyInput" int,int,int,int,int,int
#func global SetJoypadDeadZone "dx_SetJoypadDeadZone" int,double
#func global StartJoypadVibration "dx_StartJoypadVibration" int,int,int,int
#func global StopJoypadVibration "dx_StopJoypadVibration" int,int
#func global GetJoypadPOVState "dx_GetJoypadPOVState" int,int
#func global ReSetupJoypad "dx_ReSetupJoypad" 
#func global SetUseJoypadVibrationFlag "dx_SetUseJoypadVibrationFlag" int
#func global MakeGraph "dx_MakeGraph" int,int,int
#func global __MakeScreen "dx_MakeScreen" int,int,int
#func global DerivationGraph "dx_DerivationGraph" int,int,int,int,int
#func global DeleteGraph "dx_DeleteGraph" int,int
#func global DeleteSharingGraph "dx_DeleteSharingGraph" int
#func global GetGraphNum "dx_GetGraphNum" 
#func global FillGraph "dx_FillGraph" int,int,int,int,int
#func global SetGraphLostFlag "dx_SetGraphLostFlag" int,sptr
#func global InitGraph "dx_InitGraph" int
#func global ReloadFileGraphAll "dx_ReloadFileGraphAll" 
#func global MakeShadowMap "dx_MakeShadowMap" int,int
#func global DeleteShadowMap "dx_DeleteShadowMap" int
#func global SetShadowMapLightDirection "dx_SetShadowMapLightDirection" int,float,float,float
#func global ShadowMap_DrawSetup "dx_ShadowMap_DrawSetup" int
#func global ShadowMap_DrawEnd "dx_ShadowMap_DrawEnd" 
#func global SetUseShadowMap "dx_SetUseShadowMap" int,int
#func global SetShadowMapDrawArea "dx_SetShadowMapDrawArea" int,float,float,float,float,float,float
#func global ResetShadowMapDrawArea "dx_ResetShadowMapDrawArea" int
#func global SetShadowMapAdjustDepth "dx_SetShadowMapAdjustDepth" int,float
#func global TestDrawShadowMap "dx_TestDrawShadowMap" int,int,int,int,int
#func global LoadBmpToGraph "dx_LoadBmpToGraph" str,int,int,int
;#func global LoadGraph "dx_LoadGraph" str,int
#func global __LoadGraph "dx_LoadGraph" str,int
#func global LoadReverseGraph "dx_LoadReverseGraph" str,int
#func global LoadDivGraph "dx_LoadDivGraph" str,int,int,int,int,int,sptr,int
#func global LoadDivBmpToGraph "dx_LoadDivBmpToGraph" str,int,int,int,int,int,sptr,int,int
#func global LoadReverseDivGraph "dx_LoadReverseDivGraph" str,int,int,int,int,int,sptr,int
#func global LoadBlendGraph "dx_LoadBlendGraph" str
#func global CreateGraphFromMem "dx_CreateGraphFromMem" sptr,int,sptr,int,int,int
#func global ReCreateGraphFromMem "dx_ReCreateGraphFromMem" sptr,int,int,sptr,int,int,int
#func global CreateDivGraphFromMem "dx_CreateDivGraphFromMem" sptr,int,int,int,int,int,int,sptr,int,int,sptr,int
#func global ReCreateDivGraphFromMem "dx_ReCreateDivGraphFromMem" sptr,int,int,int,int,int,int,sptr,int,int,sptr,int
#func global CreateGraph "dx_CreateGraph" int,int,int,sptr,sptr,int
#func global CreateDivGraph "dx_CreateDivGraph" int,int,int,sptr,int,int,int,int,int,sptr,sptr
#func global ReCreateGraph "dx_ReCreateGraph" int,int,int,sptr,int,sptr
#func global CreateBlendGraphFromSoftImage "dx_CreateBlendGraphFromSoftImage" int
#func global CreateGraphFromSoftImage "dx_CreateGraphFromSoftImage" int
#func global CreateGraphFromRectSoftImage "dx_CreateGraphFromRectSoftImage" int,int,int,int,int
#func global ReCreateGraphFromSoftImage "dx_ReCreateGraphFromSoftImage" int,int
#func global ReCreateGraphFromRectSoftImage "dx_ReCreateGraphFromRectSoftImage" int,int,int,int,int,int
#func global CreateDivGraphFromSoftImage "dx_CreateDivGraphFromSoftImage" int,int,int,int,int,int,sptr
#func global ReloadGraph "dx_ReloadGraph" str,int,int
#func global ReloadDivGraph "dx_ReloadDivGraph" str,int,int,int,int,int,sptr,int
#func global ReloadReverseGraph "dx_ReloadReverseGraph" str,int
#func global ReloadReverseDivGraph "dx_ReloadReverseDivGraph" str,int,int,int,int,int,sptr
#func global SetGraphColorBitDepth "dx_SetGraphColorBitDepth" int
#func global GetGraphColorBitDepth "dx_GetGraphColorBitDepth" 
#func global SetCreateGraphColorBitDepth "dx_SetCreateGraphColorBitDepth" int
#func global GetCreateGraphColorBitDepth "dx_GetCreateGraphColorBitDepth" 
#func global SetCreateGraphChannelBitDepth "dx_SetCreateGraphChannelBitDepth" int
#func global GetCreateGraphChannelBitDepth "dx_GetCreateGraphChannelBitDepth" 
#func global SetDrawValidGraphCreateFlag "dx_SetDrawValidGraphCreateFlag" int
#func global GetDrawValidGraphCreateFlag "dx_GetDrawValidGraphCreateFlag" 
#func global SetDrawValidFlagOf3DGraph "dx_SetDrawValidFlagOf3DGraph" int
#func global SetLeftUpColorIsTransColorFlag "dx_SetLeftUpColorIsTransColorFlag" int
#func global SetUseBlendGraphCreateFlag "dx_SetUseBlendGraphCreateFlag" int
#func global GetUseBlendGraphCreateFlag "dx_GetUseBlendGraphCreateFlag" 
#func global SetUseAlphaTestGraphCreateFlag "dx_SetUseAlphaTestGraphCreateFlag" int
#func global GetUseAlphaTestGraphCreateFlag "dx_GetUseAlphaTestGraphCreateFlag" 
#func global SetUseAlphaTestFlag "dx_SetUseAlphaTestFlag" int
#func global GetUseAlphaTestFlag "dx_GetUseAlphaTestFlag" 
#func global SetCubeMapTextureCreateFlag "dx_SetCubeMapTextureCreateFlag" int
#func global GetCubeMapTextureCreateFlag "dx_GetCubeMapTextureCreateFlag" 
#func global SetUseNoBlendModeParam "dx_SetUseNoBlendModeParam" int
#func global SetDrawValidAlphaChannelGraphCreateFlag "dx_SetDrawValidAlphaChannelGraphCreateFlag" int
#func global GetDrawValidAlphaChannelGraphCreateFlag "dx_GetDrawValidAlphaChannelGraphCreateFlag" 
#func global SetDrawValidFloatTypeGraphCreateFlag "dx_SetDrawValidFloatTypeGraphCreateFlag" int
#func global GetDrawValidFloatTypeGraphCreateFlag "dx_GetDrawValidFloatTypeGraphCreateFlag" 
#func global SetDrawValidGraphCreateZBufferFlag "dx_SetDrawValidGraphCreateZBufferFlag" int
#func global GetDrawValidGraphCreateZBufferFlag "dx_GetDrawValidGraphCreateZBufferFlag" 
#func global SetCreateDrawValidGraphZBufferBitDepth "dx_SetCreateDrawValidGraphZBufferBitDepth" int
#func global GetCreateDrawValidGraphZBufferBitDepth "dx_GetCreateDrawValidGraphZBufferBitDepth" 
#func global SetCreateDrawValidGraphChannelNum "dx_SetCreateDrawValidGraphChannelNum" int
#func global GetCreateDrawValidGraphChannelNum "dx_GetCreateDrawValidGraphChannelNum" 
#func global SetCreateDrawValidGraphMultiSample "dx_SetCreateDrawValidGraphMultiSample" int,int
#func global SetDrawValidMultiSample "dx_SetDrawValidMultiSample" int,int
#func global GetMultiSampleQuality "dx_GetMultiSampleQuality" int
#func global SetUseTransColor "dx_SetUseTransColor" int
#func global SetUseTransColorGraphCreateFlag "dx_SetUseTransColorGraphCreateFlag" int
#func global SetUseGraphAlphaChannel "dx_SetUseGraphAlphaChannel" int
#func global GetUseGraphAlphaChannel "dx_GetUseGraphAlphaChannel" 
#func global SetUseAlphaChannelGraphCreateFlag "dx_SetUseAlphaChannelGraphCreateFlag" int
#func global GetUseAlphaChannelGraphCreateFlag "dx_GetUseAlphaChannelGraphCreateFlag" 
#func global SetUseNotManageTextureFlag "dx_SetUseNotManageTextureFlag" int
#func global GetUseNotManageTextureFlag "dx_GetUseNotManageTextureFlag" 
#func global SetTransColor "dx_SetTransColor" int,int,int
#func global GetTransColor "dx_GetTransColor" sptr,sptr,sptr
#func global SetUseDivGraphFlag "dx_SetUseDivGraphFlag" int
#func global SetUseAlphaImageLoadFlag "dx_SetUseAlphaImageLoadFlag" int
#func global SetUseMaxTextureSize "dx_SetUseMaxTextureSize" int
#func global SetUseGraphBaseDataBackup "dx_SetUseGraphBaseDataBackup" int
#func global GetUseGraphBaseDataBackup "dx_GetUseGraphBaseDataBackup" 
#func global SetUseSystemMemGraphCreateFlag "dx_SetUseSystemMemGraphCreateFlag" int
#func global GetUseSystemMemGraphCreateFlag "dx_GetUseSystemMemGraphCreateFlag" 
#func global GraphUnLock "dx_GraphUnLock" int
#func global SetUseGraphZBuffer "dx_SetUseGraphZBuffer" int,int,int
#func global CopyGraphZBufferImage "dx_CopyGraphZBufferImage" int,int
#func global SetDeviceLostDeleteGraphFlag "dx_SetDeviceLostDeleteGraphFlag" int,int
#func global GetGraphSize "dx_GetGraphSize" int,sptr,sptr
#func global GetGraphTextureSize "dx_GetGraphTextureSize" int,sptr,sptr
#func global GetGraphMipmapCount "dx_GetGraphMipmapCount" int
#func global GetGraphFilePath "dx_GetGraphFilePath" int,str
#func global GetMaxGraphTextureSize "dx_GetMaxGraphTextureSize" sptr,sptr
#func global GetValidRestoreShredPoint "dx_GetValidRestoreShredPoint" 
#func global GetCreateGraphColorData "dx_GetCreateGraphColorData" sptr,sptr
#func global GetGraphPalette "dx_GetGraphPalette" int,int,sptr,sptr,sptr
#func global GetGraphOriginalPalette "dx_GetGraphOriginalPalette" int,int,sptr,sptr,sptr
#func global SetGraphPalette "dx_SetGraphPalette" int,int,int
#func global ResetGraphPalette "dx_ResetGraphPalette" int
#func global DrawLine "dx_DrawLine" int,int,int,int,int,int
#func global DrawLineAA "dx_DrawLineAA" int,int,int,int,int,int
#func global DrawBox "dx_DrawBox" int,int,int,int,int,int
#func global DrawFillBox "dx_DrawFillBox" int,int,int,int,int
#func global DrawLineBox "dx_DrawLineBox" int,int,int,int,int
#func global DrawCircle "dx_DrawCircle" int,int,int,int,int,int
#func global DrawOval "dx_DrawOval" int,int,int,int,int,int,int
#func global DrawTriangle "dx_DrawTriangle" int,int,int,int,int,int,int,int
#func global DrawQuadrangle "dx_DrawQuadrangle" int,int,int,int,int,int,int,int,int,int
#func global DrawRoundRect "dx_DrawRoundRect" int,int,int,int,int,int,int,int
#func global DrawPixel "dx_DrawPixel" int,int,int
#func global DrawPixelSet "dx_DrawPixelSet" sptr,int
#func global DrawLineSet "dx_DrawLineSet" sptr,int
#func global DrawPixel3D "dx_DrawPixel3D" float,float,float,int
#func global DrawPixel3DD "dx_DrawPixel3DD" double,double,double,int
#func global DrawLine3D "dx_DrawLine3D" float,float,float,float,float,float,int
#func global DrawLine3DD "dx_DrawLine3DD" double,double,double,double,double,double,int
#func global DrawTriangle3D "dx_DrawTriangle3D" float,float,float,float,float,float,float,float,float,int,int
#func global DrawTriangle3DD "dx_DrawTriangle3DD" double,double,double,double,double,double,double,double,double,int,int
#func global DrawCube3D "dx_DrawCube3D" float,float,float,float,float,float,int,int,int
#func global DrawCube3DD "dx_DrawCube3DD" double,double,double,double,double,double,int,int,int
#func global DrawSphere3D "dx_DrawSphere3D" float,float,float,float,int,int,int,int
#func global DrawSphere3DD "dx_DrawSphere3DD" double,double,double,double,int,int,int,int
#func global DrawCapsule3D "dx_DrawCapsule3D" float,float,float,float,float,float,float,int,int,int,int
#func global DrawCapsule3DD "dx_DrawCapsule3DD" double,double,double,double,double,double,double,int,int,int,int
#func global DrawCone3D "dx_DrawCone3D" float,float,float,float,float,float,float,int,int,int,int
#func global DrawCone3DD "dx_DrawCone3DD" double,double,double,double,double,double,double,int,int,int,int
#func global LoadGraphScreen "dx_LoadGraphScreen" int,int,str,int
#func global DrawGraph "dx_DrawGraph" int,int,int,int
#func global DrawExtendGraph "dx_DrawExtendGraph" int,int,int,int,int,int
#func global DrawRotaGraph "dx_DrawRotaGraph" int,int,double,double,int,int,int
#func global DrawRotaGraph2 "dx_DrawRotaGraph2" int,int,int,int,double,double,int,int,int
#func global DrawRotaGraph3 "dx_DrawRotaGraph3" int,int,int,int,double,double,double,int,int,int
#func global DrawModiGraph "dx_DrawModiGraph" int,int,int,int,int,int,int,int,int,int
#func global DrawTurnGraph "dx_DrawTurnGraph" int,int,int,int
#func global DrawGraphF "dx_DrawGraphF" float,float,int,int
#func global DrawExtendGraphF "dx_DrawExtendGraphF" float,float,float,float,int,int
#func global DrawRotaGraphF "dx_DrawRotaGraphF" float,float,double,double,int,int,int
#func global DrawRotaGraph2F "dx_DrawRotaGraph2F" float,float,float,float,double,double,int,int,int
#func global DrawRotaGraph3F "dx_DrawRotaGraph3F" float,float,float,float,double,double,double,int,int,int
#func global DrawModiGraphF "dx_DrawModiGraphF" float,float,float,float,float,float,float,float,int,int
#func global DrawTurnGraphF "dx_DrawTurnGraphF" float,float,int,int
#func global DrawTile "dx_DrawTile" int,int,int,int,int,int,double,double,int,int
#func global DrawRectGraph "dx_DrawRectGraph" int,int,int,int,int,int,int,int,int
#func global DrawRectExtendGraph "dx_DrawRectExtendGraph" int,int,int,int,int,int,int,int,int,int
#func global DrawRectRotaGraph "dx_DrawRectRotaGraph" int,int,int,int,int,int,double,double,int,int,int
#func global DrawRectRotaGraph2 "dx_DrawRectRotaGraph2" int,int,int,int,int,int,int,int,double,double,int,int,int
#func global DrawRectRotaGraph3 "dx_DrawRectRotaGraph3" int,int,int,int,int,int,int,int,double,double,double,int,int,int
#func global DrawRectModiGraph "dx_DrawRectModiGraph" int,int,int,int,int,int,int,int,int,int,int,int,int,int
#func global DrawRectGraphF "dx_DrawRectGraphF" float,float,int,int,int,int,int,int,int
#func global DrawRectExtendGraphF "dx_DrawRectExtendGraphF" float,float,float,float,int,int,int,int,int,int
#func global DrawRectRotaGraphF "dx_DrawRectRotaGraphF" float,float,int,int,int,int,double,double,int,int,int
#func global DrawRectRotaGraph2F "dx_DrawRectRotaGraph2F" float,float,int,int,int,int,float,float,double,double,int,int,int
#func global DrawRectRotaGraph3F "dx_DrawRectRotaGraph3F" float,float,int,int,int,int,float,float,double,double,double,int,int,int
#func global DrawRectModiGraphF "dx_DrawRectModiGraphF" float,float,float,float,float,float,float,float,int,int,int,int,int,int
#func global DrawBlendGraph "dx_DrawBlendGraph" int,int,int,int,int,int,int
#func global DrawBlendGraphPos "dx_DrawBlendGraphPos" int,int,int,int,int,int,int,int,int
#func global DrawCircleGauge "dx_DrawCircleGauge" int,int,double,int,double
#func global DrawGraphToZBuffer "dx_DrawGraphToZBuffer" int,int,int,int
#func global DrawTurnGraphToZBuffer "dx_DrawTurnGraphToZBuffer" int,int,int,int
#func global DrawExtendGraphToZBuffer "dx_DrawExtendGraphToZBuffer" int,int,int,int,int,int
#func global DrawRotaGraphToZBuffer "dx_DrawRotaGraphToZBuffer" int,int,double,double,int,int,int
#func global DrawRotaGraph2ToZBuffer "dx_DrawRotaGraph2ToZBuffer" int,int,int,int,double,double,int,int,int
#func global DrawRotaGraph3ToZBuffer "dx_DrawRotaGraph3ToZBuffer" int,int,int,int,double,double,double,int,int,int
#func global DrawModiGraphToZBuffer "dx_DrawModiGraphToZBuffer" int,int,int,int,int,int,int,int,int,int
#func global DrawBoxToZBuffer "dx_DrawBoxToZBuffer" int,int,int,int,int,int
#func global DrawCircleToZBuffer "dx_DrawCircleToZBuffer" int,int,int,int,int
#func global DrawTriangleToZBuffer "dx_DrawTriangleToZBuffer" int,int,int,int,int,int,int,int
#func global DrawQuadrangleToZBuffer "dx_DrawQuadrangleToZBuffer" int,int,int,int,int,int,int,int,int,int
#func global DrawRoundRectToZBuffer "dx_DrawRoundRectToZBuffer" int,int,int,int,int,int,int,int
#func global DrawPolygon "dx_DrawPolygon" sptr,int,int,int,int
#func global DrawPolygon2D "dx_DrawPolygon2D" sptr,int,int,int
#func global DrawPolygon3D "dx_DrawPolygon3D" sptr,int,int,int
#func global DrawPolygonIndexed2D "dx_DrawPolygonIndexed2D" sptr,int,sptr,int,int,int
#func global DrawPolygonIndexed3D "dx_DrawPolygonIndexed3D" sptr,int,sptr,int,int,int
#func global DrawPolygonIndexed3DBase "dx_DrawPolygonIndexed3DBase" sptr,int,sptr,int,int,int,int
#func global DrawPolygon3DBase "dx_DrawPolygon3DBase" sptr,int,int,int,int
#func global DrawPolygon3D_2 "dx_DrawPolygon3D_2" sptr,int,int,int
#func global DrawPolygonBase "dx_DrawPolygonBase" sptr,int,int,int,int,int
#func global DrawPrimitive2D "dx_DrawPrimitive2D" sptr,int,int,int,int
#func global DrawPrimitive3D "dx_DrawPrimitive3D" sptr,int,int,int,int
#func global DrawPrimitiveIndexed2D "dx_DrawPrimitiveIndexed2D" sptr,int,sptr,int,int,int,int
#func global DrawPrimitiveIndexed3D "dx_DrawPrimitiveIndexed3D" sptr,int,sptr,int,int,int,int
#func global DrawPolygon3D_UseVertexBuffer "dx_DrawPolygon3D_UseVertexBuffer" int,int,int
#func global DrawPrimitive3D_UseVertexBuffer "dx_DrawPrimitive3D_UseVertexBuffer" int,int,int,int
#func global DrawPrimitive3D_UseVertexBuffer2 "dx_DrawPrimitive3D_UseVertexBuffer2" int,int,int,int,int,int
#func global DrawPolygonIndexed3D_UseVertexBuffer "dx_DrawPolygonIndexed3D_UseVertexBuffer" int,int,int,int
#func global DrawPrimitiveIndexed3D_UseVertexBuffer "dx_DrawPrimitiveIndexed3D_UseVertexBuffer" int,int,int,int,int
#func global DrawPrimitiveIndexed3D_UseVertexBuffer2 "dx_DrawPrimitiveIndexed3D_UseVertexBuffer2" int,int,int,int,int,int,int,int,int,int
#func global DrawGraph3D "dx_DrawGraph3D" float,float,float,int,int
#func global DrawExtendGraph3D "dx_DrawExtendGraph3D" float,float,float,double,double,int,int
#func global DrawRotaGraph3D "dx_DrawRotaGraph3D" float,float,float,double,double,int,int,int
#func global DrawRota2Graph3D "dx_DrawRota2Graph3D" float,float,float,float,float,double,double,double,int,int,int
#func global DrawModiBillboard3D "dx_DrawModiBillboard3D" float,float,float,float,float,float,float,float,float,float,float,int,int
#func global DrawBillboard3D "dx_DrawBillboard3D" float,float,float,float,float,float,float,int,int,int
#func global SetDrawMode "dx_SetDrawMode" int
#func global GetDrawMode "dx_GetDrawMode" 
#func global SetDrawBlendMode "dx_SetDrawBlendMode" int,int
#func global GetDrawBlendMode "dx_GetDrawBlendMode" sptr,sptr
#func global SetDrawAlphaTest "dx_SetDrawAlphaTest" int,int
#func global SetBlendGraph "dx_SetBlendGraph" int,int,int
#func global SetBlendGraphPosition "dx_SetBlendGraphPosition" int,int
#func global SetDrawBright "dx_SetDrawBright" int,int,int
#func global GetDrawBright "dx_GetDrawBright" sptr,sptr,sptr
#func global SetIgnoreDrawGraphColor "dx_SetIgnoreDrawGraphColor" int
#func global SetMaxAnisotropy "dx_SetMaxAnisotropy" int
#func global SetUseLarge3DPositionSupport "dx_SetUseLarge3DPositionSupport" int
#func global SetUseZBufferFlag "dx_SetUseZBufferFlag" int
#func global SetWriteZBufferFlag "dx_SetWriteZBufferFlag" int
#func global SetZBufferCmpType "dx_SetZBufferCmpType" int
#func global SetZBias "dx_SetZBias" int
#func global SetUseZBuffer3D "dx_SetUseZBuffer3D" int
#func global SetWriteZBuffer3D "dx_SetWriteZBuffer3D" int
#func global SetZBufferCmpType3D "dx_SetZBufferCmpType3D" int
#func global SetZBias3D "dx_SetZBias3D" int
#func global SetDrawZ "dx_SetDrawZ" float
#func global SetDrawArea "dx_SetDrawArea" int,int,int,int
#func global GetDrawArea "dx_GetDrawArea" sptr
#func global SetDrawAreaFull "dx_SetDrawAreaFull" 
#func global SetDraw3DScale "dx_SetDraw3DScale" float
#func global RunRestoreShred "dx_RunRestoreShred" 
#func global SetTransformToWorld "dx_SetTransformToWorld" sptr
#func global SetTransformToWorldD "dx_SetTransformToWorldD" sptr
#func global GetTransformToWorldMatrix "dx_GetTransformToWorldMatrix" sptr
#func global GetTransformToWorldMatrixD "dx_GetTransformToWorldMatrixD" sptr
#func global SetTransformToView "dx_SetTransformToView" sptr
#func global SetTransformToViewD "dx_SetTransformToViewD" sptr
#func global GetTransformToViewMatrix "dx_GetTransformToViewMatrix" sptr
#func global GetTransformToViewMatrixD "dx_GetTransformToViewMatrixD" sptr
#func global SetTransformToProjection "dx_SetTransformToProjection" sptr
#func global SetTransformToProjectionD "dx_SetTransformToProjectionD" sptr
#func global GetTransformToProjectionMatrix "dx_GetTransformToProjectionMatrix" sptr
#func global GetTransformToProjectionMatrixD "dx_GetTransformToProjectionMatrixD" sptr
#func global SetTransformToViewport "dx_SetTransformToViewport" sptr
#func global SetTransformToViewportD "dx_SetTransformToViewportD" sptr
#func global GetTransformToViewportMatrix "dx_GetTransformToViewportMatrix" sptr
#func global GetTransformToViewportMatrixD "dx_GetTransformToViewportMatrixD" sptr
#func global GetTransformToAPIViewportMatrix "dx_GetTransformToAPIViewportMatrix" sptr
#func global GetTransformToAPIViewportMatrixD "dx_GetTransformToAPIViewportMatrixD" sptr
#func global SetDefTransformMatrix "dx_SetDefTransformMatrix" 
#func global GetTransformPosition "dx_GetTransformPosition" sptr,sptr,sptr
#func global GetTransformPositionD "dx_GetTransformPositionD" sptr,sptr,sptr
#func global GetBillboardPixelSize "dx_GetBillboardPixelSize" float,float,float,float
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvWorldPosToViewPos "dx_ConvWorldPosToViewPos" var,float,float,float
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvWorldPosToViewPosD "dx_ConvWorldPosToViewPosD" var,double,double,double
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvWorldPosToScreenPos "dx_ConvWorldPosToScreenPos" var,float,float,float
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvWorldPosToScreenPosD "dx_ConvWorldPosToScreenPosD" var,double,double,double
// 戻り値が構造体です（FLOAT4）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvWorldPosToScreenPosPlusW "dx_ConvWorldPosToScreenPosPlusW" var,float,float,float
// 戻り値が構造体です（DOUBLE4）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvWorldPosToScreenPosPlusWD "dx_ConvWorldPosToScreenPosPlusWD" var,double,double,double
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvScreenPosToWorldPos "dx_ConvScreenPosToWorldPos" var,float,float,float
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvScreenPosToWorldPosD "dx_ConvScreenPosToWorldPosD" var,double,double,double
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvScreenPosToWorldPos_ZLinear "dx_ConvScreenPosToWorldPos_ZLinear" var,float,float,float
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global ConvScreenPosToWorldPos_ZLinearD "dx_ConvScreenPosToWorldPos_ZLinearD" var,double,double,double
#func global SetUseCullingFlag "dx_SetUseCullingFlag" int
#func global SetUseBackCulling "dx_SetUseBackCulling" int
#func global GetUseBackCulling "dx_GetUseBackCulling" 
#func global SetTextureAddressMode "dx_SetTextureAddressMode" int,int
#func global SetTextureAddressModeUV "dx_SetTextureAddressModeUV" int,int,int
#func global SetTextureAddressTransform "dx_SetTextureAddressTransform" float,float,float,float,float,float,float
#func global SetTextureAddressTransformMatrix "dx_SetTextureAddressTransformMatrix" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global ResetTextureAddressTransform "dx_ResetTextureAddressTransform" 
#func global SetFogEnable "dx_SetFogEnable" int
#func global GetFogEnable "dx_GetFogEnable" 
#func global SetFogMode "dx_SetFogMode" int
#func global GetFogMode "dx_GetFogMode" 
#func global SetFogColor "dx_SetFogColor" int,int,int
#func global GetFogColor "dx_GetFogColor" sptr,sptr,sptr
#func global SetFogStartEnd "dx_SetFogStartEnd" float,float
#func global GetFogStartEnd "dx_GetFogStartEnd" sptr,sptr
#func global SetFogDensity "dx_SetFogDensity" float
#func global GetFogDensity "dx_GetFogDensity" 
#func global GetPixel "dx_GetPixel" int,int
#func global SetBackgroundColor "dx_SetBackgroundColor" int,int,int
#func global GetDrawScreenGraph "dx_GetDrawScreenGraph" int,int,int,int,int,int
#func global BltDrawValidGraph "dx_BltDrawValidGraph" int,int,int,int,int,int,int,int
#func global ScreenFlip "dx_ScreenFlip" 
#func global ScreenCopy "dx_ScreenCopy" 
#func global WaitVSync "dx_WaitVSync" int
#func global ClsDrawScreen "dx_ClsDrawScreen" 
#func global SetDrawScreen "dx_SetDrawScreen" int
#func global GetDrawScreen "dx_GetDrawScreen" 
#func global GetActiveGraph "dx_GetActiveGraph" 
#func global SetDrawZBuffer "dx_SetDrawZBuffer" int
#func global SetGraphMode "dx_SetGraphMode" int,int,int,int
#func global SetFullScreenResolutionMode "dx_SetFullScreenResolutionMode" int
#func global SetFullScreenScalingMode "dx_SetFullScreenScalingMode" int
#func global SetEmulation320x240 "dx_SetEmulation320x240" int
#func global SetZBufferSize "dx_SetZBufferSize" int,int
#func global SetZBufferBitDepth "dx_SetZBufferBitDepth" int
#func global SetWaitVSyncFlag "dx_SetWaitVSyncFlag" int
#func global GetWaitVSyncFlag "dx_GetWaitVSyncFlag" 
#func global SetFullSceneAntiAliasingMode "dx_SetFullSceneAntiAliasingMode" int,int
#func global SetGraphDisplayArea "dx_SetGraphDisplayArea" int,int,int,int
#func global SetChangeScreenModeGraphicsSystemResetFlag "dx_SetChangeScreenModeGraphicsSystemResetFlag" int
#func global GetScreenState "dx_GetScreenState" sptr,sptr,sptr
#func global GetDrawScreenSize "dx_GetDrawScreenSize" sptr,sptr
#func global GetScreenBitDepth "dx_GetScreenBitDepth" 
#func global GetColorBitDepth "dx_GetColorBitDepth" 
#func global GetChangeDisplayFlag "dx_GetChangeDisplayFlag" 
#func global GetVideoMemorySize "dx_GetVideoMemorySize" sptr,sptr
#func global GetRefreshRate "dx_GetRefreshRate" 
#func global GetDisplayNum "dx_GetDisplayNum" 
#func global GetDisplayModeNum "dx_GetDisplayModeNum" int
// 戻り値が構造体です（DISPLAYMODEDATA）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetDisplayMode "dx_GetDisplayMode" var,int,int
#func global GetDisplayMaxResolution "dx_GetDisplayMaxResolution" sptr,sptr,int
#func global GetMultiDrawScreenNum "dx_GetMultiDrawScreenNum" 
#func global GetDrawFloatCoordType "dx_GetDrawFloatCoordType" 
#func global SetUseNormalDrawShader "dx_SetUseNormalDrawShader" int
#func global SetUseSoftwareRenderModeFlag "dx_SetUseSoftwareRenderModeFlag" int
#func global SetNotUse3DFlag "dx_SetNotUse3DFlag" int
#func global SetUse3DFlag "dx_SetUse3DFlag" int
#func global GetUse3DFlag "dx_GetUse3DFlag" 
#func global SetScreenMemToVramFlag "dx_SetScreenMemToVramFlag" int
#func global GetScreenMemToSystemMemFlag "dx_GetScreenMemToSystemMemFlag" 
#func global SetWindowDrawRect "dx_SetWindowDrawRect" sptr
#func global RestoreGraphSystem "dx_RestoreGraphSystem" 
#func global SetUseHardwareVertexProcessing "dx_SetUseHardwareVertexProcessing" int
#func global SetUsePixelLighting "dx_SetUsePixelLighting" int
#func global SetUseOldDrawModiGraphCodeFlag "dx_SetUseOldDrawModiGraphCodeFlag" int
#func global SetUseVramFlag "dx_SetUseVramFlag" int
#func global GetUseVramFlag "dx_GetUseVramFlag" 
#func global SetBasicBlendFlag "dx_SetBasicBlendFlag" int
#func global SetUseBasicGraphDraw3DDeviceMethodFlag "dx_SetUseBasicGraphDraw3DDeviceMethodFlag" int
#func global SetUseDisplayIndex "dx_SetUseDisplayIndex" int
#func global RenderVertex "dx_RenderVertex" 
#func global SaveDrawScreen "dx_SaveDrawScreen" int,int,int,int,str,int,int,int,int
#func global SaveDrawScreenToBMP "dx_SaveDrawScreenToBMP" int,int,int,int,str
#func global SaveDrawScreenToJPEG "dx_SaveDrawScreenToJPEG" int,int,int,int,str,int,int
#func global SaveDrawScreenToPNG "dx_SaveDrawScreenToPNG" int,int,int,int,str,int
#func global CreateVertexBuffer "dx_CreateVertexBuffer" int,int
#func global DeleteVertexBuffer "dx_DeleteVertexBuffer" int
#func global InitVertexBuffer "dx_InitVertexBuffer" 
#func global SetVertexBufferData "dx_SetVertexBufferData" int,sptr,int,int
#func global CreateIndexBuffer "dx_CreateIndexBuffer" int,int
#func global DeleteIndexBuffer "dx_DeleteIndexBuffer" int
#func global InitIndexBuffer "dx_InitIndexBuffer" 
#func global SetIndexBufferData "dx_SetIndexBufferData" int,sptr,int,int
#func global GetMaxPrimitiveCount "dx_GetMaxPrimitiveCount" 
#func global GetMaxVertexIndex "dx_GetMaxVertexIndex" 
#func global GetValidShaderVersion "dx_GetValidShaderVersion" 
#func global LoadVertexShader "dx_LoadVertexShader" str
#func global LoadPixelShader "dx_LoadPixelShader" str
#func global LoadVertexShaderFromMem "dx_LoadVertexShaderFromMem" sptr,int
#func global LoadPixelShaderFromMem "dx_LoadPixelShaderFromMem" sptr,int
#func global DeleteShader "dx_DeleteShader" int
#func global InitShader "dx_InitShader" 
#func global GetConstIndexToShader "dx_GetConstIndexToShader" str,int
#func global GetConstCountToShader "dx_GetConstCountToShader" str,int
#func global GetConstDefaultParamFToShader "dx_GetConstDefaultParamFToShader" str,int
#func global SetVSConstSF "dx_SetVSConstSF" int,float
#func global SetVSConstF "dx_SetVSConstF" int,float,float,float,float
#func global SetVSConstFMtx "dx_SetVSConstFMtx" int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global SetVSConstFMtxT "dx_SetVSConstFMtxT" int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global SetVSConstSI "dx_SetVSConstSI" int,int
#func global SetVSConstI "dx_SetVSConstI" int,int,int,int,int
#func global SetVSConstB "dx_SetVSConstB" int,int
#func global SetVSConstSFArray "dx_SetVSConstSFArray" int,sptr,int
#func global SetVSConstFArray "dx_SetVSConstFArray" int,sptr,int
#func global SetVSConstFMtxArray "dx_SetVSConstFMtxArray" int,sptr,int
#func global SetVSConstFMtxTArray "dx_SetVSConstFMtxTArray" int,sptr,int
#func global SetVSConstSIArray "dx_SetVSConstSIArray" int,sptr,int
#func global SetVSConstIArray "dx_SetVSConstIArray" int,sptr,int
#func global SetVSConstBArray "dx_SetVSConstBArray" int,sptr,int
#func global ResetVSConstF "dx_ResetVSConstF" int,int
#func global ResetVSConstI "dx_ResetVSConstI" int,int
#func global ResetVSConstB "dx_ResetVSConstB" int,int
#func global SetPSConstSF "dx_SetPSConstSF" int,float
#func global SetPSConstF "dx_SetPSConstF" int,float,float,float,float
#func global SetPSConstFMtx "dx_SetPSConstFMtx" int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global SetPSConstFMtxT "dx_SetPSConstFMtxT" int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global SetPSConstSI "dx_SetPSConstSI" int,int
#func global SetPSConstI "dx_SetPSConstI" int,int,int,int,int
#func global SetPSConstB "dx_SetPSConstB" int,int
#func global SetPSConstSFArray "dx_SetPSConstSFArray" int,sptr,int
#func global SetPSConstFArray "dx_SetPSConstFArray" int,sptr,int
#func global SetPSConstFMtxArray "dx_SetPSConstFMtxArray" int,sptr,int
#func global SetPSConstFMtxTArray "dx_SetPSConstFMtxTArray" int,sptr,int
#func global SetPSConstSIArray "dx_SetPSConstSIArray" int,sptr,int
#func global SetPSConstIArray "dx_SetPSConstIArray" int,sptr,int
#func global SetPSConstBArray "dx_SetPSConstBArray" int,sptr,int
#func global ResetPSConstF "dx_ResetPSConstF" int,int
#func global ResetPSConstI "dx_ResetPSConstI" int,int
#func global ResetPSConstB "dx_ResetPSConstB" int,int
#func global SetRenderTargetToShader "dx_SetRenderTargetToShader" int,int,int
#func global SetUseTextureToShader "dx_SetUseTextureToShader" int,int
#func global SetUseVertexShader "dx_SetUseVertexShader" int
#func global SetUsePixelShader "dx_SetUsePixelShader" int
#func global CalcPolygonBinormalAndTangentsToShader "dx_CalcPolygonBinormalAndTangentsToShader" sptr,int
#func global CalcPolygonIndexedBinormalAndTangentsToShader "dx_CalcPolygonIndexedBinormalAndTangentsToShader" sptr,int,sptr,int
#func global DrawPolygon2DToShader "dx_DrawPolygon2DToShader" sptr,int
#func global DrawPolygon3DToShader "dx_DrawPolygon3DToShader" sptr,int
#func global DrawPolygonIndexed2DToShader "dx_DrawPolygonIndexed2DToShader" sptr,int,sptr,int
#func global DrawPolygonIndexed3DToShader "dx_DrawPolygonIndexed3DToShader" sptr,int,sptr,int
#func global DrawPrimitive2DToShader "dx_DrawPrimitive2DToShader" sptr,int,int
#func global DrawPrimitive3DToShader "dx_DrawPrimitive3DToShader" sptr,int,int
#func global DrawPrimitiveIndexed2DToShader "dx_DrawPrimitiveIndexed2DToShader" sptr,int,sptr,int,int
#func global DrawPrimitiveIndexed3DToShader "dx_DrawPrimitiveIndexed3DToShader" sptr,int,sptr,int,int
#func global DrawPolygon3DToShader_UseVertexBuffer "dx_DrawPolygon3DToShader_UseVertexBuffer" int
#func global DrawPolygonIndexed3DToShader_UseVertexBuffer "dx_DrawPolygonIndexed3DToShader_UseVertexBuffer" int,int
#func global DrawPrimitive3DToShader_UseVertexBuffer "dx_DrawPrimitive3DToShader_UseVertexBuffer" int,int
#func global DrawPrimitive3DToShader_UseVertexBuffer2 "dx_DrawPrimitive3DToShader_UseVertexBuffer2" int,int,int,int
#func global DrawPrimitiveIndexed3DToShader_UseVertexBuffer "dx_DrawPrimitiveIndexed3DToShader_UseVertexBuffer" int,int,int
#func global DrawPrimitiveIndexed3DToShader_UseVertexBuffer2 "dx_DrawPrimitiveIndexed3DToShader_UseVertexBuffer2" int,int,int,int,int,int,int,int
#func global InitShaderConstantBuffer "dx_InitShaderConstantBuffer" 
#func global CreateShaderConstantBuffer "dx_CreateShaderConstantBuffer" int
#func global DeleteShaderConstantBuffer "dx_DeleteShaderConstantBuffer" int
#func global GetBufferShaderConstantBuffer "dx_GetBufferShaderConstantBuffer" int
#func global UpdateShaderConstantBuffer "dx_UpdateShaderConstantBuffer" int
#func global SetShaderConstantBuffer "dx_SetShaderConstantBuffer" int,int,int
#func global PlayMovie "dx_PlayMovie" str,int,int
#func global OpenMovieToGraph "dx_OpenMovieToGraph" str,int
#func global PlayMovieToGraph "dx_PlayMovieToGraph" int,int,int
#func global PauseMovieToGraph "dx_PauseMovieToGraph" int,int
#func global AddMovieFrameToGraph "dx_AddMovieFrameToGraph" int,int
#func global SeekMovieToGraph "dx_SeekMovieToGraph" int,int
#func global SetPlaySpeedRateMovieToGraph "dx_SetPlaySpeedRateMovieToGraph" int,double
#func global GetMovieStateToGraph "dx_GetMovieStateToGraph" int
#func global SetMovieVolumeToGraph "dx_SetMovieVolumeToGraph" int,int
#func global ChangeMovieVolumeToGraph "dx_ChangeMovieVolumeToGraph" int,int
#func global GetMovieTotalFrameToGraph "dx_GetMovieTotalFrameToGraph" int
#func global TellMovieToGraph "dx_TellMovieToGraph" int
#func global TellMovieToGraphToFrame "dx_TellMovieToGraphToFrame" int
#func global SeekMovieToGraphToFrame "dx_SeekMovieToGraphToFrame" int,int
#func global GetOneFrameTimeMovieToGraph "dx_GetOneFrameTimeMovieToGraph" int
#func global GetLastUpdateTimeMovieToGraph "dx_GetLastUpdateTimeMovieToGraph" int
#func global SetMovieRightImageAlphaFlag "dx_SetMovieRightImageAlphaFlag" int
#func global SetMovieColorA8R8G8B8Flag "dx_SetMovieColorA8R8G8B8Flag" int
#func global SetMovieUseYUVFormatSurfaceFlag "dx_SetMovieUseYUVFormatSurfaceFlag" int
#func global SetCameraNearFar "dx_SetCameraNearFar" float,float
#func global SetCameraNearFarD "dx_SetCameraNearFarD" double,double
#func global SetCameraPositionAndTarget_UpVecY "dx_SetCameraPositionAndTarget_UpVecY" float,float,float,float,float,float
#func global SetCameraPositionAndTarget_UpVecYD "dx_SetCameraPositionAndTarget_UpVecYD" double,double,double,double,double,double
#func global SetCameraPositionAndTargetAndUpVec "dx_SetCameraPositionAndTargetAndUpVec" float,float,float,float,float,float,float,float,float
#func global SetCameraPositionAndTargetAndUpVecD "dx_SetCameraPositionAndTargetAndUpVecD" double,double,double,double,double,double,double,double,double
#func global SetCameraPositionAndAngle "dx_SetCameraPositionAndAngle" float,float,float,float,float,float
#func global SetCameraPositionAndAngleD "dx_SetCameraPositionAndAngleD" double,double,double,double,double,double
#func global SetCameraViewMatrix "dx_SetCameraViewMatrix" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global SetCameraViewMatrixD "dx_SetCameraViewMatrixD" double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
#func global SetCameraScreenCenter "dx_SetCameraScreenCenter" float,float
#func global SetCameraScreenCenterD "dx_SetCameraScreenCenterD" double,double
#func global SetupCamera_Perspective "dx_SetupCamera_Perspective" float
#func global SetupCamera_PerspectiveD "dx_SetupCamera_PerspectiveD" double
#func global SetupCamera_Ortho "dx_SetupCamera_Ortho" float
#func global SetupCamera_OrthoD "dx_SetupCamera_OrthoD" double
#func global SetupCamera_ProjectionMatrix "dx_SetupCamera_ProjectionMatrix" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global SetupCamera_ProjectionMatrixD "dx_SetupCamera_ProjectionMatrixD" double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
#func global SetCameraDotAspect "dx_SetCameraDotAspect" float
#func global SetCameraDotAspectD "dx_SetCameraDotAspectD" double
#func global CheckCameraViewClip "dx_CheckCameraViewClip" float,float,float
#func global CheckCameraViewClipD "dx_CheckCameraViewClipD" double,double,double
#func global CheckCameraViewClip_Dir "dx_CheckCameraViewClip_Dir" float,float,float
#func global CheckCameraViewClip_DirD "dx_CheckCameraViewClip_DirD" double,double,double
#func global CheckCameraViewClip_Box "dx_CheckCameraViewClip_Box" float,float,float,float,float,float
#func global CheckCameraViewClip_BoxD "dx_CheckCameraViewClip_BoxD" double,double,double,double,double,double
#func global GetCameraNear "dx_GetCameraNear" 
#func global GetCameraFar "dx_GetCameraFar" 
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraPosition "dx_GetCameraPosition" var,
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraPositionD "dx_GetCameraPositionD" var,
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraTarget "dx_GetCameraTarget" var,
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraTargetD "dx_GetCameraTargetD" var,
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraUpVector "dx_GetCameraUpVector" var,
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraUpVectorD "dx_GetCameraUpVectorD" var,
#func global GetCameraAngleHRotate "dx_GetCameraAngleHRotate" 
#func global GetCameraAngleVRotate "dx_GetCameraAngleVRotate" 
#func global GetCameraAngleTRotate "dx_GetCameraAngleTRotate" 
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraViewMatrix "dx_GetCameraViewMatrix" var,
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraViewMatrixD "dx_GetCameraViewMatrixD" var,
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraBillboardMatrix "dx_GetCameraBillboardMatrix" var,
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraBillboardMatrixD "dx_GetCameraBillboardMatrixD" var,
#func global GetCameraScreenCenter "dx_GetCameraScreenCenter" sptr,sptr
#func global GetCameraScreenCenterD "dx_GetCameraScreenCenterD" sptr,sptr
#func global GetCameraFov "dx_GetCameraFov" 
#func global GetCameraSize "dx_GetCameraSize" 
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraProjectionMatrix "dx_GetCameraProjectionMatrix" var,
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraProjectionMatrixD "dx_GetCameraProjectionMatrixD" var,
#func global GetCameraDotAspect "dx_GetCameraDotAspect" 
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraViewportMatrix "dx_GetCameraViewportMatrix" var,
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraViewportMatrixD "dx_GetCameraViewportMatrixD" var,
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraAPIViewportMatrix "dx_GetCameraAPIViewportMatrix" var,
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetCameraAPIViewportMatrixD "dx_GetCameraAPIViewportMatrixD" var,
#func global SetUseLighting "dx_SetUseLighting" int
#func global SetMaterialUseVertDifColor "dx_SetMaterialUseVertDifColor" int
#func global SetMaterialUseVertSpcColor "dx_SetMaterialUseVertSpcColor" int
#func global SetMaterialParam "dx_SetMaterialParam" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global SetUseSpecular "dx_SetUseSpecular" int
#func global SetGlobalAmbientLight "dx_SetGlobalAmbientLight" float,float,float,float
#func global ChangeLightTypeDir "dx_ChangeLightTypeDir" float,float,float
#func global ChangeLightTypeSpot "dx_ChangeLightTypeSpot" float,float,float,float,float,float,float,float,float,float,float,float
#func global ChangeLightTypePoint "dx_ChangeLightTypePoint" float,float,float,float,float,float,float
#func global GetLightType "dx_GetLightType" 
#func global SetLightEnable "dx_SetLightEnable" int
#func global GetLightEnable "dx_GetLightEnable" 
#func global SetLightDifColor "dx_SetLightDifColor" float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightDifColor "dx_GetLightDifColor" var,
#func global SetLightSpcColor "dx_SetLightSpcColor" float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightSpcColor "dx_GetLightSpcColor" var,
#func global SetLightAmbColor "dx_SetLightAmbColor" float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightAmbColor "dx_GetLightAmbColor" var,
#func global SetLightDirection "dx_SetLightDirection" float,float,float
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightDirection "dx_GetLightDirection" var,
#func global SetLightPosition "dx_SetLightPosition" float,float,float
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightPosition "dx_GetLightPosition" var,
#func global SetLightRangeAtten "dx_SetLightRangeAtten" float,float,float,float
#func global GetLightRangeAtten "dx_GetLightRangeAtten" sptr,sptr,sptr,sptr
#func global SetLightAngle "dx_SetLightAngle" float,float
#func global GetLightAngle "dx_GetLightAngle" sptr,sptr
#func global SetLightUseShadowMap "dx_SetLightUseShadowMap" int,int
#func global CreateDirLightHandle "dx_CreateDirLightHandle" float,float,float
#func global CreateSpotLightHandle "dx_CreateSpotLightHandle" float,float,float,float,float,float,float,float,float,float,float,float
#func global CreatePointLightHandle "dx_CreatePointLightHandle" float,float,float,float,float,float,float
#func global DeleteLightHandle "dx_DeleteLightHandle" int
#func global DeleteLightHandleAll "dx_DeleteLightHandleAll" 
#func global SetLightTypeHandle "dx_SetLightTypeHandle" int,int
#func global SetLightEnableHandle "dx_SetLightEnableHandle" int,int
#func global SetLightDifColorHandle "dx_SetLightDifColorHandle" int,float,float,float,float
#func global SetLightSpcColorHandle "dx_SetLightSpcColorHandle" int,float,float,float,float
#func global SetLightAmbColorHandle "dx_SetLightAmbColorHandle" int,float,float,float,float
#func global SetLightDirectionHandle "dx_SetLightDirectionHandle" int,float,float,float
#func global SetLightPositionHandle "dx_SetLightPositionHandle" int,float,float,float
#func global SetLightRangeAttenHandle "dx_SetLightRangeAttenHandle" int,float,float,float,float
#func global SetLightAngleHandle "dx_SetLightAngleHandle" int,float,float
#func global SetLightUseShadowMapHandle "dx_SetLightUseShadowMapHandle" int,int,int
#func global GetLightTypeHandle "dx_GetLightTypeHandle" int
#func global GetLightEnableHandle "dx_GetLightEnableHandle" int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightDifColorHandle "dx_GetLightDifColorHandle" var,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightSpcColorHandle "dx_GetLightSpcColorHandle" var,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightAmbColorHandle "dx_GetLightAmbColorHandle" var,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightDirectionHandle "dx_GetLightDirectionHandle" var,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetLightPositionHandle "dx_GetLightPositionHandle" var,int
#func global GetLightRangeAttenHandle "dx_GetLightRangeAttenHandle" int,sptr,sptr,sptr,sptr
#func global GetLightAngleHandle "dx_GetLightAngleHandle" int,sptr,sptr
#func global GetEnableLightHandleNum "dx_GetEnableLightHandleNum" 
#func global GetEnableLightHandle "dx_GetEnableLightHandle" int
#func global GetTexFormatIndex "dx_GetTexFormatIndex" sptr
#func global CreateMaskScreen "dx_CreateMaskScreen" 
#func global DeleteMaskScreen "dx_DeleteMaskScreen" 
#func global DrawMaskToDirectData "dx_DrawMaskToDirectData" int,int,int,int,sptr,int
#func global DrawFillMaskToDirectData "dx_DrawFillMaskToDirectData" int,int,int,int,int,int,sptr
#func global SetUseMaskScreenFlag "dx_SetUseMaskScreenFlag" int
#func global GetUseMaskScreenFlag "dx_GetUseMaskScreenFlag" 
#func global FillMaskScreen "dx_FillMaskScreen" int
#func global SetMaskScreenGraph "dx_SetMaskScreenGraph" int
#func global InitMask "dx_InitMask" 
#func global MakeMask "dx_MakeMask" int,int
#func global GetMaskSize "dx_GetMaskSize" sptr,sptr,int
#func global SetDataToMask "dx_SetDataToMask" int,int,sptr,int
#func global DeleteMask "dx_DeleteMask" int
#func global LoadMask "dx_LoadMask" str
#func global LoadDivMask "dx_LoadDivMask" str,int,int,int,int,int,sptr
#func global CreateMaskFromMem "dx_CreateMaskFromMem" sptr,int
#func global CreateDivMaskFromMem "dx_CreateDivMaskFromMem" sptr,int,int,int,int,int,int,sptr
#func global DrawMask "dx_DrawMask" int,int,int,int
#func global DrawStringMask "dx_DrawStringMask" int,int,int,str
#func global DrawStringMaskToHandle "dx_DrawStringMaskToHandle" int,int,int,int,str
#func global DrawFillMask "dx_DrawFillMask" int,int,int,int,int
#func global SetMaskReverseEffectFlag "dx_SetMaskReverseEffectFlag" int
#func global GetMaskScreenData "dx_GetMaskScreenData" int,int,int,int,int
#func global GetMaskUseFlag "dx_GetMaskUseFlag" 
#func global EnumFontName "dx_EnumFontName" str,int,int
#func global EnumFontNameEx "dx_EnumFontNameEx" str,int,int
#func global EnumFontNameEx2 "dx_EnumFontNameEx2" str,int,str,int
#func global CheckFontName "dx_CheckFontName" str,int
#func global InitFontToHandle "dx_InitFontToHandle" 
#func global CreateFontToHandle "dx_CreateFontToHandle" str,int,int,int,int,int,int,int
#func global LoadFontDataToHandle "dx_LoadFontDataToHandle" str,int
#func global LoadFontDataFromMemToHandle "dx_LoadFontDataFromMemToHandle" sptr,int,int
#func global SetFontSpaceToHandle "dx_SetFontSpaceToHandle" int,int
#func global SetFontCharCodeFormatToHandle "dx_SetFontCharCodeFormatToHandle" int,int
#func global DeleteFontToHandle "dx_DeleteFontToHandle" int
#func global SetFontLostFlag "dx_SetFontLostFlag" int,sptr
#func global AddFontImageToHandle "dx_AddFontImageToHandle" int,str,int,int,int,int
#func global SubFontImageToHandle "dx_SubFontImageToHandle" int,str
#func global ChangeFont "dx_ChangeFont" str,int
#func global ChangeFontType "dx_ChangeFontType" int
#func global SetFontSize "dx_SetFontSize" int
#func global GetFontSize "dx_GetFontSize" 
#func global SetFontThickness "dx_SetFontThickness" int
#func global SetFontSpace "dx_SetFontSpace" int
#func global GetFontSpace "dx_GetFontSpace" 
#func global SetFontCharCodeFormat "dx_SetFontCharCodeFormat" int
#func global SetDefaultFontState "dx_SetDefaultFontState" str,int,int,int,int,int,int
#func global GetDefaultFontHandle "dx_GetDefaultFontHandle" 
#func global GetFontMaxWidth "dx_GetFontMaxWidth" 
#func global GetDrawStringWidth "dx_GetDrawStringWidth" str,int,int
#func global GetDrawExtendStringWidth "dx_GetDrawExtendStringWidth" double,str,int,int
#func global GetFontMaxWidthToHandle "dx_GetFontMaxWidthToHandle" int
#func global GetFontSizeToHandle "dx_GetFontSizeToHandle" int
#func global GetFontSpaceToHandle "dx_GetFontSpaceToHandle" int
#func global GetFontCharInfo "dx_GetFontCharInfo" int,str,sptr,sptr,sptr,sptr,sptr
#func global GetDrawStringWidthToHandle "dx_GetDrawStringWidthToHandle" str,int,int,int
#func global GetDrawExtendStringWidthToHandle "dx_GetDrawExtendStringWidthToHandle" double,str,int,int,int
#func global GetFontStateToHandle "dx_GetFontStateToHandle" str,sptr,sptr,int,sptr,sptr,sptr,sptr
#func global CheckFontCacheToTextureFlag "dx_CheckFontCacheToTextureFlag" int
#func global CheckFontChacheToTextureFlag "dx_CheckFontChacheToTextureFlag" int
#func global CheckFontHandleValid "dx_CheckFontHandleValid" int
#func global SetFontCacheToTextureFlag "dx_SetFontCacheToTextureFlag" int
#func global GetFontCacheToTextureFlag "dx_GetFontCacheToTextureFlag" 
#func global SetFontChacheToTextureFlag "dx_SetFontChacheToTextureFlag" int
#func global GetFontChacheToTextureFlag "dx_GetFontChacheToTextureFlag" 
#func global SetFontCacheTextureColorBitDepth "dx_SetFontCacheTextureColorBitDepth" int
#func global GetFontCacheTextureColorBitDepth "dx_GetFontCacheTextureColorBitDepth" 
#func global SetFontCacheCharNum "dx_SetFontCacheCharNum" int
#func global GetFontCacheCharNum "dx_GetFontCacheCharNum" 
#func global SetFontCacheUsePremulAlphaFlag "dx_SetFontCacheUsePremulAlphaFlag" int
#func global GetFontCacheUsePremulAlphaFlag "dx_GetFontCacheUsePremulAlphaFlag" 
#func global MultiByteCharCheck "dx_MultiByteCharCheck" str,int
#func global DrawString "dx_DrawString" int,int,str,int,int
#func global DrawVString "dx_DrawVString" int,int,str,int,int
#func global DrawExtendString "dx_DrawExtendString" int,int,double,double,str,int,int
#func global DrawExtendVString "dx_DrawExtendVString" int,int,double,double,str,int,int
#func global DrawRotaString "dx_DrawRotaString" int,int,double,double,double,double,double,int,int,int,str
#func global DrawStringF "dx_DrawStringF" float,float,str,int,int
#func global DrawVStringF "dx_DrawVStringF" float,float,str,int,int
#func global DrawExtendStringF "dx_DrawExtendStringF" float,float,double,double,str,int,int
#func global DrawExtendVStringF "dx_DrawExtendVStringF" float,float,double,double,str,int,int
#func global DrawRotaStringF "dx_DrawRotaStringF" float,float,double,double,double,double,double,int,int,int,str
#func global DrawNumberToI "dx_DrawNumberToI" int,int,int,int,int,int
#func global DrawNumberToF "dx_DrawNumberToF" int,int,double,int,int,int
#func global DrawNumberPlusToI "dx_DrawNumberPlusToI" int,int,str,int,int,int,int
#func global DrawNumberPlusToF "dx_DrawNumberPlusToF" int,int,str,double,int,int,int
#func global DrawStringToZBuffer "dx_DrawStringToZBuffer" int,int,str,int
#func global DrawVStringToZBuffer "dx_DrawVStringToZBuffer" int,int,str,int
#func global DrawExtendStringToZBuffer "dx_DrawExtendStringToZBuffer" int,int,double,double,str,int
#func global DrawExtendVStringToZBuffer "dx_DrawExtendVStringToZBuffer" int,int,double,double,str,int
#func global DrawStringToHandle "dx_DrawStringToHandle" int,int,str,int,int,int,int
#func global DrawVStringToHandle "dx_DrawVStringToHandle" int,int,str,int,int,int
#func global DrawExtendStringToHandle "dx_DrawExtendStringToHandle" int,int,double,double,str,int,int,int,int
#func global DrawExtendVStringToHandle "dx_DrawExtendVStringToHandle" int,int,double,double,str,int,int,int
#func global DrawRotaStringToHandle "dx_DrawRotaStringToHandle" int,int,double,double,double,double,double,int,int,int,int,str
#func global DrawStringFToHandle "dx_DrawStringFToHandle" float,float,str,int,int,int,int
#func global DrawVStringFToHandle "dx_DrawVStringFToHandle" float,float,str,int,int,int
#func global DrawExtendStringFToHandle "dx_DrawExtendStringFToHandle" float,float,double,double,str,int,int,int,int
#func global DrawExtendVStringFToHandle "dx_DrawExtendVStringFToHandle" float,float,double,double,str,int,int,int
#func global DrawRotaStringFToHandle "dx_DrawRotaStringFToHandle" float,float,double,double,double,double,double,int,int,int,int,str
#func global DrawNumberToIToHandle "dx_DrawNumberToIToHandle" int,int,int,int,int,int,int
#func global DrawNumberToFToHandle "dx_DrawNumberToFToHandle" int,int,double,int,int,int,int
#func global DrawNumberPlusToIToHandle "dx_DrawNumberPlusToIToHandle" int,int,str,int,int,int,int,int
#func global DrawNumberPlusToFToHandle "dx_DrawNumberPlusToFToHandle" int,int,str,double,int,int,int,int
#func global DrawStringToHandleToZBuffer "dx_DrawStringToHandleToZBuffer" int,int,str,int,int,int
#func global DrawVStringToHandleToZBuffer "dx_DrawVStringToHandleToZBuffer" int,int,str,int,int
#func global DrawExtendStringToHandleToZBuffer "dx_DrawExtendStringToHandleToZBuffer" int,int,double,double,str,int,int,int
#func global DrawExtendVStringToHandleToZBuffer "dx_DrawExtendVStringToHandleToZBuffer" int,int,double,double,str,int,int
#func global ConvertMatrixFtoD "dx_ConvertMatrixFtoD" sptr,sptr
#func global ConvertMatrixDtoF "dx_ConvertMatrixDtoF" sptr,sptr
#func global CreateIdentityMatrix "dx_CreateIdentityMatrix" sptr
#func global CreateIdentityMatrixD "dx_CreateIdentityMatrixD" sptr
#func global CreateLookAtMatrix "dx_CreateLookAtMatrix" sptr,sptr,sptr,sptr
#func global CreateLookAtMatrixD "dx_CreateLookAtMatrixD" sptr,sptr,sptr,sptr
#func global CreateLookAtMatrix2 "dx_CreateLookAtMatrix2" sptr,sptr,double,double
#func global CreateLookAtMatrix2D "dx_CreateLookAtMatrix2D" sptr,sptr,double,double
#func global CreateLookAtMatrixRH "dx_CreateLookAtMatrixRH" sptr,sptr,sptr,sptr
#func global CreateLookAtMatrixRHD "dx_CreateLookAtMatrixRHD" sptr,sptr,sptr,sptr
#func global CreateMultiplyMatrix "dx_CreateMultiplyMatrix" sptr,sptr,sptr
#func global CreateMultiplyMatrixD "dx_CreateMultiplyMatrixD" sptr,sptr,sptr
#func global CreatePerspectiveFovMatrix "dx_CreatePerspectiveFovMatrix" sptr,float,float,float,float
#func global CreatePerspectiveFovMatrixD "dx_CreatePerspectiveFovMatrixD" sptr,double,double,double,double
#func global CreatePerspectiveFovMatrixRH "dx_CreatePerspectiveFovMatrixRH" sptr,float,float,float,float
#func global CreatePerspectiveFovMatrixRHD "dx_CreatePerspectiveFovMatrixRHD" sptr,double,double,double,double
#func global CreateOrthoMatrix "dx_CreateOrthoMatrix" sptr,float,float,float,float
#func global CreateOrthoMatrixD "dx_CreateOrthoMatrixD" sptr,double,double,double,double
#func global CreateOrthoMatrixRH "dx_CreateOrthoMatrixRH" sptr,float,float,float,float
#func global CreateOrthoMatrixRHD "dx_CreateOrthoMatrixRHD" sptr,double,double,double,double
#func global CreateScalingMatrix "dx_CreateScalingMatrix" sptr,float,float,float
#func global CreateScalingMatrixD "dx_CreateScalingMatrixD" sptr,double,double,double
#func global CreateRotationXMatrix "dx_CreateRotationXMatrix" sptr,float
#func global CreateRotationXMatrixD "dx_CreateRotationXMatrixD" sptr,double
#func global CreateRotationYMatrix "dx_CreateRotationYMatrix" sptr,float
#func global CreateRotationYMatrixD "dx_CreateRotationYMatrixD" sptr,double
#func global CreateRotationZMatrix "dx_CreateRotationZMatrix" sptr,float
#func global CreateRotationZMatrixD "dx_CreateRotationZMatrixD" sptr,double
#func global CreateTranslationMatrix "dx_CreateTranslationMatrix" sptr,float,float,float
#func global CreateTranslationMatrixD "dx_CreateTranslationMatrixD" sptr,double,double,double
#func global CreateTransposeMatrix "dx_CreateTransposeMatrix" sptr,sptr
#func global CreateTransposeMatrixD "dx_CreateTransposeMatrixD" sptr,sptr
#func global CreateInverseMatrix "dx_CreateInverseMatrix" sptr,sptr
#func global CreateInverseMatrixD "dx_CreateInverseMatrixD" sptr,sptr
#func global CreateViewportMatrix "dx_CreateViewportMatrix" sptr,float,float,float,float
#func global CreateViewportMatrixD "dx_CreateViewportMatrixD" sptr,double,double,double,double
#func global CreateRotationXYZMatrix "dx_CreateRotationXYZMatrix" sptr,float,float,float
#func global CreateRotationXYZMatrixD "dx_CreateRotationXYZMatrixD" sptr,double,double,double
#func global CreateRotationXZYMatrix "dx_CreateRotationXZYMatrix" sptr,float,float,float
#func global CreateRotationXZYMatrixD "dx_CreateRotationXZYMatrixD" sptr,double,double,double
#func global CreateRotationYXZMatrix "dx_CreateRotationYXZMatrix" sptr,float,float,float
#func global CreateRotationYXZMatrixD "dx_CreateRotationYXZMatrixD" sptr,double,double,double
#func global CreateRotationYZXMatrix "dx_CreateRotationYZXMatrix" sptr,float,float,float
#func global CreateRotationYZXMatrixD "dx_CreateRotationYZXMatrixD" sptr,double,double,double
#func global CreateRotationZXYMatrix "dx_CreateRotationZXYMatrix" sptr,float,float,float
#func global CreateRotationZXYMatrixD "dx_CreateRotationZXYMatrixD" sptr,double,double,double
#func global CreateRotationZYXMatrix "dx_CreateRotationZYXMatrix" sptr,float,float,float
#func global CreateRotationZYXMatrixD "dx_CreateRotationZYXMatrixD" sptr,double,double,double
#func global GetMatrixXYZRotation "dx_GetMatrixXYZRotation" sptr,sptr,sptr,sptr
#func global GetMatrixXYZRotationD "dx_GetMatrixXYZRotationD" sptr,sptr,sptr,sptr
#func global GetMatrixXZYRotation "dx_GetMatrixXZYRotation" sptr,sptr,sptr,sptr
#func global GetMatrixXZYRotationD "dx_GetMatrixXZYRotationD" sptr,sptr,sptr,sptr
#func global GetMatrixYXZRotation "dx_GetMatrixYXZRotation" sptr,sptr,sptr,sptr
#func global GetMatrixYXZRotationD "dx_GetMatrixYXZRotationD" sptr,sptr,sptr,sptr
#func global GetMatrixYZXRotation "dx_GetMatrixYZXRotation" sptr,sptr,sptr,sptr
#func global GetMatrixYZXRotationD "dx_GetMatrixYZXRotationD" sptr,sptr,sptr,sptr
#func global GetMatrixZXYRotation "dx_GetMatrixZXYRotation" sptr,sptr,sptr,sptr
#func global GetMatrixZXYRotationD "dx_GetMatrixZXYRotationD" sptr,sptr,sptr,sptr
#func global GetMatrixZYXRotation "dx_GetMatrixZYXRotation" sptr,sptr,sptr,sptr
#func global GetMatrixZYXRotationD "dx_GetMatrixZYXRotationD" sptr,sptr,sptr,sptr
#func global VectorConvertFtoD "dx_VectorConvertFtoD" sptr,sptr
#func global VectorConvertDtoF "dx_VectorConvertDtoF" sptr,sptr
#func global VectorNormalize "dx_VectorNormalize" sptr,sptr
#func global VectorNormalizeD "dx_VectorNormalizeD" sptr,sptr
#func global VectorScale "dx_VectorScale" sptr,sptr,float
#func global VectorScaleD "dx_VectorScaleD" sptr,sptr,double
#func global VectorMultiply "dx_VectorMultiply" sptr,sptr,sptr
#func global VectorMultiplyD "dx_VectorMultiplyD" sptr,sptr,sptr
#func global VectorSub "dx_VectorSub" sptr,sptr,sptr
#func global VectorSubD "dx_VectorSubD" sptr,sptr,sptr
#func global VectorAdd "dx_VectorAdd" sptr,sptr,sptr
#func global VectorAddD "dx_VectorAddD" sptr,sptr,sptr
#func global VectorOuterProduct "dx_VectorOuterProduct" sptr,sptr,sptr
#func global VectorOuterProductD "dx_VectorOuterProductD" sptr,sptr,sptr
#func global VectorInnerProduct "dx_VectorInnerProduct" sptr,sptr
#func global VectorRotationX "dx_VectorRotationX" sptr,sptr,double
#func global VectorRotationXD "dx_VectorRotationXD" sptr,sptr,double
#func global VectorRotationY "dx_VectorRotationY" sptr,sptr,double
#func global VectorRotationYD "dx_VectorRotationYD" sptr,sptr,double
#func global VectorRotationZ "dx_VectorRotationZ" sptr,sptr,double
#func global VectorRotationZD "dx_VectorRotationZD" sptr,sptr,double
#func global VectorTransform "dx_VectorTransform" sptr,sptr,sptr
#func global VectorTransformD "dx_VectorTransformD" sptr,sptr,sptr
#func global VectorTransformSR "dx_VectorTransformSR" sptr,sptr,sptr
#func global VectorTransformSRD "dx_VectorTransformSRD" sptr,sptr,sptr
#func global VectorTransform4 "dx_VectorTransform4" sptr,sptr,sptr,sptr,sptr
#func global VectorTransform4D "dx_VectorTransform4D" sptr,sptr,sptr,sptr,sptr
#func global Segment_Segment_Analyse "dx_Segment_Segment_Analyse" sptr,sptr,sptr,sptr,sptr
#func global Segment_Segment_AnalyseD "dx_Segment_Segment_AnalyseD" sptr,sptr,sptr,sptr,sptr
#func global Segment_Point_Analyse "dx_Segment_Point_Analyse" sptr,sptr,sptr,sptr
#func global Segment_Point_AnalyseD "dx_Segment_Point_AnalyseD" sptr,sptr,sptr,sptr
#func global Segment_Triangle_Analyse "dx_Segment_Triangle_Analyse" sptr,sptr,sptr,sptr,sptr,sptr
#func global Segment_Triangle_AnalyseD "dx_Segment_Triangle_AnalyseD" sptr,sptr,sptr,sptr,sptr,sptr
#func global Triangle_Point_Analyse "dx_Triangle_Point_Analyse" sptr,sptr,sptr,sptr,sptr
#func global Triangle_Point_AnalyseD "dx_Triangle_Point_AnalyseD" sptr,sptr,sptr,sptr,sptr
#func global Plane_Point_Analyse "dx_Plane_Point_Analyse" sptr,sptr,sptr,sptr
#func global Plane_Point_AnalyseD "dx_Plane_Point_AnalyseD" sptr,sptr,sptr,sptr
#func global TriangleBarycenter "dx_TriangleBarycenter" float,float,float,float,float,float,float,float,float,float,float,float,sptr,sptr,sptr
#func global TriangleBarycenterD "dx_TriangleBarycenterD" double,double,double,double,double,double,double,double,double,double,double,double,sptr,sptr,sptr
#func global Segment_Segment_MinLength "dx_Segment_Segment_MinLength" float,float,float,float,float,float,float,float,float,float,float,float
#func global Segment_Segment_MinLength_Square "dx_Segment_Segment_MinLength_Square" float,float,float,float,float,float,float,float,float,float,float,float
#func global Segment_Triangle_MinLength "dx_Segment_Triangle_MinLength" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global Segment_Triangle_MinLength_Square "dx_Segment_Triangle_MinLength_Square" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global Segment_Point_MinLength "dx_Segment_Point_MinLength" float,float,float,float,float,float,float,float,float
#func global Segment_Point_MinLength_Square "dx_Segment_Point_MinLength_Square" float,float,float,float,float,float,float,float,float
#func global Triangle_Point_MinLength "dx_Triangle_Point_MinLength" float,float,float,float,float,float,float,float,float,float,float,float
#func global Triangle_Point_MinLength_Square "dx_Triangle_Point_MinLength_Square" float,float,float,float,float,float,float,float,float,float,float,float
#func global Triangle_Triangle_MinLength "dx_Triangle_Triangle_MinLength" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global Triangle_Triangle_MinLength_Square "dx_Triangle_Triangle_MinLength_Square" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global Plane_Point_MinLength_Position "dx_Plane_Point_MinLength_Position" var,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global Plane_Point_MinLength_PositionD "dx_Plane_Point_MinLength_PositionD" var,double,double,double,double,double,double,double,double,double
#func global Plane_Point_MinLength "dx_Plane_Point_MinLength" float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（HITRESULT_LINE）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global HitCheck_Line_Triangle "dx_HitCheck_Line_Triangle" var,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Triangle_Triangle "dx_HitCheck_Triangle_Triangle" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Triangle_TriangleD "dx_HitCheck_Triangle_TriangleD" double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（HITRESULT_LINE）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global HitCheck_Line_Cube "dx_HitCheck_Line_Cube" var,float,float,float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Line_Sphere "dx_HitCheck_Line_Sphere" float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Line_SphereD "dx_HitCheck_Line_SphereD" double,double,double,double,double,double,double,double,double,double
#func global HitCheck_Sphere_Sphere "dx_HitCheck_Sphere_Sphere" float,float,float,float,float,float,float,float
#func global HitCheck_Sphere_SphereD "dx_HitCheck_Sphere_SphereD" double,double,double,double,double,double,double,double
#func global HitCheck_Sphere_Capsule "dx_HitCheck_Sphere_Capsule" float,float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Sphere_CapsuleD "dx_HitCheck_Sphere_CapsuleD" double,double,double,double,double,double,double,double,double,double,double
#func global HitCheck_Sphere_Triangle "dx_HitCheck_Sphere_Triangle" float,float,float,float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Sphere_TriangleD "dx_HitCheck_Sphere_TriangleD" double,double,double,double,double,double,double,double,double,double,double,double,double
#func global HitCheck_Capsule_Capsule "dx_HitCheck_Capsule_Capsule" float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Capsule_CapsuleD "dx_HitCheck_Capsule_CapsuleD" double,double,double,double,double,double,double,double,double,double,double,double,double,double
#func global HitCheck_Capsule_Triangle "dx_HitCheck_Capsule_Triangle" float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global HitCheck_Capsule_TriangleD "dx_HitCheck_Capsule_TriangleD" double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
#func global RectClipping "dx_RectClipping" sptr,sptr
#func global RectAdjust "dx_RectAdjust" sptr
#func global GetRectSize "dx_GetRectSize" sptr,sptr,sptr
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetIdent "dx_MGetIdent" var,
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetIdentD "dx_MGetIdentD" var,
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MMult "dx_MMult" var,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MMultD "dx_MMultD" var,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MScale "dx_MScale" var,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MScaleD "dx_MScaleD" var,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MAdd "dx_MAdd" var,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MAddD "dx_MAddD" var,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetScale "dx_MGetScale" var,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetScaleD "dx_MGetScaleD" var,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotX "dx_MGetRotX" var,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotXD "dx_MGetRotXD" var,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotY "dx_MGetRotY" var,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotYD "dx_MGetRotYD" var,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotZ "dx_MGetRotZ" var,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotZD "dx_MGetRotZD" var,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotAxis "dx_MGetRotAxis" var,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotAxisD "dx_MGetRotAxisD" var,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotVec2 "dx_MGetRotVec2" var,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetRotVec2D "dx_MGetRotVec2D" var,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetTranslate "dx_MGetTranslate" var,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetTranslateD "dx_MGetTranslateD" var,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetAxis1 "dx_MGetAxis1" var,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetAxis1D "dx_MGetAxis1D" var,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetAxis2 "dx_MGetAxis2" var,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetAxis2D "dx_MGetAxis2D" var,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MTranspose "dx_MTranspose" var,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MTransposeD "dx_MTransposeD" var,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MInverse "dx_MInverse" var,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MInverseD "dx_MInverseD" var,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetSize "dx_MGetSize" var,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MGetSizeD "dx_MGetSizeD" var,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global VNorm "dx_VNorm" var,float,float,float
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global VNormD "dx_VNormD" var,double,double,double
#func global VSize "dx_VSize" float,float,float
#func global VCos "dx_VCos" float,float,float,float,float,float
#func global VRad "dx_VRad" float,float,float,float,float,float
#func global GetImageSize_File "dx_GetImageSize_File" str,sptr,sptr
#func global GetImageSize_Mem "dx_GetImageSize_Mem" sptr,int,sptr,sptr
#func global SetUseFastLoadFlag "dx_SetUseFastLoadFlag" int
#func global SetGraphDataShavedMode "dx_SetGraphDataShavedMode" int
#func global GetGraphDataShavedMode "dx_GetGraphDataShavedMode" 
#func global SetUsePremulAlphaConvertLoad "dx_SetUsePremulAlphaConvertLoad" int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetColorF "dx_GetColorF" var,float,float,float,float
// 戻り値が構造体です（COLOR_U8）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global GetColorU8 "dx_GetColorU8" var,int,int,int,int
#func global GetColor "dx_GetColor" int,int,int
#func global GetColor2 "dx_GetColor2" int,sptr,sptr,sptr
#func global GetColor3 "dx_GetColor3" sptr,int,int,int,int
#func global GetColor4 "dx_GetColor4" sptr,sptr,int
#func global GetColor5 "dx_GetColor5" sptr,int,sptr,sptr,sptr,sptr
#func global CreatePaletteColorData "dx_CreatePaletteColorData" sptr
#func global CreateARGBF32ColorData "dx_CreateARGBF32ColorData" sptr
#func global CreateARGBF16ColorData "dx_CreateARGBF16ColorData" sptr
#func global CreateXRGB8ColorData "dx_CreateXRGB8ColorData" sptr
#func global CreateARGB8ColorData "dx_CreateARGB8ColorData" sptr
#func global CreateARGB4ColorData "dx_CreateARGB4ColorData" sptr
#func global CreateFullColorData "dx_CreateFullColorData" sptr
#func global CreateGrayColorData "dx_CreateGrayColorData" sptr
#func global CreatePal8ColorData "dx_CreatePal8ColorData" sptr
#func global CreateColorData "dx_CreateColorData" sptr,int,int,int,int,int,int,int,int
#func global SetColorDataNoneMask "dx_SetColorDataNoneMask" sptr
#func global CmpColorData "dx_CmpColorData" sptr,sptr
#func global InitSoftImage "dx_InitSoftImage" 
#func global LoadSoftImage "dx_LoadSoftImage" str
#func global LoadSoftImageToMem "dx_LoadSoftImageToMem" sptr,int
#func global MakeSoftImage "dx_MakeSoftImage" int,int
#func global MakeARGBF32ColorSoftImage "dx_MakeARGBF32ColorSoftImage" int,int
#func global MakeARGBF16ColorSoftImage "dx_MakeARGBF16ColorSoftImage" int,int
#func global MakeARGB8ColorSoftImage "dx_MakeARGB8ColorSoftImage" int,int
#func global MakeXRGB8ColorSoftImage "dx_MakeXRGB8ColorSoftImage" int,int
#func global MakeARGB4ColorSoftImage "dx_MakeARGB4ColorSoftImage" int,int
#func global MakeRGB8ColorSoftImage "dx_MakeRGB8ColorSoftImage" int,int
#func global MakePAL8ColorSoftImage "dx_MakePAL8ColorSoftImage" int,int
#func global DeleteSoftImage "dx_DeleteSoftImage" int
#func global GetSoftImageSize "dx_GetSoftImageSize" int,sptr,sptr
#func global CheckPaletteSoftImage "dx_CheckPaletteSoftImage" int
#func global CheckAlphaSoftImage "dx_CheckAlphaSoftImage" int
#func global CheckPixelAlphaSoftImage "dx_CheckPixelAlphaSoftImage" int
#func global GetDrawScreenSoftImage "dx_GetDrawScreenSoftImage" int,int,int,int,int
#func global GetDrawScreenSoftImageDestPos "dx_GetDrawScreenSoftImageDestPos" int,int,int,int,int,int,int
#func global FillSoftImage "dx_FillSoftImage" int,int,int,int,int
#func global ClearRectSoftImage "dx_ClearRectSoftImage" int,int,int,int,int
#func global GetPaletteSoftImage "dx_GetPaletteSoftImage" int,int,sptr,sptr,sptr,sptr
#func global SetPaletteSoftImage "dx_SetPaletteSoftImage" int,int,int,int,int,int
#func global DrawPixelPalCodeSoftImage "dx_DrawPixelPalCodeSoftImage" int,int,int,int
#func global GetPixelPalCodeSoftImage "dx_GetPixelPalCodeSoftImage" int,int,int
#func global GetImageAddressSoftImage "dx_GetImageAddressSoftImage" int
#func global GetPitchSoftImage "dx_GetPitchSoftImage" int
#func global DrawPixelSoftImage "dx_DrawPixelSoftImage" int,int,int,int,int,int,int
#func global DrawPixelSoftImageF "dx_DrawPixelSoftImageF" int,int,int,float,float,float,float
#func global DrawPixelSoftImage_Unsafe_XRGB8 "dx_DrawPixelSoftImage_Unsafe_XRGB8" int,int,int,int,int,int
#func global DrawPixelSoftImage_Unsafe_ARGB8 "dx_DrawPixelSoftImage_Unsafe_ARGB8" int,int,int,int,int,int,int
#func global GetPixelSoftImage "dx_GetPixelSoftImage" int,int,int,sptr,sptr,sptr,sptr
#func global GetPixelSoftImageF "dx_GetPixelSoftImageF" int,int,int,sptr,sptr,sptr,sptr
#func global GetPixelSoftImage_Unsafe_XRGB8 "dx_GetPixelSoftImage_Unsafe_XRGB8" int,int,int,sptr,sptr,sptr
#func global GetPixelSoftImage_Unsafe_ARGB8 "dx_GetPixelSoftImage_Unsafe_ARGB8" int,int,int,sptr,sptr,sptr,sptr
#func global DrawLineSoftImage "dx_DrawLineSoftImage" int,int,int,int,int,int,int,int,int
#func global DrawCircleSoftImage "dx_DrawCircleSoftImage" int,int,int,int,int,int,int,int,int
#func global BltSoftImage "dx_BltSoftImage" int,int,int,int,int,int,int,int
#func global BltSoftImageWithTransColor "dx_BltSoftImageWithTransColor" int,int,int,int,int,int,int,int,int,int,int,int
#func global BltSoftImageWithAlphaBlend "dx_BltSoftImageWithAlphaBlend" int,int,int,int,int,int,int,int,int
#func global ReverseSoftImageH "dx_ReverseSoftImageH" int
#func global ReverseSoftImageV "dx_ReverseSoftImageV" int
#func global ReverseSoftImage "dx_ReverseSoftImage" int
#func global BltStringSoftImage "dx_BltStringSoftImage" int,int,str,int,int,int
#func global BltStringSoftImageToHandle "dx_BltStringSoftImageToHandle" int,int,str,int,int,int,int
#func global DrawSoftImage "dx_DrawSoftImage" int,int,int
#func global SaveSoftImageToBmp "dx_SaveSoftImageToBmp" str,int
#func global SaveSoftImageToPng "dx_SaveSoftImageToPng" str,int,int
#func global SaveSoftImageToJpeg "dx_SaveSoftImageToJpeg" str,int,int,int
#func global InitSoundMem "dx_InitSoundMem" int
#func global AddSoundData "dx_AddSoundData" int
#func global AddStreamSoundMemToMem "dx_AddStreamSoundMemToMem" sptr,int,int,int,int,int
#func global AddStreamSoundMemToFile "dx_AddStreamSoundMemToFile" str,int,int,int,int
#func global SetupStreamSoundMem "dx_SetupStreamSoundMem" int
#func global PlayStreamSoundMem "dx_PlayStreamSoundMem" int,int,int
#func global CheckStreamSoundMem "dx_CheckStreamSoundMem" int
#func global StopStreamSoundMem "dx_StopStreamSoundMem" int
#func global SetStreamSoundCurrentPosition "dx_SetStreamSoundCurrentPosition" int,int
#func global GetStreamSoundCurrentPosition "dx_GetStreamSoundCurrentPosition" int
#func global SetStreamSoundCurrentTime "dx_SetStreamSoundCurrentTime" int,int
#func global GetStreamSoundCurrentTime "dx_GetStreamSoundCurrentTime" int
#func global ProcessStreamSoundMem "dx_ProcessStreamSoundMem" int
#func global ProcessStreamSoundMemAll "dx_ProcessStreamSoundMemAll" 
#func global LoadSoundMem2 "dx_LoadSoundMem2" str,str
#func global LoadBGM "dx_LoadBGM" str
#func global LoadSoundMemBase "dx_LoadSoundMemBase" str,int,int
#func global LoadSoundMem "dx_LoadSoundMem" str,int,int
#func global LoadSoundMemToBufNumSitei "dx_LoadSoundMemToBufNumSitei" str,int
#func global DuplicateSoundMem "dx_DuplicateSoundMem" int,int
#func global LoadSoundMemByMemImageBase "dx_LoadSoundMemByMemImageBase" sptr,int,int,int
#func global LoadSoundMemByMemImage "dx_LoadSoundMemByMemImage" sptr,int,int
#func global LoadSoundMemByMemImageToBufNumSitei "dx_LoadSoundMemByMemImageToBufNumSitei" sptr,int,int
#func global LoadSoundMem2ByMemImage "dx_LoadSoundMem2ByMemImage" sptr,int,sptr,int
#func global LoadSoundMemFromSoftSound "dx_LoadSoundMemFromSoftSound" int,int
#func global DeleteSoundMem "dx_DeleteSoundMem" int,int
#func global PlaySoundMem "dx_PlaySoundMem" int,int,int
#func global StopSoundMem "dx_StopSoundMem" int
#func global CheckSoundMem "dx_CheckSoundMem" int
#func global SetPanSoundMem "dx_SetPanSoundMem" int,int
#func global ChangePanSoundMem "dx_ChangePanSoundMem" int,int
#func global GetPanSoundMem "dx_GetPanSoundMem" int
#func global SetVolumeSoundMem "dx_SetVolumeSoundMem" int,int
#func global ChangeVolumeSoundMem "dx_ChangeVolumeSoundMem" int,int
#func global GetVolumeSoundMem "dx_GetVolumeSoundMem" int
#func global SetChannelVolumeSoundMem "dx_SetChannelVolumeSoundMem" int,int,int
#func global ChangeChannelVolumeSoundMem "dx_ChangeChannelVolumeSoundMem" int,int,int
#func global GetChannelVolumeSoundMem "dx_GetChannelVolumeSoundMem" int,int
#func global SetFrequencySoundMem "dx_SetFrequencySoundMem" int,int
#func global GetFrequencySoundMem "dx_GetFrequencySoundMem" int
#func global ResetFrequencySoundMem "dx_ResetFrequencySoundMem" int
#func global SetNextPlayPanSoundMem "dx_SetNextPlayPanSoundMem" int,int
#func global ChangeNextPlayPanSoundMem "dx_ChangeNextPlayPanSoundMem" int,int
#func global SetNextPlayVolumeSoundMem "dx_SetNextPlayVolumeSoundMem" int,int
#func global ChangeNextPlayVolumeSoundMem "dx_ChangeNextPlayVolumeSoundMem" int,int
#func global SetNextPlayChannelVolumeSoundMem "dx_SetNextPlayChannelVolumeSoundMem" int,int,int
#func global ChangeNextPlayChannelVolumeSoundMem "dx_ChangeNextPlayChannelVolumeSoundMem" int,int,int
#func global SetNextPlayFrequencySoundMem "dx_SetNextPlayFrequencySoundMem" int,int
#func global SetCurrentPositionSoundMem "dx_SetCurrentPositionSoundMem" int,int
#func global GetCurrentPositionSoundMem "dx_GetCurrentPositionSoundMem" int
#func global SetSoundCurrentPosition "dx_SetSoundCurrentPosition" int,int
#func global GetSoundCurrentPosition "dx_GetSoundCurrentPosition" int
#func global SetSoundCurrentTime "dx_SetSoundCurrentTime" int,int
#func global GetSoundCurrentTime "dx_GetSoundCurrentTime" int
#func global GetSoundTotalSample "dx_GetSoundTotalSample" int
#func global GetSoundTotalTime "dx_GetSoundTotalTime" int
#func global SetLoopPosSoundMem "dx_SetLoopPosSoundMem" int,int
#func global SetLoopTimePosSoundMem "dx_SetLoopTimePosSoundMem" int,int
#func global SetLoopSamplePosSoundMem "dx_SetLoopSamplePosSoundMem" int,int
#func global SetLoopStartTimePosSoundMem "dx_SetLoopStartTimePosSoundMem" int,int
#func global SetLoopStartSamplePosSoundMem "dx_SetLoopStartSamplePosSoundMem" int,int
#func global SetPlayFinishDeleteSoundMem "dx_SetPlayFinishDeleteSoundMem" int,int
#func global Set3DReverbParamSoundMem "dx_Set3DReverbParamSoundMem" sptr,int
#func global Set3DPresetReverbParamSoundMem "dx_Set3DPresetReverbParamSoundMem" int,int
#func global Set3DReverbParamSoundMemAll "dx_Set3DReverbParamSoundMemAll" sptr,int
#func global Set3DPresetReverbParamSoundMemAll "dx_Set3DPresetReverbParamSoundMemAll" int,int
#func global Get3DReverbParamSoundMem "dx_Get3DReverbParamSoundMem" sptr,int
#func global Get3DPresetReverbParamSoundMem "dx_Get3DPresetReverbParamSoundMem" sptr,int
#func global Set3DPositionSoundMem "dx_Set3DPositionSoundMem" float,float,float,int
#func global Set3DRadiusSoundMem "dx_Set3DRadiusSoundMem" float,int
#func global Set3DVelocitySoundMem "dx_Set3DVelocitySoundMem" float,float,float,int
#func global SetNextPlay3DPositionSoundMem "dx_SetNextPlay3DPositionSoundMem" float,float,float,int
#func global SetNextPlay3DRadiusSoundMem "dx_SetNextPlay3DRadiusSoundMem" float,int
#func global SetNextPlay3DVelocitySoundMem "dx_SetNextPlay3DVelocitySoundMem" float,float,float,int
#func global SetCreateSoundDataType "dx_SetCreateSoundDataType" int
#func global GetCreateSoundDataType "dx_GetCreateSoundDataType" 
#func global SetDisableReadSoundFunctionMask "dx_SetDisableReadSoundFunctionMask" int
#func global GetDisableReadSoundFunctionMask "dx_GetDisableReadSoundFunctionMask" 
#func global SetEnableSoundCaptureFlag "dx_SetEnableSoundCaptureFlag" int
#func global SetUseOldVolumeCalcFlag "dx_SetUseOldVolumeCalcFlag" int
#func global SetCreate3DSoundFlag "dx_SetCreate3DSoundFlag" int
#func global Set3DSoundOneMetre "dx_Set3DSoundOneMetre" float
#func global Set3DSoundListenerPosAndFrontPos_UpVecY "dx_Set3DSoundListenerPosAndFrontPos_UpVecY" float,float,float,float,float,float
#func global Set3DSoundListenerPosAndFrontPosAndUpVec "dx_Set3DSoundListenerPosAndFrontPosAndUpVec" float,float,float,float,float,float,float,float,float
#func global Set3DSoundListenerVelocity "dx_Set3DSoundListenerVelocity" float,float,float
#func global Set3DSoundListenerConeAngle "dx_Set3DSoundListenerConeAngle" float,float
#func global Set3DSoundListenerConeVolume "dx_Set3DSoundListenerConeVolume" float,float
#func global PlaySoundFile "dx_PlaySoundFile" str,int
#func global PlaySound "dx_PlaySound" str,int
#func global CheckSoundFile "dx_CheckSoundFile" 
#func global CheckSound "dx_CheckSound" 
#func global StopSoundFile "dx_StopSoundFile" 
#func global StopSound "dx_StopSound" 
#func global SetVolumeSoundFile "dx_SetVolumeSoundFile" int
#func global SetVolumeSound "dx_SetVolumeSound" int
#func global InitSoftSound "dx_InitSoftSound" 
#func global LoadSoftSound "dx_LoadSoftSound" str
#func global LoadSoftSoundFromMemImage "dx_LoadSoftSoundFromMemImage" sptr,int
#func global MakeSoftSound "dx_MakeSoftSound" int,int
#func global MakeSoftSound2Ch16Bit44KHz "dx_MakeSoftSound2Ch16Bit44KHz" int
#func global MakeSoftSound2Ch16Bit22KHz "dx_MakeSoftSound2Ch16Bit22KHz" int
#func global MakeSoftSound2Ch8Bit44KHz "dx_MakeSoftSound2Ch8Bit44KHz" int
#func global MakeSoftSound2Ch8Bit22KHz "dx_MakeSoftSound2Ch8Bit22KHz" int
#func global MakeSoftSound1Ch16Bit44KHz "dx_MakeSoftSound1Ch16Bit44KHz" int
#func global MakeSoftSound1Ch16Bit22KHz "dx_MakeSoftSound1Ch16Bit22KHz" int
#func global MakeSoftSound1Ch8Bit44KHz "dx_MakeSoftSound1Ch8Bit44KHz" int
#func global MakeSoftSound1Ch8Bit22KHz "dx_MakeSoftSound1Ch8Bit22KHz" int
#func global MakeSoftSoundCustom "dx_MakeSoftSoundCustom" int,int,int,int
#func global DeleteSoftSound "dx_DeleteSoftSound" int
#func global SaveSoftSound "dx_SaveSoftSound" int,str
#func global GetSoftSoundSampleNum "dx_GetSoftSoundSampleNum" int
#func global GetSoftSoundFormat "dx_GetSoftSoundFormat" int,sptr,sptr,sptr
#func global ReadSoftSoundData "dx_ReadSoftSoundData" int,int,sptr,sptr
#func global WriteSoftSoundData "dx_WriteSoftSoundData" int,int,int,int
#func global GetSoftSoundDataImage "dx_GetSoftSoundDataImage" int
#func global InitSoftSoundPlayer "dx_InitSoftSoundPlayer" 
#func global MakeSoftSoundPlayer "dx_MakeSoftSoundPlayer" int
#func global MakeSoftSoundPlayer2Ch16Bit44KHz "dx_MakeSoftSoundPlayer2Ch16Bit44KHz" 
#func global MakeSoftSoundPlayer2Ch16Bit22KHz "dx_MakeSoftSoundPlayer2Ch16Bit22KHz" 
#func global MakeSoftSoundPlayer2Ch8Bit44KHz "dx_MakeSoftSoundPlayer2Ch8Bit44KHz" 
#func global MakeSoftSoundPlayer2Ch8Bit22KHz "dx_MakeSoftSoundPlayer2Ch8Bit22KHz" 
#func global MakeSoftSoundPlayer1Ch16Bit44KHz "dx_MakeSoftSoundPlayer1Ch16Bit44KHz" 
#func global MakeSoftSoundPlayer1Ch16Bit22KHz "dx_MakeSoftSoundPlayer1Ch16Bit22KHz" 
#func global MakeSoftSoundPlayer1Ch8Bit44KHz "dx_MakeSoftSoundPlayer1Ch8Bit44KHz" 
#func global MakeSoftSoundPlayer1Ch8Bit22KHz "dx_MakeSoftSoundPlayer1Ch8Bit22KHz" 
#func global MakeSoftSoundPlayerCustom "dx_MakeSoftSoundPlayerCustom" int,int,int
#func global DeleteSoftSoundPlayer "dx_DeleteSoftSoundPlayer" int
#func global AddDataSoftSoundPlayer "dx_AddDataSoftSoundPlayer" int,int,int,int
#func global AddDirectDataSoftSoundPlayer "dx_AddDirectDataSoftSoundPlayer" int,sptr,int
#func global AddOneDataSoftSoundPlayer "dx_AddOneDataSoftSoundPlayer" int,int,int
#func global GetSoftSoundPlayerFormat "dx_GetSoftSoundPlayerFormat" int,sptr,sptr,sptr
#func global StartSoftSoundPlayer "dx_StartSoftSoundPlayer" int
#func global CheckStartSoftSoundPlayer "dx_CheckStartSoftSoundPlayer" int
#func global StopSoftSoundPlayer "dx_StopSoftSoundPlayer" int
#func global ResetSoftSoundPlayer "dx_ResetSoftSoundPlayer" int
#func global GetStockDataLengthSoftSoundPlayer "dx_GetStockDataLengthSoftSoundPlayer" int
#func global CheckSoftSoundPlayerNoneData "dx_CheckSoftSoundPlayerNoneData" int
#func global DeleteMusicMem "dx_DeleteMusicMem" int
#func global LoadMusicMem "dx_LoadMusicMem" str
#func global LoadMusicMemByMemImage "dx_LoadMusicMemByMemImage" sptr,int
#func global PlayMusicMem "dx_PlayMusicMem" int,int
#func global StopMusicMem "dx_StopMusicMem" int
#func global CheckMusicMem "dx_CheckMusicMem" int
#func global SetVolumeMusicMem "dx_SetVolumeMusicMem" int,int
#func global GetMusicMemPosition "dx_GetMusicMemPosition" int
#func global InitMusicMem "dx_InitMusicMem" 
#func global ProcessMusicMem "dx_ProcessMusicMem" 
#func global PlayMusic "dx_PlayMusic" str,int
#func global PlayMusicByMemImage "dx_PlayMusicByMemImage" sptr,int,int
#func global PlayMusicByResource "dx_PlayMusicByResource" str,str,int
#func global SetVolumeMusic "dx_SetVolumeMusic" int
#func global StopMusic "dx_StopMusic" 
#func global CheckMusic "dx_CheckMusic" 
#func global GetMusicPosition "dx_GetMusicPosition" 
#func global SelectMidiMode "dx_SelectMidiMode" int
#func global SetUseDXArchiveFlag "dx_SetUseDXArchiveFlag" int
#func global SetDXArchivePriority "dx_SetDXArchivePriority" int
#func global SetDXArchiveExtension "dx_SetDXArchiveExtension" str
#func global SetDXArchiveKeyString "dx_SetDXArchiveKeyString" str
#func global DXArchivePreLoad "dx_DXArchivePreLoad" str,int
#func global DXArchiveCheckIdle "dx_DXArchiveCheckIdle" str
#func global DXArchiveRelease "dx_DXArchiveRelease" str
#func global DXArchiveCheckFile "dx_DXArchiveCheckFile" str,str
#func global DXArchiveSetMemImage "dx_DXArchiveSetMemImage" sptr,int,str,int,int
#func global DXArchiveReleaseMemImage "dx_DXArchiveReleaseMemImage" sptr
#func global MV1LoadModel "dx_MV1LoadModel" str
#func global MV1DuplicateModel "dx_MV1DuplicateModel" int
#func global MV1CreateCloneModel "dx_MV1CreateCloneModel" int
#func global MV1DeleteModel "dx_MV1DeleteModel" int
#func global MV1InitModel "dx_MV1InitModel" 
#func global MV1SetLoadModelReMakeNormal "dx_MV1SetLoadModelReMakeNormal" int
#func global MV1SetLoadModelReMakeNormalSmoothingAngle "dx_MV1SetLoadModelReMakeNormalSmoothingAngle" float
#func global MV1SetLoadModelIgnoreScaling "dx_MV1SetLoadModelIgnoreScaling" int
#func global MV1SetLoadModelPositionOptimize "dx_MV1SetLoadModelPositionOptimize" int
#func global MV1SetLoadModelUsePhysicsMode "dx_MV1SetLoadModelUsePhysicsMode" int
#func global MV1SetLoadModelPhysicsWorldGravity "dx_MV1SetLoadModelPhysicsWorldGravity" float
#func global MV1SetLoadCalcPhysicsWorldGravity "dx_MV1SetLoadCalcPhysicsWorldGravity" int,float,float,float
#func global MV1SetLoadModelPhysicsCalcPrecision "dx_MV1SetLoadModelPhysicsCalcPrecision" int
#func global MV1SetLoadModelAnimFilePath "dx_MV1SetLoadModelAnimFilePath" str
#func global MV1SetLoadModelUsePackDraw "dx_MV1SetLoadModelUsePackDraw" int
#func global MV1SaveModelToMV1File "dx_MV1SaveModelToMV1File" int,str,int,int,int,int,int,int,int
#func global MV1SaveModelToXFile "dx_MV1SaveModelToXFile" int,str,int,int,int
#func global MV1DrawModel "dx_MV1DrawModel" int
#func global MV1DrawFrame "dx_MV1DrawFrame" int,int
#func global MV1DrawMesh "dx_MV1DrawMesh" int,int
#func global MV1DrawTriangleList "dx_MV1DrawTriangleList" int,int
#func global MV1DrawModelDebug "dx_MV1DrawModelDebug" int,int,int,float,int,int
#func global MV1SetUseOrigShader "dx_MV1SetUseOrigShader" int
#func global MV1SetSemiTransDrawMode "dx_MV1SetSemiTransDrawMode" int
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetLocalWorldMatrix "dx_MV1GetLocalWorldMatrix" var,int
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetLocalWorldMatrixD "dx_MV1GetLocalWorldMatrixD" var,int
#func global MV1SetPosition "dx_MV1SetPosition" int,float,float,float
#func global MV1SetPositionD "dx_MV1SetPositionD" int,double,double,double
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetPosition "dx_MV1GetPosition" var,int
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetPositionD "dx_MV1GetPositionD" var,int
#func global MV1SetScale "dx_MV1SetScale" int,float,float,float
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetScale "dx_MV1GetScale" var,int
#func global MV1SetRotationXYZ "dx_MV1SetRotationXYZ" int,float,float,float
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetRotationXYZ "dx_MV1GetRotationXYZ" var,int
#func global MV1SetRotationZYAxis "dx_MV1SetRotationZYAxis" int,float,float,float,float,float,float,float
#func global MV1SetRotationMatrix "dx_MV1SetRotationMatrix" int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetRotationMatrix "dx_MV1GetRotationMatrix" var,int
#func global MV1SetMatrix "dx_MV1SetMatrix" int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global MV1SetMatrixD "dx_MV1SetMatrixD" int,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMatrix "dx_MV1GetMatrix" var,int
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMatrixD "dx_MV1GetMatrixD" var,int
#func global MV1SetVisible "dx_MV1SetVisible" int,int
#func global MV1GetVisible "dx_MV1GetVisible" int
#func global MV1SetMeshCategoryVisible "dx_MV1SetMeshCategoryVisible" int,int,int
#func global MV1GetMeshCategoryVisible "dx_MV1GetMeshCategoryVisible" int,int
#func global MV1SetDifColorScale "dx_MV1SetDifColorScale" int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetDifColorScale "dx_MV1GetDifColorScale" var,int
#func global MV1SetSpcColorScale "dx_MV1SetSpcColorScale" int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetSpcColorScale "dx_MV1GetSpcColorScale" var,int
#func global MV1SetEmiColorScale "dx_MV1SetEmiColorScale" int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetEmiColorScale "dx_MV1GetEmiColorScale" var,int
#func global MV1SetAmbColorScale "dx_MV1SetAmbColorScale" int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAmbColorScale "dx_MV1GetAmbColorScale" var,int
#func global MV1GetSemiTransState "dx_MV1GetSemiTransState" int
#func global MV1SetOpacityRate "dx_MV1SetOpacityRate" int,float
#func global MV1GetOpacityRate "dx_MV1GetOpacityRate" int
#func global MV1SetUseDrawMulAlphaColor "dx_MV1SetUseDrawMulAlphaColor" int,int
#func global MV1GetUseDrawMulAlphaColor "dx_MV1GetUseDrawMulAlphaColor" int
#func global MV1SetUseZBuffer "dx_MV1SetUseZBuffer" int,int
#func global MV1SetWriteZBuffer "dx_MV1SetWriteZBuffer" int,int
#func global MV1SetZBufferCmpType "dx_MV1SetZBufferCmpType" int,int
#func global MV1SetZBias "dx_MV1SetZBias" int,int
#func global MV1SetUseVertDifColor "dx_MV1SetUseVertDifColor" int,int
#func global MV1SetUseVertSpcColor "dx_MV1SetUseVertSpcColor" int,int
#func global MV1SetSampleFilterMode "dx_MV1SetSampleFilterMode" int,int
#func global MV1SetMaxAnisotropy "dx_MV1SetMaxAnisotropy" int,int
#func global MV1SetWireFrameDrawFlag "dx_MV1SetWireFrameDrawFlag" int,int
#func global MV1RefreshVertColorFromMaterial "dx_MV1RefreshVertColorFromMaterial" int
#func global MV1SetPhysicsWorldGravity "dx_MV1SetPhysicsWorldGravity" int,float,float,float
#func global MV1PhysicsCalculation "dx_MV1PhysicsCalculation" int,float
#func global MV1PhysicsResetState "dx_MV1PhysicsResetState" int
#func global MV1SetUseShapeFlag "dx_MV1SetUseShapeFlag" int,int
#func global MV1GetMaterialNumberOrderFlag "dx_MV1GetMaterialNumberOrderFlag" int
#func global MV1AttachAnim "dx_MV1AttachAnim" int,int,int,int
#func global MV1DetachAnim "dx_MV1DetachAnim" int,int
#func global MV1SetAttachAnimTime "dx_MV1SetAttachAnimTime" int,int,float
#func global MV1GetAttachAnimTime "dx_MV1GetAttachAnimTime" int,int
#func global MV1GetAttachAnimTotalTime "dx_MV1GetAttachAnimTotalTime" int,int
#func global MV1SetAttachAnimBlendRate "dx_MV1SetAttachAnimBlendRate" int,int,float
#func global MV1GetAttachAnimBlendRate "dx_MV1GetAttachAnimBlendRate" int,int
#func global MV1SetAttachAnimBlendRateToFrame "dx_MV1SetAttachAnimBlendRateToFrame" int,int,int,float,int
#func global MV1GetAttachAnimBlendRateToFrame "dx_MV1GetAttachAnimBlendRateToFrame" int,int,int
#func global MV1GetAttachAnim "dx_MV1GetAttachAnim" int,int
#func global MV1SetAttachAnimUseShapeFlag "dx_MV1SetAttachAnimUseShapeFlag" int,int,int
#func global MV1GetAttachAnimUseShapeFlag "dx_MV1GetAttachAnimUseShapeFlag" int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAttachAnimFrameLocalPosition "dx_MV1GetAttachAnimFrameLocalPosition" var,int,int,int
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAttachAnimFrameLocalMatrix "dx_MV1GetAttachAnimFrameLocalMatrix" var,int,int,int
#func global MV1GetAnimNum "dx_MV1GetAnimNum" int
#func global MV1SetAnimName "dx_MV1SetAnimName" int,int,str
#func global MV1GetAnimIndex "dx_MV1GetAnimIndex" int,str
#func global MV1GetAnimTotalTime "dx_MV1GetAnimTotalTime" int,int
#func global MV1GetAnimTargetFrameNum "dx_MV1GetAnimTargetFrameNum" int,int
#func global MV1GetAnimTargetFrame "dx_MV1GetAnimTargetFrame" int,int,int
#func global MV1GetAnimTargetFrameKeySetNum "dx_MV1GetAnimTargetFrameKeySetNum" int,int,int
#func global MV1GetAnimTargetFrameKeySet "dx_MV1GetAnimTargetFrameKeySet" int,int,int,int
#func global MV1GetAnimKeySetNum "dx_MV1GetAnimKeySetNum" int
#func global MV1GetAnimKeySetType "dx_MV1GetAnimKeySetType" int,int
#func global MV1GetAnimKeySetDataType "dx_MV1GetAnimKeySetDataType" int,int
#func global MV1GetAnimKeySetTimeType "dx_MV1GetAnimKeySetTimeType" int,int
#func global MV1GetAnimKeySetDataNum "dx_MV1GetAnimKeySetDataNum" int,int
#func global MV1GetAnimKeyDataTime "dx_MV1GetAnimKeyDataTime" int,int,int
#func global MV1GetAnimKeyDataIndexFromTime "dx_MV1GetAnimKeyDataIndexFromTime" int,int,float
// 戻り値が構造体です（FLOAT4）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAnimKeyDataToQuaternion "dx_MV1GetAnimKeyDataToQuaternion" var,int,int,int
// 戻り値が構造体です（FLOAT4）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAnimKeyDataToQuaternionFromTime "dx_MV1GetAnimKeyDataToQuaternionFromTime" var,int,int,float
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAnimKeyDataToVector "dx_MV1GetAnimKeyDataToVector" var,int,int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAnimKeyDataToVectorFromTime "dx_MV1GetAnimKeyDataToVectorFromTime" var,int,int,float
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAnimKeyDataToMatrix "dx_MV1GetAnimKeyDataToMatrix" var,int,int,int
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetAnimKeyDataToMatrixFromTime "dx_MV1GetAnimKeyDataToMatrixFromTime" var,int,int,float
#func global MV1GetAnimKeyDataToFlat "dx_MV1GetAnimKeyDataToFlat" int,int,int
#func global MV1GetAnimKeyDataToFlatFromTime "dx_MV1GetAnimKeyDataToFlatFromTime" int,int,float
#func global MV1GetAnimKeyDataToLinear "dx_MV1GetAnimKeyDataToLinear" int,int,int
#func global MV1GetAnimKeyDataToLinearFromTime "dx_MV1GetAnimKeyDataToLinearFromTime" int,int,float
#func global MV1GetMaterialNum "dx_MV1GetMaterialNum" int
#func global MV1SetMaterialTypeAll "dx_MV1SetMaterialTypeAll" int,int
#func global MV1SetMaterialType "dx_MV1SetMaterialType" int,int,int
#func global MV1GetMaterialType "dx_MV1GetMaterialType" int,int
#func global MV1SetMaterialDifColor "dx_MV1SetMaterialDifColor" int,int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMaterialDifColor "dx_MV1GetMaterialDifColor" var,int,int
#func global MV1SetMaterialSpcColor "dx_MV1SetMaterialSpcColor" int,int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMaterialSpcColor "dx_MV1GetMaterialSpcColor" var,int,int
#func global MV1SetMaterialEmiColor "dx_MV1SetMaterialEmiColor" int,int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMaterialEmiColor "dx_MV1GetMaterialEmiColor" var,int,int
#func global MV1SetMaterialAmbColor "dx_MV1SetMaterialAmbColor" int,int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMaterialAmbColor "dx_MV1GetMaterialAmbColor" var,int,int
#func global MV1SetMaterialSpcPower "dx_MV1SetMaterialSpcPower" int,int,float
#func global MV1GetMaterialSpcPower "dx_MV1GetMaterialSpcPower" int,int
#func global MV1SetMaterialDifMapTexture "dx_MV1SetMaterialDifMapTexture" int,int,int
#func global MV1GetMaterialDifMapTexture "dx_MV1GetMaterialDifMapTexture" int,int
#func global MV1SetMaterialSpcMapTexture "dx_MV1SetMaterialSpcMapTexture" int,int,int
#func global MV1GetMaterialSpcMapTexture "dx_MV1GetMaterialSpcMapTexture" int,int
#func global MV1GetMaterialNormalMapTexture "dx_MV1GetMaterialNormalMapTexture" int,int
#func global MV1SetMaterialDifGradTexture "dx_MV1SetMaterialDifGradTexture" int,int,int
#func global MV1GetMaterialDifGradTexture "dx_MV1GetMaterialDifGradTexture" int,int
#func global MV1SetMaterialSpcGradTexture "dx_MV1SetMaterialSpcGradTexture" int,int,int
#func global MV1GetMaterialSpcGradTexture "dx_MV1GetMaterialSpcGradTexture" int,int
#func global MV1SetMaterialSphereMapTexture "dx_MV1SetMaterialSphereMapTexture" int,int,int
#func global MV1GetMaterialSphereMapTexture "dx_MV1GetMaterialSphereMapTexture" int,int
#func global MV1SetMaterialDifGradBlendTypeAll "dx_MV1SetMaterialDifGradBlendTypeAll" int,int
#func global MV1SetMaterialDifGradBlendType "dx_MV1SetMaterialDifGradBlendType" int,int,int
#func global MV1GetMaterialDifGradBlendType "dx_MV1GetMaterialDifGradBlendType" int,int
#func global MV1SetMaterialSpcGradBlendTypeAll "dx_MV1SetMaterialSpcGradBlendTypeAll" int,int
#func global MV1SetMaterialSpcGradBlendType "dx_MV1SetMaterialSpcGradBlendType" int,int,int
#func global MV1GetMaterialSpcGradBlendType "dx_MV1GetMaterialSpcGradBlendType" int,int
#func global MV1SetMaterialSphereMapBlendTypeAll "dx_MV1SetMaterialSphereMapBlendTypeAll" int,int
#func global MV1SetMaterialSphereMapBlendType "dx_MV1SetMaterialSphereMapBlendType" int,int,int
#func global MV1GetMaterialSphereMapBlendType "dx_MV1GetMaterialSphereMapBlendType" int,int
#func global MV1SetMaterialOutLineWidthAll "dx_MV1SetMaterialOutLineWidthAll" int,float
#func global MV1SetMaterialOutLineWidth "dx_MV1SetMaterialOutLineWidth" int,int,float
#func global MV1GetMaterialOutLineWidth "dx_MV1GetMaterialOutLineWidth" int,int
#func global MV1SetMaterialOutLineDotWidthAll "dx_MV1SetMaterialOutLineDotWidthAll" int,float
#func global MV1SetMaterialOutLineDotWidth "dx_MV1SetMaterialOutLineDotWidth" int,int,float
#func global MV1GetMaterialOutLineDotWidth "dx_MV1GetMaterialOutLineDotWidth" int,int
#func global MV1SetMaterialOutLineColorAll "dx_MV1SetMaterialOutLineColorAll" int,float,float,float,float
#func global MV1SetMaterialOutLineColor "dx_MV1SetMaterialOutLineColor" int,int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMaterialOutLineColor "dx_MV1GetMaterialOutLineColor" var,int,int
#func global MV1SetMaterialDrawBlendModeAll "dx_MV1SetMaterialDrawBlendModeAll" int,int
#func global MV1SetMaterialDrawBlendMode "dx_MV1SetMaterialDrawBlendMode" int,int,int
#func global MV1GetMaterialDrawBlendMode "dx_MV1GetMaterialDrawBlendMode" int,int
#func global MV1SetMaterialDrawBlendParamAll "dx_MV1SetMaterialDrawBlendParamAll" int,int
#func global MV1SetMaterialDrawBlendParam "dx_MV1SetMaterialDrawBlendParam" int,int,int
#func global MV1GetMaterialDrawBlendParam "dx_MV1GetMaterialDrawBlendParam" int,int
#func global MV1SetMaterialDrawAlphaTestAll "dx_MV1SetMaterialDrawAlphaTestAll" int,int,int,int
#func global MV1SetMaterialDrawAlphaTest "dx_MV1SetMaterialDrawAlphaTest" int,int,int,int,int
#func global MV1GetMaterialDrawAlphaTestEnable "dx_MV1GetMaterialDrawAlphaTestEnable" int,int
#func global MV1GetMaterialDrawAlphaTestMode "dx_MV1GetMaterialDrawAlphaTestMode" int,int
#func global MV1GetMaterialDrawAlphaTestParam "dx_MV1GetMaterialDrawAlphaTestParam" int,int
#func global MV1GetTextureNum "dx_MV1GetTextureNum" int
#func global MV1SetTextureColorFilePath "dx_MV1SetTextureColorFilePath" int,int,str
#func global MV1SetTextureAlphaFilePath "dx_MV1SetTextureAlphaFilePath" int,int,str
#func global MV1SetTextureGraphHandle "dx_MV1SetTextureGraphHandle" int,int,int,int
#func global MV1GetTextureGraphHandle "dx_MV1GetTextureGraphHandle" int,int
#func global MV1SetTextureAddressMode "dx_MV1SetTextureAddressMode" int,int,int,int
#func global MV1GetTextureAddressModeU "dx_MV1GetTextureAddressModeU" int,int
#func global MV1GetTextureAddressModeV "dx_MV1GetTextureAddressModeV" int,int
#func global MV1GetTextureWidth "dx_MV1GetTextureWidth" int,int
#func global MV1GetTextureHeight "dx_MV1GetTextureHeight" int,int
#func global MV1GetTextureSemiTransState "dx_MV1GetTextureSemiTransState" int,int
#func global MV1SetTextureBumpImageFlag "dx_MV1SetTextureBumpImageFlag" int,int,int
#func global MV1GetTextureBumpImageFlag "dx_MV1GetTextureBumpImageFlag" int,int
#func global MV1SetTextureBumpImageNextPixelLength "dx_MV1SetTextureBumpImageNextPixelLength" int,int,float
#func global MV1GetTextureBumpImageNextPixelLength "dx_MV1GetTextureBumpImageNextPixelLength" int,int
#func global MV1SetTextureSampleFilterMode "dx_MV1SetTextureSampleFilterMode" int,int,int
#func global MV1GetTextureSampleFilterMode "dx_MV1GetTextureSampleFilterMode" int,int
#func global MV1LoadTexture "dx_MV1LoadTexture" str
#func global MV1GetFrameNum "dx_MV1GetFrameNum" int
#func global MV1SearchFrame "dx_MV1SearchFrame" int,str
#func global MV1SearchFrameChild "dx_MV1SearchFrameChild" int,int,str
#func global MV1GetFrameName2 "dx_MV1GetFrameName2" int,int,str
#func global MV1GetFrameParent "dx_MV1GetFrameParent" int,int
#func global MV1GetFrameChildNum "dx_MV1GetFrameChildNum" int,int
#func global MV1GetFrameChild "dx_MV1GetFrameChild" int,int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFramePosition "dx_MV1GetFramePosition" var,int,int
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFramePositionD "dx_MV1GetFramePositionD" var,int,int
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameBaseLocalMatrix "dx_MV1GetFrameBaseLocalMatrix" var,int,int
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameBaseLocalMatrixD "dx_MV1GetFrameBaseLocalMatrixD" var,int,int
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameLocalMatrix "dx_MV1GetFrameLocalMatrix" var,int,int
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameLocalMatrixD "dx_MV1GetFrameLocalMatrixD" var,int,int
// 戻り値が構造体です（MATRIX）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameLocalWorldMatrix "dx_MV1GetFrameLocalWorldMatrix" var,int,int
// 戻り値が構造体です（MATRIX_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameLocalWorldMatrixD "dx_MV1GetFrameLocalWorldMatrixD" var,int,int
#func global MV1SetFrameUserLocalMatrix "dx_MV1SetFrameUserLocalMatrix" int,int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global MV1SetFrameUserLocalMatrixD "dx_MV1SetFrameUserLocalMatrixD" int,int,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double
#func global MV1ResetFrameUserLocalMatrix "dx_MV1ResetFrameUserLocalMatrix" int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameMaxVertexLocalPosition "dx_MV1GetFrameMaxVertexLocalPosition" var,int,int
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameMaxVertexLocalPositionD "dx_MV1GetFrameMaxVertexLocalPositionD" var,int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameMinVertexLocalPosition "dx_MV1GetFrameMinVertexLocalPosition" var,int,int
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameMinVertexLocalPositionD "dx_MV1GetFrameMinVertexLocalPositionD" var,int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameAvgVertexLocalPosition "dx_MV1GetFrameAvgVertexLocalPosition" var,int,int
// 戻り値が構造体です（VECTOR_D）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameAvgVertexLocalPositionD "dx_MV1GetFrameAvgVertexLocalPositionD" var,int,int
#func global MV1GetFrameTriangleNum "dx_MV1GetFrameTriangleNum" int,int
#func global MV1GetFrameMeshNum "dx_MV1GetFrameMeshNum" int,int
#func global MV1GetFrameMesh "dx_MV1GetFrameMesh" int,int,int
#func global MV1SetFrameVisible "dx_MV1SetFrameVisible" int,int,int
#func global MV1GetFrameVisible "dx_MV1GetFrameVisible" int,int
#func global MV1SetFrameDifColorScale "dx_MV1SetFrameDifColorScale" int,int,float,float,float,float
#func global MV1SetFrameSpcColorScale "dx_MV1SetFrameSpcColorScale" int,int,float,float,float,float
#func global MV1SetFrameEmiColorScale "dx_MV1SetFrameEmiColorScale" int,int,float,float,float,float
#func global MV1SetFrameAmbColorScale "dx_MV1SetFrameAmbColorScale" int,int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameDifColorScale "dx_MV1GetFrameDifColorScale" var,int,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameSpcColorScale "dx_MV1GetFrameSpcColorScale" var,int,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameEmiColorScale "dx_MV1GetFrameEmiColorScale" var,int,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetFrameAmbColorScale "dx_MV1GetFrameAmbColorScale" var,int,int
#func global MV1GetFrameSemiTransState "dx_MV1GetFrameSemiTransState" int,int
#func global MV1SetFrameOpacityRate "dx_MV1SetFrameOpacityRate" int,int,float
#func global MV1GetFrameOpacityRate "dx_MV1GetFrameOpacityRate" int,int
#func global MV1SetFrameBaseVisible "dx_MV1SetFrameBaseVisible" int,int,int
#func global MV1GetFrameBaseVisible "dx_MV1GetFrameBaseVisible" int,int
#func global MV1SetFrameTextureAddressTransform "dx_MV1SetFrameTextureAddressTransform" int,int,float,float,float,float,float,float,float
#func global MV1SetFrameTextureAddressTransformMatrix "dx_MV1SetFrameTextureAddressTransformMatrix" int,int,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float
#func global MV1ResetFrameTextureAddressTransform "dx_MV1ResetFrameTextureAddressTransform" int,int
#func global MV1GetMeshNum "dx_MV1GetMeshNum" int
#func global MV1GetMeshMaterial "dx_MV1GetMeshMaterial" int,int
#func global MV1GetMeshTriangleNum "dx_MV1GetMeshTriangleNum" int,int
#func global MV1SetMeshVisible "dx_MV1SetMeshVisible" int,int,int
#func global MV1GetMeshVisible "dx_MV1GetMeshVisible" int,int
#func global MV1SetMeshDifColorScale "dx_MV1SetMeshDifColorScale" int,int,float,float,float,float
#func global MV1SetMeshSpcColorScale "dx_MV1SetMeshSpcColorScale" int,int,float,float,float,float
#func global MV1SetMeshEmiColorScale "dx_MV1SetMeshEmiColorScale" int,int,float,float,float,float
#func global MV1SetMeshAmbColorScale "dx_MV1SetMeshAmbColorScale" int,int,float,float,float,float
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMeshDifColorScale "dx_MV1GetMeshDifColorScale" var,int,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMeshSpcColorScale "dx_MV1GetMeshSpcColorScale" var,int,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMeshEmiColorScale "dx_MV1GetMeshEmiColorScale" var,int,int
// 戻り値が構造体です（COLOR_F）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMeshAmbColorScale "dx_MV1GetMeshAmbColorScale" var,int,int
#func global MV1SetMeshOpacityRate "dx_MV1SetMeshOpacityRate" int,int,float
#func global MV1GetMeshOpacityRate "dx_MV1GetMeshOpacityRate" int,int
#func global MV1SetMeshDrawBlendMode "dx_MV1SetMeshDrawBlendMode" int,int,int
#func global MV1SetMeshDrawBlendParam "dx_MV1SetMeshDrawBlendParam" int,int,int
#func global MV1GetMeshDrawBlendMode "dx_MV1GetMeshDrawBlendMode" int,int
#func global MV1GetMeshDrawBlendParam "dx_MV1GetMeshDrawBlendParam" int,int
#func global MV1SetMeshBaseVisible "dx_MV1SetMeshBaseVisible" int,int,int
#func global MV1GetMeshBaseVisible "dx_MV1GetMeshBaseVisible" int,int
#func global MV1SetMeshBackCulling "dx_MV1SetMeshBackCulling" int,int,int
#func global MV1GetMeshBackCulling "dx_MV1GetMeshBackCulling" int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMeshMaxPosition "dx_MV1GetMeshMaxPosition" var,int,int
// 戻り値が構造体です（VECTOR）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1GetMeshMinPosition "dx_MV1GetMeshMinPosition" var,int,int
#func global MV1GetMeshTListNum "dx_MV1GetMeshTListNum" int,int
#func global MV1GetMeshTList "dx_MV1GetMeshTList" int,int,int
#func global MV1GetMeshSemiTransState "dx_MV1GetMeshSemiTransState" int,int
#func global MV1SetMeshUseVertDifColor "dx_MV1SetMeshUseVertDifColor" int,int,int
#func global MV1SetMeshUseVertSpcColor "dx_MV1SetMeshUseVertSpcColor" int,int,int
#func global MV1GetMeshUseVertDifColor "dx_MV1GetMeshUseVertDifColor" int,int
#func global MV1GetMeshUseVertSpcColor "dx_MV1GetMeshUseVertSpcColor" int,int
#func global MV1GetMeshShapeFlag "dx_MV1GetMeshShapeFlag" int,int
#func global MV1GetShapeNum "dx_MV1GetShapeNum" int
#func global MV1SearchShape "dx_MV1SearchShape" int,str
#func global MV1GetShapeTargetMeshNum "dx_MV1GetShapeTargetMeshNum" int,int
#func global MV1GetShapeTargetMesh "dx_MV1GetShapeTargetMesh" int,int,int
#func global MV1SetShapeRate "dx_MV1SetShapeRate" int,int,float
#func global MV1GetShapeRate "dx_MV1GetShapeRate" int,int
#func global MV1GetTriangleListNum "dx_MV1GetTriangleListNum" int
#func global MV1GetTriangleListVertexType "dx_MV1GetTriangleListVertexType" int,int
#func global MV1GetTriangleListPolygonNum "dx_MV1GetTriangleListPolygonNum" int,int
#func global MV1GetTriangleListVertexNum "dx_MV1GetTriangleListVertexNum" int,int
#func global MV1SetupCollInfo "dx_MV1SetupCollInfo" int,int,int,int,int
#func global MV1TerminateCollInfo "dx_MV1TerminateCollInfo" int,int
#func global MV1RefreshCollInfo "dx_MV1RefreshCollInfo" int,int
// 戻り値が構造体です（MV1_COLL_RESULT_POLY）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1CollCheck_Line "dx_MV1CollCheck_Line" var,int,int,float,float,float,float,float,float
// 戻り値が構造体です（MV1_COLL_RESULT_POLY_DIM）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1CollCheck_LineDim "dx_MV1CollCheck_LineDim" var,int,int,float,float,float,float,float,float
// 戻り値が構造体です（MV1_COLL_RESULT_POLY_DIM）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1CollCheck_Sphere "dx_MV1CollCheck_Sphere" var,int,int,float,float,float,float
// 戻り値が構造体です（MV1_COLL_RESULT_POLY_DIM）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1CollCheck_Capsule "dx_MV1CollCheck_Capsule" var,int,int,float,float,float,float,float,float,float
// 戻り値が構造体です（MV1_COLL_RESULT_POLY_DIM）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1CollCheck_Triangle "dx_MV1CollCheck_Triangle" var,int,int,float,float,float,float,float,float,float,float,float
// 戻り値が構造体です（MV1_COLL_RESULT_POLY）
// 第一引数に戻り値を返却します。パラメタは第二引数以降にずれます。
#func global MV1CollCheck_GetResultPoly "dx_MV1CollCheck_GetResultPoly" var,int,int,int
#func global MV1CollResultPolyDimTerminate "dx_MV1CollResultPolyDimTerminate" int,int
#func global MV1SetupReferenceMesh "dx_MV1SetupReferenceMesh" int,int,int,int
#func global MV1TerminateReferenceMesh "dx_MV1TerminateReferenceMesh" int,int,int,int
#func global MV1RefreshReferenceMesh "dx_MV1RefreshReferenceMesh" int,int,int,int
#func global GetWindowCRect "dx_GetWindowCRect" sptr
#func global GetWindowActiveFlag "dx_GetWindowActiveFlag" 
#func global GetWindowMinSizeFlag "dx_GetWindowMinSizeFlag" 
#func global GetWindowMaxSizeFlag "dx_GetWindowMaxSizeFlag" 
#func global GetActiveFlag "dx_GetActiveFlag" 
#func global GetWindowModeFlag "dx_GetWindowModeFlag" 
#func global GetDefaultState "dx_GetDefaultState" sptr,sptr,sptr,sptr,sptr,sptr
#func global GetNoActiveState "dx_GetNoActiveState" int
#func global GetMouseDispFlag "dx_GetMouseDispFlag" 
#func global GetAlwaysRunFlag "dx_GetAlwaysRunFlag" 
#func global _GetSystemInfo "dx__GetSystemInfo" sptr,sptr,sptr
#func global GetPcInfo "dx_GetPcInfo" str,str,str,sptr,sptr,sptr,str,str,sptr,sptr
#func global GetUseMMXFlag "dx_GetUseMMXFlag" 
#func global GetUseSSEFlag "dx_GetUseSSEFlag" 
#func global GetUseSSE2Flag "dx_GetUseSSE2Flag" 
#func global GetWindowCloseFlag "dx_GetWindowCloseFlag" 
#func global GetUseWindowRgnFlag "dx_GetUseWindowRgnFlag" 
#func global GetWindowSize "dx_GetWindowSize" sptr,sptr
#func global GetWindowPosition "dx_GetWindowPosition" sptr,sptr
#func global GetWindowUserCloseFlag "dx_GetWindowUserCloseFlag" int
#func global GetNotDrawFlag "dx_GetNotDrawFlag" 
#func global GetPaintMessageFlag "dx_GetPaintMessageFlag" 
#func global GetValidHiPerformanceCounter "dx_GetValidHiPerformanceCounter" 
#func global ChangeWindowMode "dx_ChangeWindowMode" int
#func global SetUseCharSet "dx_SetUseCharSet" int
#func global LoadPauseGraph "dx_LoadPauseGraph" str
#func global LoadPauseGraphFromMem "dx_LoadPauseGraphFromMem" sptr,int
#func global SetWindowText "dx_SetWindowText" str
#func global SetMainWindowText "dx_SetMainWindowText" str
#func global SetMainWindowClassName "dx_SetMainWindowClassName" str
#func global SetAlwaysRunFlag "dx_SetAlwaysRunFlag" int
#func global SetWindowIconID "dx_SetWindowIconID" int
#func global SetWindowIconHandle "dx_SetWindowIconHandle" sptr
#func global SetWindowStyleMode "dx_SetWindowStyleMode" int
#func global SetWindowZOrder "dx_SetWindowZOrder" int
#func global SetWindowSizeChangeEnableFlag "dx_SetWindowSizeChangeEnableFlag" int,int
#func global SetWindowSizeExtendRate "dx_SetWindowSizeExtendRate" double,double
#func global SetWindowSize "dx_SetWindowSize" int,int
#func global SetWindowPosition "dx_SetWindowPosition" int,int
#func global SetSysCommandOffFlag "dx_SetSysCommandOffFlag" int,str
#func global SetUseHookWinProcReturnValue "dx_SetUseHookWinProcReturnValue" int
#func global SetDoubleStartValidFlag "dx_SetDoubleStartValidFlag" int
#func global AddMessageTakeOverWindow "dx_AddMessageTakeOverWindow" sptr
#func global SubMessageTakeOverWindow "dx_SubMessageTakeOverWindow" sptr
#func global SetWindowInitPosition "dx_SetWindowInitPosition" int,int
#func global SetNotWinFlag "dx_SetNotWinFlag" int
#func global SetNotDrawFlag "dx_SetNotDrawFlag" int
#func global SetNotSoundFlag "dx_SetNotSoundFlag" int
#func global SetNotInputFlag "dx_SetNotInputFlag" int
#func global SetDialogBoxHandle "dx_SetDialogBoxHandle" sptr
#func global SetWindowVisibleFlag "dx_SetWindowVisibleFlag" int
#func global SetWindowMinimizeFlag "dx_SetWindowMinimizeFlag" int
#func global SetWindowUserCloseEnableFlag "dx_SetWindowUserCloseEnableFlag" int
#func global SetDxLibEndPostQuitMessageFlag "dx_SetDxLibEndPostQuitMessageFlag" int
#func global SetUserWindow "dx_SetUserWindow" sptr
#func global SetUserChildWindow "dx_SetUserChildWindow" sptr
#func global SetUserWindowMessageProcessDXLibFlag "dx_SetUserWindowMessageProcessDXLibFlag" int
#func global SetUseFPUPreserveFlag "dx_SetUseFPUPreserveFlag" int
#func global SetValidMousePointerWindowOutClientAreaMoveFlag "dx_SetValidMousePointerWindowOutClientAreaMoveFlag" int
#func global SetUseBackBufferTransColorFlag "dx_SetUseBackBufferTransColorFlag" int
#func global SetUseUpdateLayerdWindowFlag "dx_SetUseUpdateLayerdWindowFlag" int
#func global GetClipboardText "dx_GetClipboardText" str
#func global SetClipboardText "dx_SetClipboardText" str
#func global SetDragFileValidFlag "dx_SetDragFileValidFlag" int
#func global DragFileInfoClear "dx_DragFileInfoClear" 
#func global GetDragFilePath "dx_GetDragFilePath" str
#func global GetDragFileNum "dx_GetDragFileNum" 
#func global SetWindowRgnGraph "dx_SetWindowRgnGraph" str
#func global UpdateTransColorWindowRgn "dx_UpdateTransColorWindowRgn" 
#func global SetupToolBar "dx_SetupToolBar" str,int,int
#func global AddToolBarButton "dx_AddToolBarButton" int,int,int,int
#func global AddToolBarSep "dx_AddToolBarSep" 
#func global GetToolBarButtonState "dx_GetToolBarButtonState" int
#func global SetToolBarButtonState "dx_SetToolBarButtonState" int,int
#func global DeleteAllToolBarButton "dx_DeleteAllToolBarButton" 
#func global SetUseMenuFlag "dx_SetUseMenuFlag" int
#func global SetUseKeyAccelFlag "dx_SetUseKeyAccelFlag" int
#func global AddKeyAccel "dx_AddKeyAccel" str,int,int,int,int,int
#func global AddKeyAccel_Name "dx_AddKeyAccel_Name" str,int,int,int,int
#func global AddKeyAccel_ID "dx_AddKeyAccel_ID" int,int,int,int,int
#func global ClearKeyAccel "dx_ClearKeyAccel" 
#func global AddMenuItem "dx_AddMenuItem" int,str,int,int,str,int
#func global DeleteMenuItem "dx_DeleteMenuItem" str,int
#func global CheckMenuItemSelect "dx_CheckMenuItemSelect" str,int
#func global SetMenuItemEnable "dx_SetMenuItemEnable" str,int,int
#func global SetMenuItemMark "dx_SetMenuItemMark" str,int,int
#func global CheckMenuItemSelectAll "dx_CheckMenuItemSelectAll" 
#func global AddMenuItem_Name "dx_AddMenuItem_Name" str,str
#func global AddMenuLine_Name "dx_AddMenuLine_Name" str
#func global InsertMenuItem_Name "dx_InsertMenuItem_Name" str,str
#func global InsertMenuLine_Name "dx_InsertMenuLine_Name" str
#func global DeleteMenuItem_Name "dx_DeleteMenuItem_Name" str
#func global CheckMenuItemSelect_Name "dx_CheckMenuItemSelect_Name" str
#func global SetMenuItemEnable_Name "dx_SetMenuItemEnable_Name" str,int
#func global SetMenuItemMark_Name "dx_SetMenuItemMark_Name" str,int
#func global AddMenuItem_ID "dx_AddMenuItem_ID" int,str,int
#func global AddMenuLine_ID "dx_AddMenuLine_ID" int
#func global InsertMenuItem_ID "dx_InsertMenuItem_ID" int,int
#func global InsertMenuLine_ID "dx_InsertMenuLine_ID" int,int
#func global DeleteMenuItem_ID "dx_DeleteMenuItem_ID" int
#func global CheckMenuItemSelect_ID "dx_CheckMenuItemSelect_ID" int
#func global SetMenuItemEnable_ID "dx_SetMenuItemEnable_ID" int,int
#func global SetMenuItemMark_ID "dx_SetMenuItemMark_ID" int,int
#func global DeleteMenuItemAll "dx_DeleteMenuItemAll" 
#func global ClearMenuItemSelect "dx_ClearMenuItemSelect" 
#func global GetMenuItemID "dx_GetMenuItemID" str
#func global GetMenuItemName "dx_GetMenuItemName" int,str
#func global LoadMenuResource "dx_LoadMenuResource" int
#func global SetDisplayMenuFlag "dx_SetDisplayMenuFlag" int
#func global GetDisplayMenuFlag "dx_GetDisplayMenuFlag" 
#func global GetUseMenuFlag "dx_GetUseMenuFlag" 
#func global SetAutoMenuDisplayFlag "dx_SetAutoMenuDisplayFlag" int
#func global SetKeyExclusiveCooperativeLevelFlag "dx_SetKeyExclusiveCooperativeLevelFlag" int
#func global SetKeyboardNotDirectInputFlag "dx_SetKeyboardNotDirectInputFlag" int
#func global SetUseDirectInputFlag "dx_SetUseDirectInputFlag" int
#func global SetUseXInputFlag "dx_SetUseXInputFlag" int
#func global GetJoypadName "dx_GetJoypadName" int,str,str
#func global ConvertKeyCodeToVirtualKey "dx_ConvertKeyCodeToVirtualKey" int
#func global ConvertVirtualKeyToKeyCode "dx_ConvertVirtualKeyToKeyCode" int
#func global LoadDivGraphToResource "dx_LoadDivGraphToResource" int,int,int,int,int,int,sptr
#func global LoadDivGraphToResource_2 "dx_LoadDivGraphToResource_2" str,str,int,int,int,int,int,sptr
#func global BltBackScreenToWindow "dx_BltBackScreenToWindow" sptr,int,int
#func global BltRectBackScreenToWindow "dx_BltRectBackScreenToWindow" sptr,int,int,int,int,int,int,int,int
#func global SetScreenFlipTargetWindow "dx_SetScreenFlipTargetWindow" sptr
#func global SetMultiThreadFlag "dx_SetMultiThreadFlag" int
#func global SetUseDirectDrawDeviceIndex "dx_SetUseDirectDrawDeviceIndex" int
#func global SetAeroDisableFlag "dx_SetAeroDisableFlag" int
#func global SetUseDirect3D9Ex "dx_SetUseDirect3D9Ex" int
#func global SetUseDirect3D11 "dx_SetUseDirect3D11" int
#func global SetUseDirect3D11MinFeatureLevel "dx_SetUseDirect3D11MinFeatureLevel" int
#func global SetUseDirect3DVersion "dx_SetUseDirect3DVersion" int
#func global GetUseDirect3DVersion "dx_GetUseDirect3DVersion" 
#func global GetUseDirect3D11FeatureLevel "dx_GetUseDirect3D11FeatureLevel" 
#func global SetUseDirectDrawFlag "dx_SetUseDirectDrawFlag" int
#func global SetUseGDIFlag "dx_SetUseGDIFlag" int
#func global GetUseGDIFlag "dx_GetUseGDIFlag" 
#func global GetDirectDrawDeviceDescription "dx_GetDirectDrawDeviceDescription" int,str
#func global GetDirectDrawDeviceNum "dx_GetDirectDrawDeviceNum" 
#func global GetUseDirect3DDevice9 "dx_GetUseDirect3DDevice9" 
#func global GetUseDirect3D9BackBufferSurface "dx_GetUseDirect3D9BackBufferSurface" 
#func global RefreshDxLibDirect3DSetting "dx_RefreshDxLibDirect3DSetting" 
#func global ColorKaiseki "dx_ColorKaiseki" sptr,sptr
#func global CreateFontDataFile "dx_CreateFontDataFile" str,str,int,int,int,int,int,str
#func global UpdateLayerdWindowForSoftImage "dx_UpdateLayerdWindowForSoftImage" int
#func global UpdateLayerdWindowForSoftImageRect "dx_UpdateLayerdWindowForSoftImageRect" int,int,int,int,int
#func global UpdateLayerdWindowForPremultipliedAlphaSoftImage "dx_UpdateLayerdWindowForPremultipliedAlphaSoftImage" int
#func global UpdateLayerdWindowForPremultipliedAlphaSoftImageRect "dx_UpdateLayerdWindowForPremultipliedAlphaSoftImageRect" int,int,int,int,int
#func global LoadSoundMemByResource "dx_LoadSoundMemByResource" str,str,int
#func global SetUseSoftwareMixingSoundFlag "dx_SetUseSoftwareMixingSoundFlag" int
#func global SetEnableXAudioFlag "dx_SetEnableXAudioFlag" int
#func global GetDSoundObj "dx_GetDSoundObj" 
#func global LoadMusicMemByResource "dx_LoadMusicMemByResource" str,str
#func global GetFPS "dx_GetFPS"
#func global SetFontLineSpaceToHandle "dx_SetFontLineSpaceToHandle" int,int

#define global TRUE 1
#define global FALSE 0
#define global MAX_IMAGE_NUM 32768
#define global MAX_2DSURFACE_NUM 32768
#define global MAX_3DSURFACE_NUM 65536
#define global MAX_IMAGE_DIVNUM 64
#define global MAX_SURFACE_NUM 65536
#define global MAX_SHADOWMAP_NUM 8192
#define global MAX_SOFTIMAGE_NUM 8192
#define global MAX_SOUND_NUM 32768
#define global MAX_SOFTSOUND_NUM 8192
#define global MAX_MUSIC_NUM 256
#define global MAX_MOVIE_NUM 100
#define global MAX_MASK_NUM 512
#define global MAX_FONT_NUM 40
#define global MAX_INPUT_NUM 256
#define global MAX_SOCKET_NUM 8192
#define global MAX_LIGHT_NUM 4096
#define global MAX_SHADER_NUM 4096
#define global MAX_CONSTANT_BUFFER_NUM 8192
#define global MAX_MODEL_BASE_NUM 32768
#define global MAX_MODEL_NUM 32768
#define global MAX_VERTEX_BUFFER_NUM 16384
#define global MAX_INDEX_BUFFER_NUM 16384
#define global MAX_FILE_NUM 32768
#define global MAX_JOYPAD_NUM 16
#define global MAX_EVENTPROCESS_NUM 5
#define global DEFAULT_SCREEN_SIZE_X 640
#define global DEFAULT_SCREEN_SIZE_Y 480
#define global DEFAULT_COLOR_BITDEPTH 16
#define global DEFAULT_ZBUFFER_BITDEPTH 16
#define global DX_DEFAULT_FONT_HANDLE 2
#define global MAX_USERIMAGEREAD_FUNCNUM 10
#define global DX_WINDOWSVERSION_31 0
#define global DX_WINDOWSVERSION_95 1
#define global DX_WINDOWSVERSION_98 2
#define global DX_WINDOWSVERSION_ME 3
#define global DX_WINDOWSVERSION_NT31 260
#define global DX_WINDOWSVERSION_NT40 261
#define global DX_WINDOWSVERSION_2000 262
#define global DX_WINDOWSVERSION_XP 263
#define global DX_WINDOWSVERSION_VISTA 264
#define global DX_WINDOWSVERSION_7 265
#define global DX_WINDOWSVERSION_8 266
#define global DX_WINDOWSVERSION_8_1 267
#define global DX_WINDOWSVERSION_10 268
#define global DX_WINDOWSVERSION_NT_TYPE 256
#define global DX_DIRECTXVERSION_NON 0
#define global DX_DIRECTXVERSION_1 65536
#define global DX_DIRECTXVERSION_2 131072
#define global DX_DIRECTXVERSION_3 196608
#define global DX_DIRECTXVERSION_4 262144
#define global DX_DIRECTXVERSION_5 327680
#define global DX_DIRECTXVERSION_6 393216
#define global DX_DIRECTXVERSION_6_1 393472
#define global DX_DIRECTXVERSION_7 458752
#define global DX_DIRECTXVERSION_8 524288
#define global DX_DIRECTXVERSION_8_1 524544
#define global DX_DIRECT3D_NONE 0
#define global DX_DIRECT3D_9 1
#define global DX_DIRECT3D_9EX 2
#define global DX_DIRECT3D_11 3
#define global DX_DIRECT3D_11_FEATURE_LEVEL_9_1 37120
#define global DX_DIRECT3D_11_FEATURE_LEVEL_9_2 37376
#define global DX_DIRECT3D_11_FEATURE_LEVEL_9_3 37632
#define global DX_DIRECT3D_11_FEATURE_LEVEL_10_0 40960
#define global DX_DIRECT3D_11_FEATURE_LEVEL_10_1 41216
#define global DX_DIRECT3D_11_FEATURE_LEVEL_11_0 45056
#define global DX_DIRECT3D_11_FEATURE_LEVEL_11_1 45312
#define global DX_CHARSET_DEFAULT 0
#define global DX_CHARSET_SHFTJIS 1
#define global DX_CHARSET_HANGEUL 2
#define global DX_CHARSET_BIG5 3
#define global DX_CHARSET_GB2312 4
#define global DX_CHARSET_NUM 5
#define global DX_CHARCODEFORMAT_SHIFTJIS 932
#define global DX_CHARCODEFORMAT_GB2312 936
#define global DX_CHARCODEFORMAT_UHC 949
#define global DX_CHARCODEFORMAT_BIG5 950
#define global DX_CHARCODEFORMAT_UTF16LE 1200
#define global DX_CHARCODEFORMAT_UTF16BE 1201
#define global DX_CHARCODEFORMAT_ASCII 1252
#define global DX_CHARCODEFORMAT_UTF8 65001
#define global DX_CHARCODEFORMAT_UTF32LE 32766
#define global DX_CHARCODEFORMAT_UTF32BE 32767
#define global DX_MIDIMODE_MCI 0
#define global DX_MIDIMODE_DM 1
#define global DX_DRAWMODE_NEAREST 0
#define global DX_DRAWMODE_BILINEAR 1
#define global DX_DRAWMODE_ANISOTROPIC 2
#define global DX_DRAWMODE_OTHER 3
#define global DX_DRAWMODE_NUM 4
#define global DX_FONTTYPE_NORMAL 0
#define global DX_FONTTYPE_EDGE 1
#define global DX_FONTTYPE_ANTIALIASING 2
#define global DX_FONTTYPE_ANTIALIASING_4X4 18
#define global DX_FONTTYPE_ANTIALIASING_8X8 34
#define global DX_FONTTYPE_ANTIALIASING_EDGE 3
#define global DX_FONTTYPE_ANTIALIASING_EDGE_4X4 19
#define global DX_FONTTYPE_ANTIALIASING_EDGE_8X8 35
#define global DX_FONTIMAGE_BIT_1 0
#define global DX_FONTIMAGE_BIT_4 1
#define global DX_FONTIMAGE_BIT_8 2
#define global DX_BLENDMODE_NOBLEND 0
#define global DX_BLENDMODE_ALPHA 1
#define global DX_BLENDMODE_ADD 2
#define global DX_BLENDMODE_SUB 3
#define global DX_BLENDMODE_MUL 4
#define global DX_BLENDMODE_SUB2 5
#define global DX_BLENDMODE_XOR 6
#define global DX_BLENDMODE_DESTCOLOR 8
#define global DX_BLENDMODE_INVDESTCOLOR 9
#define global DX_BLENDMODE_INVSRC 10
#define global DX_BLENDMODE_MULA 11
#define global DX_BLENDMODE_ALPHA_X4 12
#define global DX_BLENDMODE_ADD_X4 13
#define global DX_BLENDMODE_SRCCOLOR 14
#define global DX_BLENDMODE_HALF_ADD 15
#define global DX_BLENDMODE_SUB1 16
#define global DX_BLENDMODE_PMA_ALPHA 17
#define global DX_BLENDMODE_PMA_ADD 18
#define global DX_BLENDMODE_PMA_SUB 19
#define global DX_BLENDMODE_PMA_INVSRC 20
#define global DX_BLENDMODE_PMA_ALPHA_X4 21
#define global DX_BLENDMODE_PMA_ADD_X4 22
#define global DX_BLENDMODE_NUM 23
#define global DX_DRAWFLOATCOORDTYPE_DIRECT3D9 0
#define global DX_DRAWFLOATCOORDTYPE_DIRECT3D10 1
#define global DX_BLENDGRAPHTYPE_NORMAL 0
#define global DX_BLENDGRAPHTYPE_WIPE 1
#define global DX_BLENDGRAPHTYPE_ALPHA 2
#define global DX_GRAPH_FILTER_MONO 0
#define global DX_GRAPH_FILTER_GAUSS 1
#define global DX_GRAPH_FILTER_DOWN_SCALE 2
#define global DX_GRAPH_FILTER_BRIGHT_CLIP 3
#define global DX_GRAPH_FILTER_HSB 4
#define global DX_GRAPH_FILTER_INVERT 5
#define global DX_GRAPH_FILTER_LEVEL 6
#define global DX_GRAPH_FILTER_TWO_COLOR 7
#define global DX_GRAPH_FILTER_GRADIENT_MAP 8
#define global DX_GRAPH_FILTER_PREMUL_ALPHA 9
#define global DX_GRAPH_FILTER_INTERP_ALPHA 10
#define global DX_GRAPH_FILTER_NUM 11
#define global DX_GRAPH_BLEND_NORMAL 0
#define global DX_GRAPH_BLEND_RGBA_SELECT_MIX 1
#define global DX_GRAPH_BLEND_MULTIPLE 2
#define global DX_GRAPH_BLEND_DIFFERENCE 3
#define global DX_GRAPH_BLEND_ADD 4
#define global DX_GRAPH_BLEND_SCREEN 5
#define global DX_GRAPH_BLEND_OVERLAY 6
#define global DX_GRAPH_BLEND_DODGE 7
#define global DX_GRAPH_BLEND_BURN 8
#define global DX_GRAPH_BLEND_DARKEN 9
#define global DX_GRAPH_BLEND_LIGHTEN 10
#define global DX_GRAPH_BLEND_SOFTLIGHT 11
#define global DX_GRAPH_BLEND_HARDLIGHT 12
#define global DX_GRAPH_BLEND_EXCLUSION 13
#define global DX_GRAPH_BLEND_NORMAL_ALPHACH 14
#define global DX_GRAPH_BLEND_ADD_ALPHACH 15
#define global DX_GRAPH_BLEND_MULTIPLE_A_ONLY 16
#define global DX_GRAPH_BLEND_PMA_MULTIPLE_A_ONLY 17
#define global DX_GRAPH_BLEND_NUM 18
#define global DX_RGBA_SELECT_SRC_R 0
#define global DX_RGBA_SELECT_SRC_G 1
#define global DX_RGBA_SELECT_SRC_B 2
#define global DX_RGBA_SELECT_SRC_A 3
#define global DX_RGBA_SELECT_BLEND_R 4
#define global DX_RGBA_SELECT_BLEND_G 5
#define global DX_RGBA_SELECT_BLEND_B 6
#define global DX_RGBA_SELECT_BLEND_A 7
#define global DX_FILL_WIREFRAME 2
#define global DX_FILL_SOLID 3
#define global DX_CULLING_NONE 0
#define global DX_CULLING_LEFT 1
#define global DX_CULLING_RIGHT 2
#define global DX_CULLING_NUM 3
#define global DX_CAMERACLIP_LEFT 1
#define global DX_CAMERACLIP_RIGHT 2
#define global DX_CAMERACLIP_BOTTOM 4
#define global DX_CAMERACLIP_TOP 8
#define global DX_CAMERACLIP_BACK 16
#define global DX_CAMERACLIP_FRONT 32
#define global DX_MV1_VERTEX_TYPE_1FRAME 0
#define global DX_MV1_VERTEX_TYPE_4FRAME 1
#define global DX_MV1_VERTEX_TYPE_8FRAME 2
#define global DX_MV1_VERTEX_TYPE_FREE_FRAME 3
#define global DX_MV1_VERTEX_TYPE_NMAP_1FRAME 4
#define global DX_MV1_VERTEX_TYPE_NMAP_4FRAME 5
#define global DX_MV1_VERTEX_TYPE_NMAP_8FRAME 6
#define global DX_MV1_VERTEX_TYPE_NMAP_FREE_FRAME 7
#define global DX_MV1_VERTEX_TYPE_NUM 8
#define global DX_MV1_MESHCATEGORY_NORMAL 0
#define global DX_MV1_MESHCATEGORY_OUTLINE 1
#define global DX_MV1_MESHCATEGORY_OUTLINE_ORIG_SHADER 2
#define global DX_MV1_MESHCATEGORY_NUM 3
#define global MV1_SAVETYPE_MESH 1
#define global MV1_SAVETYPE_ANIM 2
#define global MV1_SAVETYPE_NORMAL ( MV1_SAVETYPE_MESH | MV1_SAVETYPE_ANIM  )
#define global MV1_ANIMKEY_DATATYPE_ROTATE 0
#define global MV1_ANIMKEY_DATATYPE_ROTATE_X 1
#define global MV1_ANIMKEY_DATATYPE_ROTATE_Y 2
#define global MV1_ANIMKEY_DATATYPE_ROTATE_Z 3
#define global MV1_ANIMKEY_DATATYPE_SCALE 5
#define global MV1_ANIMKEY_DATATYPE_SCALE_X 6
#define global MV1_ANIMKEY_DATATYPE_SCALE_Y 7
#define global MV1_ANIMKEY_DATATYPE_SCALE_Z 8
#define global MV1_ANIMKEY_DATATYPE_TRANSLATE 10
#define global MV1_ANIMKEY_DATATYPE_TRANSLATE_X 11
#define global MV1_ANIMKEY_DATATYPE_TRANSLATE_Y 12
#define global MV1_ANIMKEY_DATATYPE_TRANSLATE_Z 13
#define global MV1_ANIMKEY_DATATYPE_MATRIX4X4C 15
#define global MV1_ANIMKEY_DATATYPE_MATRIX3X3 17
#define global MV1_ANIMKEY_DATATYPE_SHAPE 18
#define global MV1_ANIMKEY_DATATYPE_OTHRE 20
#define global MV1_ANIMKEY_TIME_TYPE_ONE 0
#define global MV1_ANIMKEY_TIME_TYPE_KEY 1
#define global MV1_ANIMKEY_TYPE_QUATERNION_X 0
#define global MV1_ANIMKEY_TYPE_VECTOR 1
#define global MV1_ANIMKEY_TYPE_MATRIX4X4C 2
#define global MV1_ANIMKEY_TYPE_MATRIX3X3 3
#define global MV1_ANIMKEY_TYPE_FLAT 4
#define global MV1_ANIMKEY_TYPE_LINEAR 5
#define global MV1_ANIMKEY_TYPE_BLEND 6
#define global MV1_ANIMKEY_TYPE_QUATERNION_VMD 7
#define global DX_SCREEN_FRONT -4
#define global DX_SCREEN_BACK -2
#define global DX_SCREEN_WORK -3
#define global DX_SCREEN_TEMPFRONT -5
#define global DX_NONE_GRAPH -5
#define global DX_SHAVEDMODE_NONE 0
#define global DX_SHAVEDMODE_DITHER 1
#define global DX_SHAVEDMODE_DIFFUS 2
#define global DX_IMAGESAVETYPE_BMP 0
#define global DX_IMAGESAVETYPE_JPEG 1
#define global DX_IMAGESAVETYPE_PNG 2
#define global DX_PLAYTYPE_LOOPBIT 2
#define global DX_PLAYTYPE_BACKBIT 1
#define global DX_PLAYTYPE_NORMAL 0
#define global DX_PLAYTYPE_BACK ( DX_PLAYTYPE_BACKBIT  )
#define global DX_PLAYTYPE_LOOP ( DX_PLAYTYPE_LOOPBIT | DX_PLAYTYPE_BACKBIT  )
#define global DX_MOVIEPLAYTYPE_BCANCEL 0
#define global DX_MOVIEPLAYTYPE_NORMAL 1
#define global DX_SOUNDTYPE_NORMAL 0
#define global DX_SOUNDTYPE_STREAMSTYLE 1
#define global DX_SOUNDDATATYPE_MEMNOPRESS 0
#define global DX_SOUNDDATATYPE_MEMNOPRESS_PLUS 1
#define global DX_SOUNDDATATYPE_MEMPRESS 2
#define global DX_SOUNDDATATYPE_FILE 3
#define global DX_READSOUNDFUNCTION_PCM 1
#define global DX_READSOUNDFUNCTION_OGG 1
#define global DX_READSOUNDFUNCTION_DEFAULT_NUM 2
#define global DX_REVERB_PRESET_DEFAULT 0
#define global DX_REVERB_PRESET_GENERIC 1
#define global DX_REVERB_PRESET_PADDEDCELL 2
#define global DX_REVERB_PRESET_ROOM 3
#define global DX_REVERB_PRESET_BATHROOM 4
#define global DX_REVERB_PRESET_LIVINGROOM 5
#define global DX_REVERB_PRESET_STONEROOM 6
#define global DX_REVERB_PRESET_AUDITORIUM 7
#define global DX_REVERB_PRESET_CONCERTHALL 8
#define global DX_REVERB_PRESET_CAVE 9
#define global DX_REVERB_PRESET_ARENA 10
#define global DX_REVERB_PRESET_HANGAR 11
#define global DX_REVERB_PRESET_CARPETEDHALLWAY 12
#define global DX_REVERB_PRESET_HALLWAY 13
#define global DX_REVERB_PRESET_STONECORRIDOR 14
#define global DX_REVERB_PRESET_ALLEY 15
#define global DX_REVERB_PRESET_FOREST 16
#define global DX_REVERB_PRESET_CITY 17
#define global DX_REVERB_PRESET_MOUNTAINS 18
#define global DX_REVERB_PRESET_QUARRY 19
#define global DX_REVERB_PRESET_PLAIN 20
#define global DX_REVERB_PRESET_PARKINGLOT 21
#define global DX_REVERB_PRESET_SEWERPIPE 22
#define global DX_REVERB_PRESET_UNDERWATER 23
#define global DX_REVERB_PRESET_SMALLROOM 24
#define global DX_REVERB_PRESET_MEDIUMROOM 25
#define global DX_REVERB_PRESET_LARGEROOM 26
#define global DX_REVERB_PRESET_MEDIUMHALL 27
#define global DX_REVERB_PRESET_LARGEHALL 28
#define global DX_REVERB_PRESET_PLATE 29
#define global DX_REVERB_PRESET_NUM 30
#define global DX_MASKTRANS_WHITE 0
#define global DX_MASKTRANS_BLACK 1
#define global DX_MASKTRANS_NONE 2
#define global DX_ZWRITE_MASK 0
#define global DX_ZWRITE_CLEAR 1
#define global DX_CMP_NEVER 1
#define global DX_CMP_LESS 2
#define global DX_CMP_EQUAL 3
#define global DX_CMP_LESSEQUAL 4
#define global DX_CMP_GREATER 5
#define global DX_CMP_NOTEQUAL 6
#define global DX_CMP_GREATEREQUAL 7
#define global DX_CMP_ALWAYS 8
#define global DX_ZCMP_DEFAULT ( DX_CMP_LESSEQUAL  )
#define global DX_ZCMP_REVERSE ( DX_CMP_GREATEREQUAL  )
#define global DX_SHADEMODE_FLAT 1
#define global DX_SHADEMODE_GOURAUD 2
#define global DX_FOGMODE_NONE 0
#define global DX_FOGMODE_EXP 1
#define global DX_FOGMODE_EXP2 2
#define global DX_FOGMODE_LINEAR 3
#define global DX_MATERIAL_TYPE_NORMAL 0
#define global DX_MATERIAL_TYPE_TOON 1
#define global DX_MATERIAL_TYPE_TOON_2 2
#define global DX_MATERIAL_BLENDTYPE_TRANSLUCENT 0
#define global DX_MATERIAL_BLENDTYPE_ADDITIVE 1
#define global DX_MATERIAL_BLENDTYPE_MODULATE 2
#define global DX_MATERIAL_BLENDTYPE_NONE 3
#define global DX_TEXADDRESS_WRAP 1
#define global DX_TEXADDRESS_MIRROR 2
#define global DX_TEXADDRESS_CLAMP 3
#define global DX_TEXADDRESS_BORDER 4
#define global DX_TEXADDRESS_NUM 5
#define global DX_SHADERTYPE_VERTEX 0
#define global DX_SHADERTYPE_PIXEL 1
#define global DX_SHADERTYPE_GEOMETRY 2
#define global DX_SHADERTYPE_COMPUTE 3
#define global DX_SHADERTYPE_DOMAIN 4
#define global DX_SHADERTYPE_HULL 5
#define global DX_VERTEX_TYPE_NORMAL_3D 0
#define global DX_VERTEX_TYPE_SHADER_3D 1
#define global DX_VERTEX_TYPE_NUM 2
#define global DX_INDEX_TYPE_16BIT 0
#define global DX_INDEX_TYPE_32BIT 1
#define global DX_LOADMODEL_PHYSICS_DISABLE 1
#define global DX_LOADMODEL_PHYSICS_LOADCALC 0
#define global DX_LOADMODEL_PHYSICS_REALTIME 2
#define global DX_SEMITRANSDRAWMODE_ALWAYS 0
#define global DX_SEMITRANSDRAWMODE_SEMITRANS_ONLY 1
#define global DX_SEMITRANSDRAWMODE_NOT_SEMITRANS_ONLY 2
#define global DX_CUBEMAP_FACE_POSITIVE_X 0
#define global DX_CUBEMAP_FACE_NEGATIVE_X 1
#define global DX_CUBEMAP_FACE_POSITIVE_Y 2
#define global DX_CUBEMAP_FACE_NEGATIVE_Y 3
#define global DX_CUBEMAP_FACE_POSITIVE_Z 4
#define global DX_CUBEMAP_FACE_NEGATIVE_Z 5
#define global DX_PRIMTYPE_POINTLIST 1
#define global DX_PRIMTYPE_LINELIST 2
#define global DX_PRIMTYPE_LINESTRIP 3
#define global DX_PRIMTYPE_TRIANGLELIST 4
#define global DX_PRIMTYPE_TRIANGLESTRIP 5
#define global DX_PRIMTYPE_TRIANGLEFAN 6
#define global DX_LIGHTTYPE_D3DLIGHT_POINT 1
#define global DX_LIGHTTYPE_D3DLIGHT_SPOT 2
#define global DX_LIGHTTYPE_D3DLIGHT_DIRECTIONAL 3
#define global DX_LIGHTTYPE_POINT 1
#define global DX_LIGHTTYPE_SPOT 2
#define global DX_LIGHTTYPE_DIRECTIONAL 3
#define global DX_GRAPHICSIMAGE_FORMAT_3D_PAL4 0
#define global DX_GRAPHICSIMAGE_FORMAT_3D_PAL8 1
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_PAL4 2
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_PAL8 3
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_PAL4 4
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_PAL8 5
#define global DX_GRAPHICSIMAGE_FORMAT_3D_RGB16 6
#define global DX_GRAPHICSIMAGE_FORMAT_3D_RGB32 7
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_RGB16 8
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_RGB32 9
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_RGB16 10
#define global DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_RGB32 11
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DXT1 12
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DXT2 13
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DXT3 14
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DXT4 15
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DXT5 16
#define global DX_GRAPHICSIMAGE_FORMAT_3D_YUV 16
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_RGB16 17
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_RGB32 18
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ALPHA_RGB32 19
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ABGR_I16 20
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ABGR_F16 21
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ABGR_F32 22
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_I8 23
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_I16 24
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_F16 25
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_F32 26
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_I8 27
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_I16 28
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_F16 29
#define global DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_F32 30
#define global DX_GRAPHICSIMAGE_FORMAT_3D_NUM 31
#define global DX_GRAPHICSIMAGE_FORMAT_2D 32
#define global DX_GRAPHICSIMAGE_FORMAT_R5G6B5 33
#define global DX_GRAPHICSIMAGE_FORMAT_X8A8R5G6B5 34
#define global DX_GRAPHICSIMAGE_FORMAT_X8R8G8B8 35
#define global DX_GRAPHICSIMAGE_FORMAT_A8R8G8B8 36
#define global DX_GRAPHICSIMAGE_FORMAT_NUM 37
#define global DX_BASEIMAGE_FORMAT_NORMAL 0
#define global DX_BASEIMAGE_FORMAT_DXT1 1
#define global DX_BASEIMAGE_FORMAT_DXT2 2
#define global DX_BASEIMAGE_FORMAT_DXT3 3
#define global DX_BASEIMAGE_FORMAT_DXT4 4
#define global DX_BASEIMAGE_FORMAT_DXT5 5
#define global DX_BASEIMAGE_FORMAT_YUV 6
#define global DX_WIN_ZTYPE_NORMAL 0
#define global DX_WIN_ZTYPE_BOTTOM 1
#define global DX_WIN_ZTYPE_TOP 2
#define global DX_WIN_ZTYPE_TOPMOST 3
#define global TOOLBUTTON_STATE_ENABLE 0
#define global TOOLBUTTON_STATE_PRESSED 1
#define global TOOLBUTTON_STATE_DISABLE 2
#define global TOOLBUTTON_STATE_PRESSED_DISABLE 3
#define global TOOLBUTTON_STATE_NUM 4
#define global TOOLBUTTON_TYPE_NORMAL 0
#define global TOOLBUTTON_TYPE_CHECK 1
#define global TOOLBUTTON_TYPE_GROUP 2
#define global TOOLBUTTON_TYPE_SEP 3
#define global TOOLBUTTON_TYPE_NUM 4
#define global MENUITEM_IDTOP -1414812757
#define global MENUITEM_ADD_CHILD 0
#define global MENUITEM_ADD_INSERT 1
#define global MENUITEM_MARK_NONE 0
#define global MENUITEM_MARK_CHECK 1
#define global MENUITEM_MARK_RADIO 2
#define global DX_NUMMODE_10 0
#define global DX_NUMMODE_16 1
#define global DX_STRMODE_NOT0 2
#define global DX_STRMODE_USE0 3
#define global DX_CHECKINPUT_KEY 1
#define global DX_CHECKINPUT_PAD 2
#define global DX_CHECKINPUT_MOUSE 4
#define global DX_CHECKINPUT_ALL DX_CHECKINPUT_KEY
#define global DX_INPUT_KEY_PAD1 4097
#define global DX_INPUT_PAD1 1
#define global DX_INPUT_PAD2 2
#define global DX_INPUT_PAD3 3
#define global DX_INPUT_PAD4 4
#define global DX_INPUT_PAD5 5
#define global DX_INPUT_PAD6 6
#define global DX_INPUT_PAD7 7
#define global DX_INPUT_PAD8 8
#define global DX_INPUT_PAD9 9
#define global DX_INPUT_PAD10 10
#define global DX_INPUT_PAD11 11
#define global DX_INPUT_PAD12 12
#define global DX_INPUT_PAD13 13
#define global DX_INPUT_PAD14 14
#define global DX_INPUT_PAD15 15
#define global DX_INPUT_PAD16 16
#define global DX_INPUT_KEY 4096
#define global DX_MOVIESURFACE_NORMAL 0
#define global DX_MOVIESURFACE_OVERLAY 1
#define global DX_MOVIESURFACE_FULLCOLOR 2
#define global PAD_INPUT_DOWN 1
#define global PAD_INPUT_LEFT 2
#define global PAD_INPUT_RIGHT 4
#define global PAD_INPUT_UP 8
#define global PAD_INPUT_A 16
#define global PAD_INPUT_B 32
#define global PAD_INPUT_C 64
#define global PAD_INPUT_X 128
#define global PAD_INPUT_Y 256
#define global PAD_INPUT_Z 512
#define global PAD_INPUT_L 1024
#define global PAD_INPUT_R 2048
#define global PAD_INPUT_START 4096
#define global PAD_INPUT_M 8192
#define global PAD_INPUT_D 16384
#define global PAD_INPUT_F 32768
#define global PAD_INPUT_G 65536
#define global PAD_INPUT_H 131072
#define global PAD_INPUT_I 262144
#define global PAD_INPUT_J 524288
#define global PAD_INPUT_K 1048576
#define global PAD_INPUT_LL 2097152
#define global PAD_INPUT_N 4194304
#define global PAD_INPUT_O 8388608
#define global PAD_INPUT_P 16777216
#define global PAD_INPUT_RR 33554432
#define global PAD_INPUT_S 67108864
#define global PAD_INPUT_T 134217728
#define global PAD_INPUT_U 268435456
#define global PAD_INPUT_V 536870912
#define global PAD_INPUT_W 1073741824
#define global PAD_INPUT_XX -2147483648
#define global PAD_INPUT_1 16
#define global PAD_INPUT_2 32
#define global PAD_INPUT_3 64
#define global PAD_INPUT_4 128
#define global PAD_INPUT_5 256
#define global PAD_INPUT_6 512
#define global PAD_INPUT_7 1024
#define global PAD_INPUT_8 2048
#define global PAD_INPUT_9 4096
#define global PAD_INPUT_10 8192
#define global PAD_INPUT_11 16384
#define global PAD_INPUT_12 32768
#define global PAD_INPUT_13 65536
#define global PAD_INPUT_14 131072
#define global PAD_INPUT_15 262144
#define global PAD_INPUT_16 524288
#define global PAD_INPUT_17 1048576
#define global PAD_INPUT_18 2097152
#define global PAD_INPUT_19 4194304
#define global PAD_INPUT_20 8388608
#define global PAD_INPUT_21 16777216
#define global PAD_INPUT_22 33554432
#define global PAD_INPUT_23 67108864
#define global PAD_INPUT_24 134217728
#define global PAD_INPUT_25 268435456
#define global PAD_INPUT_26 536870912
#define global PAD_INPUT_27 1073741824
#define global PAD_INPUT_28 -2147483648
#define global XINPUT_BUTTON_DPAD_UP 0
#define global XINPUT_BUTTON_DPAD_DOWN 1
#define global XINPUT_BUTTON_DPAD_LEFT 2
#define global XINPUT_BUTTON_DPAD_RIGHT 3
#define global XINPUT_BUTTON_START 4
#define global XINPUT_BUTTON_BACK 5
#define global XINPUT_BUTTON_LEFT_THUMB 6
#define global XINPUT_BUTTON_RIGHT_THUMB 7
#define global XINPUT_BUTTON_LEFT_SHOULDER 8
#define global XINPUT_BUTTON_RIGHT_SHOULDER 9
#define global XINPUT_BUTTON_A 12
#define global XINPUT_BUTTON_B 13
#define global XINPUT_BUTTON_X 14
#define global XINPUT_BUTTON_Y 15
#define global MOUSE_INPUT_LEFT 1
#define global MOUSE_INPUT_RIGHT 2
#define global MOUSE_INPUT_MIDDLE 4
#define global MOUSE_INPUT_1 1
#define global MOUSE_INPUT_2 2
#define global MOUSE_INPUT_3 4
#define global MOUSE_INPUT_4 8
#define global MOUSE_INPUT_5 16
#define global MOUSE_INPUT_6 32
#define global MOUSE_INPUT_7 64
#define global MOUSE_INPUT_8 128
#define global KEY_INPUT_BACK 14
#define global KEY_INPUT_TAB 15
#define global KEY_INPUT_RETURN 28
#define global KEY_INPUT_LSHIFT 42
#define global KEY_INPUT_RSHIFT 54
#define global KEY_INPUT_LCONTROL 29
#define global KEY_INPUT_RCONTROL 157
#define global KEY_INPUT_ESCAPE 1
#define global KEY_INPUT_SPACE 57
#define global KEY_INPUT_PGUP 201
#define global KEY_INPUT_PGDN 209
#define global KEY_INPUT_END 207
#define global KEY_INPUT_HOME 199
#define global KEY_INPUT_LEFT 203
#define global KEY_INPUT_UP 200
#define global KEY_INPUT_RIGHT 205
#define global KEY_INPUT_DOWN 208
#define global KEY_INPUT_INSERT 210
#define global KEY_INPUT_DELETE 211
#define global KEY_INPUT_MINUS 12
#define global KEY_INPUT_YEN 125
#define global KEY_INPUT_PREVTRACK 144
#define global KEY_INPUT_PERIOD 52
#define global KEY_INPUT_SLASH 53
#define global KEY_INPUT_LALT 56
#define global KEY_INPUT_RALT 184
#define global KEY_INPUT_SCROLL 70
#define global KEY_INPUT_SEMICOLON 39
#define global KEY_INPUT_COLON 146
#define global KEY_INPUT_LBRACKET 26
#define global KEY_INPUT_RBRACKET 27
#define global KEY_INPUT_AT 145
#define global KEY_INPUT_BACKSLASH 43
#define global KEY_INPUT_COMMA 51
#define global KEY_INPUT_KANJI 148
#define global KEY_INPUT_CONVERT 121
#define global KEY_INPUT_NOCONVERT 123
#define global KEY_INPUT_KANA 112
#define global KEY_INPUT_APPS 221
#define global KEY_INPUT_CAPSLOCK 58
#define global KEY_INPUT_SYSRQ 183
#define global KEY_INPUT_PAUSE 197
#define global KEY_INPUT_LWIN 219
#define global KEY_INPUT_RWIN 220
#define global KEY_INPUT_NUMLOCK 69
#define global KEY_INPUT_NUMPAD0 82
#define global KEY_INPUT_NUMPAD1 79
#define global KEY_INPUT_NUMPAD2 80
#define global KEY_INPUT_NUMPAD3 81
#define global KEY_INPUT_NUMPAD4 75
#define global KEY_INPUT_NUMPAD5 76
#define global KEY_INPUT_NUMPAD6 77
#define global KEY_INPUT_NUMPAD7 71
#define global KEY_INPUT_NUMPAD8 72
#define global KEY_INPUT_NUMPAD9 73
#define global KEY_INPUT_MULTIPLY 55
#define global KEY_INPUT_ADD 78
#define global KEY_INPUT_SUBTRACT 74
#define global KEY_INPUT_DECIMAL 83
#define global KEY_INPUT_DIVIDE 181
#define global KEY_INPUT_NUMPADENTER 156
#define global KEY_INPUT_F1 59
#define global KEY_INPUT_F2 60
#define global KEY_INPUT_F3 61
#define global KEY_INPUT_F4 62
#define global KEY_INPUT_F5 63
#define global KEY_INPUT_F6 64
#define global KEY_INPUT_F7 65
#define global KEY_INPUT_F8 66
#define global KEY_INPUT_F9 67
#define global KEY_INPUT_F10 68
#define global KEY_INPUT_F11 87
#define global KEY_INPUT_F12 88
#define global KEY_INPUT_A 30
#define global KEY_INPUT_B 48
#define global KEY_INPUT_C 46
#define global KEY_INPUT_D 32
#define global KEY_INPUT_E 18
#define global KEY_INPUT_F 33
#define global KEY_INPUT_G 34
#define global KEY_INPUT_H 35
#define global KEY_INPUT_I 23
#define global KEY_INPUT_J 36
#define global KEY_INPUT_K 37
#define global KEY_INPUT_L 38
#define global KEY_INPUT_M 50
#define global KEY_INPUT_N 49
#define global KEY_INPUT_O 24
#define global KEY_INPUT_P 25
#define global KEY_INPUT_Q 16
#define global KEY_INPUT_R 19
#define global KEY_INPUT_S 31
#define global KEY_INPUT_T 20
#define global KEY_INPUT_U 22
#define global KEY_INPUT_V 47
#define global KEY_INPUT_W 17
#define global KEY_INPUT_X 45
#define global KEY_INPUT_Y 21
#define global KEY_INPUT_Z 44
#define global KEY_INPUT_0 11
#define global KEY_INPUT_1 2
#define global KEY_INPUT_2 3
#define global KEY_INPUT_3 4
#define global KEY_INPUT_4 5
#define global KEY_INPUT_5 6
#define global KEY_INPUT_6 7
#define global KEY_INPUT_7 8
#define global KEY_INPUT_8 9
#define global KEY_INPUT_9 10
#define global CTRL_CODE_BS 8
#define global CTRL_CODE_TAB 9
#define global CTRL_CODE_CR 13
#define global CTRL_CODE_DEL 16
#define global CTRL_CODE_COPY 3
#define global CTRL_CODE_PASTE 22
#define global CTRL_CODE_CUT 24
#define global CTRL_CODE_ALL 1
#define global CTRL_CODE_LEFT 29
#define global CTRL_CODE_RIGHT 28
#define global CTRL_CODE_UP 30
#define global CTRL_CODE_DOWN 31
#define global CTRL_CODE_HOME 26
#define global CTRL_CODE_END 25
#define global CTRL_CODE_PAGE_UP 23
#define global CTRL_CODE_PAGE_DOWN 21
#define global CTRL_CODE_ESC 27
#define global CTRL_CODE_CMP 32
#define global DX_KEYINPSTRCOLOR_NORMAL_STR 0
#define global DX_KEYINPSTRCOLOR_NORMAL_STR_EDGE 1
#define global DX_KEYINPSTRCOLOR_NORMAL_CURSOR 2
#define global DX_KEYINPSTRCOLOR_SELECT_STR 3
#define global DX_KEYINPSTRCOLOR_SELECT_STR_EDGE 4
#define global DX_KEYINPSTRCOLOR_SELECT_STR_BACK 5
#define global DX_KEYINPSTRCOLOR_IME_STR 6
#define global DX_KEYINPSTRCOLOR_IME_STR_EDGE 7
#define global DX_KEYINPSTRCOLOR_IME_STR_BACK 8
#define global DX_KEYINPSTRCOLOR_IME_CURSOR 9
#define global DX_KEYINPSTRCOLOR_IME_LINE 10
#define global DX_KEYINPSTRCOLOR_IME_SELECT_STR 11
#define global DX_KEYINPSTRCOLOR_IME_SELECT_STR_EDGE 12
#define global DX_KEYINPSTRCOLOR_IME_SELECT_STR_BACK 13
#define global DX_KEYINPSTRCOLOR_IME_CONV_WIN_STR 14
#define global DX_KEYINPSTRCOLOR_IME_CONV_WIN_STR_EDGE 15
#define global DX_KEYINPSTRCOLOR_IME_CONV_WIN_SELECT_STR 16
#define global DX_KEYINPSTRCOLOR_IME_CONV_WIN_SELECT_STR_EDGE 17
#define global DX_KEYINPSTRCOLOR_IME_CONV_WIN_SELECT_STR_BACK 18
#define global DX_KEYINPSTRCOLOR_IME_CONV_WIN_EDGE 19
#define global DX_KEYINPSTRCOLOR_IME_CONV_WIN_BACK 20
#define global DX_KEYINPSTRCOLOR_IME_MODE_STR 21
#define global DX_KEYINPSTRCOLOR_IME_MODE_STR_EDGE 22
#define global DX_KEYINPSTRCOLOR_NUM 23
#define global DX_KEYINPSTR_ENDCHARAMODE_OVERWRITE 0
#define global DX_KEYINPSTR_ENDCHARAMODE_NOTCHANGE 1
#define global DX_FSRESOLUTIONMODE_NATIVE 0
#define global DX_FSRESOLUTIONMODE_DESKTOP 1
#define global DX_FSRESOLUTIONMODE_MAXIMUM 2
#define global DX_FSSCALINGMODE_BILINEAR 0
#define global DX_FSSCALINGMODE_NEAREST 1
#define global DX_CHANGESCREEN_OK 0
#define global DX_CHANGESCREEN_RETURN 1
#define global DX_CHANGESCREEN_DEFAULT 2
#define global DX_CHANGESCREEN_REFRESHNORMAL 3
#define global LOADIMAGE_TYPE_FILE 0
#define global LOADIMAGE_TYPE_MEM 1
#define global LOADIMAGE_TYPE_NONE 1
#define global HTTP_ERR_SERVER 0
#define global HTTP_ERR_NOTFOUND 1
#define global HTTP_ERR_MEMORY 2
#define global HTTP_ERR_LOST 3
#define global HTTP_ERR_NONE 1
#define global HTTP_RES_COMPLETE 0
#define global HTTP_RES_STOP 1
#define global HTTP_RES_ERROR 2
#define global HTTP_RES_NOW 1

// VECTOR => float, float, float
#define global ctype VGet(%1,%2,%3) %1, %2, %3
#define global ctype VAdd(%1,%2,%3,%4,%5,%6) %1+%4, %2+%5, %3+%6
#define global ctype VSub(%1,%2,%3,%4,%5,%6) %1-%4, %2-%5, %3-%6
#define global ctype VDot(%1,%2,%3,%4,%5,%6) %1*%4+%2*%5+%3*%6
#define global ctype VCross(%1,%2,%3,%4,%5,%6) %2*%6-%3*%5, %3*%4-%1*%6, %1*%5-%2*%4
#define global ctype VScale(%1,%2,%3,%4) %1*%4, %2*%4, %3*%4
#define global ctype VSquareSize(%1,%2,%3) %1*%1+%2*%2+%3*%3
// 行列だからdimの方が良いのか…(MATRIX 4x4)
#define global ctype VTransform(%1,%2,%3, %4,%5,%6,%7, %8,%9,%10,%11, %12,%13,%14,%15, %16,%17,%18,%19) %1*%4 + %2*%8 + %3*%12 + %16, %1*%5 + %2*%9 + %3*%13 + %17, %1*%6 + %2*%10 + %3*%14 + %18
#define global ctype VTransformSR(%1,%2,%3, %4,%5,%6,%7, %8,%9,%10,%11, %12,%13,%14,%15, %16,%17,%18,%19) %1*%4 + %2*%8 + %3*%12, %1*%5 + %2*%9 + %3*%13, %1*%6 + %2*%10 + %3*%14
// VConvFtoD, VConvDtoF未実装
#define global VGetD VGet
#define global VAddD VAdd
#define global VSubD VSub
#define global VDotD VDot
#define global VCrossD VCross
#define global VScaleD VScale
#define global VSquareSizeD VSquareSize
#define global VTransformD VTransform
#define global VTransformSRD VTransformSR

#endif
