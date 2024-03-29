; Script generated by the HM NIS Edit Script Wizard.



; HM NIS Edit Wizard helper defines

!define PRODUCT_NAME "SSH TESTE v0.1.2Pre-Alpha"

!define PRODUCT_VERSION "0.1"

!define PRODUCT_PUBLISHER "Marcos Silva"

!define PRODUCT_WEB_SITE "http://aragones.esy.es/SSHTeste/"

!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\pythonw.exe"

!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"

!define PRODUCT_UNINST_ROOT_KEY "HKLM"



; MUI 1.67 compatible ------

!include "MUI.nsh"



; MUI Settings

!define MUI_ABORTWARNING

!define MUI_ICON "icone.ico"

!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"



; Welcome page

!insertmacro MUI_PAGE_WELCOME

; License page

!insertmacro MUI_PAGE_LICENSE "gpl.txt"

; Directory page

!insertmacro MUI_PAGE_DIRECTORY

; Instfiles page

!insertmacro MUI_PAGE_INSTFILES

; Finish page

!insertmacro MUI_PAGE_FINISH



; Uninstaller pages

!insertmacro MUI_UNPAGE_INSTFILES



; Language files

!insertmacro MUI_LANGUAGE "PortugueseBR"



; MUI end ------



Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"

OutFile "SSHTeste-v0.1.2_Not_StandAlone_Setup.exe"

InstallDir "$PROGRAMFILES\SSH Teste"

InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""

ShowInstDetails show

ShowUnInstDetails show



Section "MainSection" SEC01

  SetOutPath "$INSTDIR"

  SetOverwrite ifnewer

  #File "Python35-32\pythonw.exe"

  CreateDirectory "$SMPROGRAMS\SSHTeste"

  CreateShortCut "$SMPROGRAMS\SSHTeste\SSH Teste.lnk" "$INSTDIR\Python35-32\pythonw.exe" "SSHTestev0.1.2-interface.py" "$INSTDIR\icone.ico"

  CreateShortCut "$DESKTOP\SSHTeste.lnk" "$INSTDIR\Python35-32\pythonw.exe" "SSHTestev0.1.2-interface.py" "$INSTDIR\icone.ico"

  SetOverwrite try
  File /r *

SectionEnd



Section -AdditionalIcons

  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"

  CreateShortCut "$SMPROGRAMS\SSHTeste\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"

  CreateShortCut "$SMPROGRAMS\SSHTeste\Uninstall.lnk" "$INSTDIR\uninst.exe"

SectionEnd



Section -Post

  WriteUninstaller "$INSTDIR\uninst.exe"

  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\Python35-32\pythonw.exe"

  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"

  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"

  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\mb.ico"

  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"

  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"

  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"

SectionEnd




Function un.onUninstSuccess

  HideWindow

  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."

FunctionEnd



Function un.onInit

  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2

  Abort

FunctionEnd



Section Uninstall

  Delete "$DESKTOP\SSH Teste.lnk"



  RMDir /r "$SMPROGRAMS\SSHTeste"

  RMDir /r "$INSTDIR"



  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"

  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"

  SetAutoClose true

SectionEnd