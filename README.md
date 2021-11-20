# Toggle-Darkmode-Windows-Office
A simple powershell script (and shortcut) to add a Toolbar button to toggle Dark Mode on Windows and Office apps


## To install
1. In **Windows Settings > Personalization > Themes**, save your desired light theme layout as "CustomThemeLight" and dark layout as "CustomThemeDark".
2. Download this repo and unpack the zip to a new folder in whatever destination you prefer.
3. Inside of the newly unpacked folder, create a folder named "Dark Mode".
4. Inside "Dark Mode", create a new shortcut.
5. For its Target, type: `powershell -ExecutionPolicy Bypass -windowstyle hidden -File` followed by the full path to ThemeToggle.ps1.
6. Set the shortcut to open Minimized, point the shortcut icon to "icon_50.ico", and save it.
7. Right-click the taskbar, click **Toolbars > New toolbar...** then navigate to Dark Mode and hit **Select**.
8. Right-click the newly created "Dark Mode" toolbar, uncheck **Show Text** and **Show Title**, then click **View > Large Icons**.
9. Right-click on the parent folder where you originally unpacked everything, click **Properties**, and check **Hidden** (do _not_ apply this to child folders).

Voila. You should now have a button on your taskbar that, with a click, toggles Dark mode for the Windows theme, Office apps theme, and (bonus!) Notepad++ theme.
