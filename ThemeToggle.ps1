$lightTheme="C:\Users\Elija_000\AppData\Local\Microsoft\Windows\Themes\CustomThemeLight.theme"
$darkTheme="C:\Users\Elija_000\AppData\Local\Microsoft\Windows\Themes\CustomThemeDark.theme"
$currentTheme=(Get-ItemProperty -path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\ -Name "CurrentTheme").CurrentTheme
$settingsID=((Get-Process | Where-Object {$_.MainWindowTitle -eq "Settings"}).id)
If	($currentTheme -eq $darkTheme) {
	Invoke-Expression $lightTheme
	If (!(Get-Process | Where-Object {$_.ProcessName -eq "notepad++"}).id) {
		[xml]$xmlDoc = Get-Content "C:\Users\Elija_000\AppData\Roaming\Notepad++\config.xml"
		$con | % { $_.Replace("`"DarkMode`" enable=`"yes`"", "`"DarkMode`" enable=`"no`"") } | Set-Content
	}
	Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Common\Roaming\Identities\b4e7d86ffbab59f7_LiveId\Settings\1186\{00000000-0000-0000-0000-000000000000}' -Name 'Data' -Value ([byte[]](7, 0, 0, 0))
	taskkill /F /im "OfficeClickToRun.exe"
	If (!$settingsID) {
		start-sleep 6
		taskkill /F /im (Get-Process | Where-Object {$_.MainWindowTitle -eq "Settings"}).id
	}
} 
ElseIf ($currentTheme -eq $lightTheme) {
	Invoke-Expression $darkTheme
	If (!(Get-Process | Where-Object {$_.ProcessName -eq "notepad++"}).id) {
		[xml]$xmlDoc = Get-Content "C:\Users\Elija_000\AppData\Roaming\Notepad++\config.xml"
		$con | % { $_.Replace("`"DarkMode`" enable=`"yes`"", "`"DarkMode`" enable=`"no`"") } | Set-Content
	}
	Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Common\Roaming\Identities\b4e7d86ffbab59f7_LiveId\Settings\1186\{00000000-0000-0000-0000-000000000000}' -Name 'Data' -Value ([byte[]](4, 0, 0, 0))
	taskkill /F /im "OfficeClickToRun.exe"
	If (!$settingsID) {
		Start-Sleep 6
		taskkill /F /im (Get-Process | Where-Object {$_.MainWindowTitle -eq "Settings"}).id
	}
} 
Else {
	Add-Type -AssemblyName PresentationCore,PresentationFramework
    $Result = [System.Windows.MessageBox]::Show("Current theme not recognized. Open theme settings?","Theme Toggle",4,32)
	If ($Result -eq 6) {
		Start ms-settings:themes
	}
}