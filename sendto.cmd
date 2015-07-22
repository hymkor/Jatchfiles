@if (0) == (0) echo off
cscript //nologo /E:JScript "%~f0" Sendto %*
exit /b 0
@end
var objShell = new ActiveXObject("WScript.Shell");
var sendto = objShell.SpecialFolders(WScript.Arguments.Item(0))
if( WScript.Arguments.length <= 1 ){
    var shellApp=new ActiveXObject("Shell.Application");
    shellApp.ShellExecute(sendto,"","","open");
    WScript.Quit(0);
}
var fsObj = new ActiveXObject("Scripting.FileSystemObject");

for(var i=1 ; i < WScript.Arguments.length ; i++ ){
    var itm = WScript.Arguments.Item(i);
    var src = fsObj.GetAbsolutePathName(itm);
    var dst = fsObj.BuildPath(sendto,fsObj.GetFileName(itm) + ".lnk");
    WScript.Echo("    " + src + "\n--> " + dst);
    var shortcut = objShell.CreateShortcut(dst);
    shortcut.TargetPath = src;
    shortcut.Save();
}
// vim:set ft=javascript:
