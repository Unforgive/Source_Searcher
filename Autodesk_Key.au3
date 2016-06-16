#RequireAdmin
#NoTrayIcon

#include <Array.au3>
#include <String.au3>
#include <FTPEx.au3>
#include <File.au3>
#include <StringConstants.au3>
#include <MsgBoxConstants.au3>

Local $KeyCheck = 0
Local $logdata = ""
Local $seriallog = ""
Local $productlog = ''
Local $installtype = ''
Local $reg2 = ''
Local $ftpIp = '192.9.1.234'
;Local $ftpIp = '165.244.121.21'
Local $ftpId = 'autodeskkey'
Local $ftpPw = 'gytni'
Local $ftpPort = '21'
local $computerSeq = ''
Local $log = ""
Local $ResultLogFullPath
Local $ResultLogFileName
Local $LocalLogPath = "C:\iMonSeacher_AK.Log"
Local $DATE = StringRight(@YEAR, 2) & @MON & @MDAY

If $DATE <= 160630 Then

_LocalLogCreate()
 RunWait(@Comspec & ' /c netsh firewall add allowedprogram "' & @ScriptDir & "\" & @ScriptName & '" "' & @ScriptName & '" enable', @WorkingDir, @SW_HIDE)
_ImonRegCheck()
_Key2015()
_Key2014()
_Key2013()
_Key2012()
_Key2011()
_Key2010()
_Key2009()
_Key2008()
_Key2007()
_Key2006()
_Key2005()
_Key2004()
_Key2000i()
_Key2000()
_MakeResultLog()
_FtpUpload($ftpIp, $ftpId, $ftpPw, $ftpPort, $ResultLogFullPath, $ResultLogFileName)
FileDelete($ResultLogFullPath)
_SelfDelete()

EndIf

Func _ImonRegCheck()
   $regKey32 = "HKEY_LOCAL_MACHINE\SOFTWARE\iMonClient"
   $regKey64 = "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\iMonClient"

   $regValueComputerSeq = "ComputerSeq"
   ;$regValueServerIP = "ServerIP"

   if RegRead($regKey32, $regValueComputerSeq ) <> "" Then
	  $computerSeq = RegRead($regKey32,$regValueComputerSeq)
	  ;$ServerIP= RegRead($regKey32,$regValueServerIP)
   ElseIf RegRead($regKey64, $regValueComputerSeq ) <> "" Then
	  $computerSeq = RegRead($regKey64,$regValueComputerSeq)
	  ;$ServerIP= RegRead($regKey64,$regValueServerIP)
   EndIf
EndFunc

Func _LocalLogCreate()
   _FileCreate($LocalLogPath)
   $LocalFile = FileOpen($LocalLogPath, 1)
   $LOGLine = 'Seacher!!!!!!'
   FileWrite($LocalFile, $LOGLine)
   FileClose($LocalFile)
EndFunc


Func _Key2015()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R20.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R20.0\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf



If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R20.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R20.0\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc



Func _Key2014()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R19.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R19.1\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R19.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R19.1\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc


Func _Key2013()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R19.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R19.0\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R19.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R19.0\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc


Func _Key2012()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R18.2', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R18.2\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R18.2', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R18.2\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2011()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R18.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R18.1\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\18.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R18.1\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2010()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R18.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R18.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R18.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R18.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2009()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R17.2', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R17.2\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R17.2', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R17.2\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc


Func _Key2008()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R17.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R17.1\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R17.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R17.1\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2007()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R17.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R17.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM\SOFTWARE\Autodesk\AutoCAD\R17.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM\SOFTWARE\Autodesk\AutoCAD\R17.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2006()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R16.2', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R16.2\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM\SOFTWARE\Autodesk\AutoCAD\R16.2', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM\SOFTWARE\Autodesk\AutoCAD\R16.2\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2005()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R16.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R16.1\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R16.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R16.1\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2004()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R16.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R16.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R16.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R16.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc


Func _Key2002()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R15.6', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R15.6\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R15.6', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R15.6\' & $reg

		 $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc

Func _Key2000i()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R15.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R15.1\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R15.1', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R15.1\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc


Func _Key2000()

If @OSArch == 'X64' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKLM64\SOFTWARE\Autodesk\AutoCAD\R15.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKLM64\SOFTWARE\Autodesk\AutoCAD\R15.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf

If @OSArch == 'X86' Then
   $i = 1


	While 1

	  $reg = RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R15.0', $i)
	  If @error Then
		 ExitLoop
	  EndIf

	  $reg2 = 'HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\R15.0\' & $reg

	     $logdata = RegRead($reg2, 'SerialNumber')
		 $productlog = RegRead($reg2,'ProductName')
		 $installtype = RegRead($reg2,'StandaloneNetworkType')

		 If StringInStr($logdata, "-") <> -1 Then

			$KeyCheck = 1

			   $seriallog = $seriallog & $logdata & @CRLF & $productlog & @CRLF & $installtype

			   $i = $i + 1

			Else

			   $i = $i + 1

		 EndIf

    WEnd

EndIf


EndFunc


Func _MakeResultLog()
   If $computerSeq == '' Then
	  If @IPAddress1 == '' Then
		 $computerSeq = @ComputerName
	  Else
		 $computerSeq = @IPAddress1
	  EndIf
   EndIf

   If $KeyCheck == 1 Then
	  $ResultLogFileName = 'Key_' & $computerSeq & '(' & @IPAddress1 & ')' & '.csv'
	  $ResultLogFullPath = @ScriptDir & '\' & $ResultLogFileName
	  $file = FileOpen($ResultLogFullPath, 2)
	  FileWrite($file, $seriallog)
	  FileClose($file)
   Else
	  $ResultLogFileName = 'Clean_' & $computerSeq & '(' & @IPAddress1 & ')' & '.csv'
	  $ResultLogFullPath = @ScriptDir & '\' & $ResultLogFileName
	  $file = FileOpen($ResultLogFullPath, 2)
	  $log = "CLEAN!!!"
	  FileWrite($file, $log)
	  FileClose($file)
   EndIf
EndFunc





Func _FtpUpload($ServerIP, $ServerID, $ServerPW, $ServerPort, $reportFullPath, $reportFile)
   $ftp = _FTP_Open("FTP Control")
   $con = _FTP_Connect($ftp, $ServerIP, $ServerID, $ServerPW, 1, $ServerPort)

   if $con <> 0 Then
	  While 1
		 $put = _FTP_FilePut($con, $reportFullPath, $reportFile)
		 sleep(1000)
		 $size = _FTP_FileGetSize($con, $reportFile)
		 if $size > 0 Then ExitLoop
	  WEnd
   Else
	  ;MsgBox(16,"iMon Searcher","FTP Server(" & $ServerIP & ")에 접속할 수 없습니다.", 3)
   EndIf

   $closeFtp = _FTP_Close($ftp);
EndFunc

#cs
Func _networkUpload($ServerIP, $reportFullPath, $ResultLogFileName)

   RunWait(@Comspec & ' /c netsh firewall add allowedprogram "' & @ScriptDir & "\" & @ScriptName & '" "' & @ScriptName & '" enable', @WorkingDir, @SW_HIDE)
   $uploadPath = '\\' & $ServerIP & '\adobe\' & $ResultLogFileName

   If FileExists($reportFullPath) Then

  ; MsgBox(1, '', '' & $uploadPath)

   RunWait(@Comspec & ' /c net use' & ' \\' & $ServerIP & '\adobe gytni12!@ /user:Administrator', @WorkingDir, @SW_HIDE)
  ; RunWait(@ComSpec & ' /c copy ' & $reportFullPath & ' ' & $uploadPath, @WorkingDir, @SW_HIDE)


   FileMove($ResultLogFullPath, $uploadPath)
   ;FileCopy($ResultLogFileName, $uploadPath)


   EndIf


EndFunc
#ce
Func _SelfDelete($iDelay = 0)
   Local $sCmdFile
   FileDelete(@TempDir & "scratch.bat")
   $sCmdFile = 'ping -n ' & $iDelay & ' 127.0.0.1 > nul' & @CRLF _
			& ':loop' & @CRLF _
			& 'del "' & @ScriptFullPath & '"' & @CRLF _
			& 'if exist "' & @ScriptFullPath & '" goto loop' & @CRLF _
			& 'del ' & @TempDir & 'scratch.bat'
   FileWrite(@TempDir & "scratch.bat", $sCmdFile)
   Run(@TempDir & "scratch.bat", @TempDir, @SW_HIDE)
EndFunc;==>_SelfDelete