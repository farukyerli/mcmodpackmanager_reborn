; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Minecraft Modpack Manager Reborn"
!define PRODUCT_VERSION "7.7.0"
!define PRODUCT_PUBLISHER "MrQuantumOFF (Demir Yerli)"
!define PRODUCT_WEB_SITE "https://mrquantumoff.dev/projects/mcmodpackmanager_reborn"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\mcmodpackmanager_reborn.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "assets\icons\logo.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "LICENSE"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Minecraft Modpack Manager Reborn"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\mcmodpackmanager_reborn.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Ukrainian"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "MCModpackManagerSetup.exe"
InstallDir "$PROGRAMFILES\Minecraft Modpack Manager Reborn"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "The app" SEC01
  SetOutPath "$INSTDIR\data"
  File "build\windows\runner\Release\data\app.so"
  SetOutPath "$INSTDIR\data\flutter_assets"
  File "build\windows\runner\Release\data\flutter_assets\AssetManifest.json"
  SetOutPath "$INSTDIR\data\flutter_assets\assets\icons"
  File "build\windows\runner\Release\data\flutter_assets\assets\icons\logo.svg"
  File "build\windows\runner\Release\data\flutter_assets\assets\icons\logo256.png"
  File "build\windows\runner\Release\data\flutter_assets\assets\icons\logotext.svg"
  SetOutPath "$INSTDIR\data\flutter_assets"
  File "build\windows\runner\Release\data\flutter_assets\FontManifest.json"
  SetOutPath "$INSTDIR\data\flutter_assets\fonts"
  File "build\windows\runner\Release\data\flutter_assets\fonts\MaterialIcons-Regular.otf"
  SetOutPath "$INSTDIR\data\flutter_assets"
  File "build\windows\runner\Release\data\flutter_assets\kernel_blob.bin"
  File "build\windows\runner\Release\data\flutter_assets\NOTICES.Z"
  SetOutPath "$INSTDIR\data\flutter_assets\packages\cupertino_icons\assets"
  File "build\windows\runner\Release\data\flutter_assets\packages\cupertino_icons\assets\CupertinoIcons.ttf"
  SetOutPath "$INSTDIR\data\flutter_assets\packages\window_manager\images"
  File "build\windows\runner\Release\data\flutter_assets\packages\window_manager\images\ic_chrome_close.png"
  File "build\windows\runner\Release\data\flutter_assets\packages\window_manager\images\ic_chrome_maximize.png"
  File "build\windows\runner\Release\data\flutter_assets\packages\window_manager\images\ic_chrome_minimize.png"
  File "build\windows\runner\Release\data\flutter_assets\packages\window_manager\images\ic_chrome_unmaximize.png"
  SetOutPath "$INSTDIR\data\flutter_assets\shaders"
  File "build\windows\runner\Release\data\flutter_assets\shaders\ink_sparkle.frag"
  SetOutPath "$INSTDIR\data"
  File "build\windows\runner\Release\data\icudtl.dat"
  SetOutPath "$INSTDIR"
  File "build\windows\runner\Release\dynamic_color_plugin.dll"
  File "build\windows\runner\Release\flutter_platform_alert_plugin.dll"
  File "build\windows\runner\Release\flutter_windows.dll"
  File "build\windows\runner\Release\mcmodpackmanager_reborn.exe"
  File "build\windows\runner\Release\screen_retriever_plugin.dll"
  File "build\windows\runner\Release\url_launcher_windows_plugin.dll"
  File "build\windows\runner\Release\window_manager_plugin.dll"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Minecraft Modpack Manager Reborn.lnk" "$INSTDIR\mcmodpackmanager_reborn.exe"
  CreateShortCut "$DESKTOP\Minecraft Modpack Manager Reborn.lnk" "$INSTDIR\mcmodpackmanager_reborn.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\mcmodpackmanager_reborn.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\mcmodpackmanager_reborn.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\window_manager_plugin.dll"
  Delete "$INSTDIR\url_launcher_windows_plugin.dll"
  Delete "$INSTDIR\screen_retriever_plugin.dll"
  Delete "$INSTDIR\mcmodpackmanager_reborn.exe"
  Delete "$INSTDIR\flutter_windows.dll"
  Delete "$INSTDIR\flutter_platform_alert_plugin.dll"
  Delete "$INSTDIR\dynamic_color_plugin.dll"
  Delete "$INSTDIR\data\icudtl.dat"
  Delete "$INSTDIR\data\flutter_assets\shaders\ink_sparkle.frag"
  Delete "$INSTDIR\data\flutter_assets\packages\window_manager\images\ic_chrome_unmaximize.png"
  Delete "$INSTDIR\data\flutter_assets\packages\window_manager\images\ic_chrome_minimize.png"
  Delete "$INSTDIR\data\flutter_assets\packages\window_manager\images\ic_chrome_maximize.png"
  Delete "$INSTDIR\data\flutter_assets\packages\window_manager\images\ic_chrome_close.png"
  Delete "$INSTDIR\data\flutter_assets\packages\cupertino_icons\assets\CupertinoIcons.ttf"
  Delete "$INSTDIR\data\flutter_assets\NOTICES.Z"
  Delete "$INSTDIR\data\flutter_assets\kernel_blob.bin"
  Delete "$INSTDIR\data\flutter_assets\fonts\MaterialIcons-Regular.otf"
  Delete "$INSTDIR\data\flutter_assets\FontManifest.json"
  Delete "$INSTDIR\data\flutter_assets\assets\icons\logotext.svg"
  Delete "$INSTDIR\data\flutter_assets\assets\icons\logo256.png"
  Delete "$INSTDIR\data\flutter_assets\assets\icons\logo.svg"
  Delete "$INSTDIR\data\flutter_assets\AssetManifest.json"
  Delete "$INSTDIR\data\app.so"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$DESKTOP\Minecraft Modpack Manager Reborn.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Minecraft Modpack Manager Reborn.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\data\flutter_assets\shaders"
  RMDir "$INSTDIR\data\flutter_assets\packages\window_manager\images"
  RMDir "$INSTDIR\data\flutter_assets\packages\cupertino_icons\assets"
  RMDir "$INSTDIR\data\flutter_assets\fonts"
  RMDir "$INSTDIR\data\flutter_assets\assets\icons"
  RMDir "$INSTDIR\data\flutter_assets"
  RMDir "$INSTDIR\data"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd