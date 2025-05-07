Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("WScript.Shell")

scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)
batFile = scriptPath & "\emacs-x11.bat"
If fso.FileExists(batFile) Then
    WshShell.Run """" & batFile & """", 0
End If

Set fso = Nothing
Set WshShell = Nothing
