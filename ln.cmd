@if (0) == (0) echo off
cscript //nologo /E:JScript "%~f0" %*
exit /b %ERRORLEVEL%
@end
var args = WScript.Arguments

if( args.length < 2 ){
    WScript.Echo("Usage: cscript ln.js [-s] FILENAME TARGET");
    WScript.Quit(1);
}

var fsObj = new ActiveXObject("Scripting.FileSystemObject");
var start = 0;
var symbolic = false;
if( args.Item(0) == "-s" ){
    symbolic = true;
    ++start;
}
var src = fsObj.GetAbsolutePathName(args.Item(start+0));
var dst = fsObj.GetAbsolutePathName(args.Item(start+1));

if( fsObj.FolderExists(dst) ){
    dst = fsObj.BuildPath(dst,fsObj.GetFileName(src));
}
var opt=""
var action="open"
if( symbolic ){
    if( fsObj.FolderExists(src) ){
        opt = "/D";
    }
    action = "runas"
}else{
    opt = (fsObj.FolderExists(src) ? "/J" : "/H");
}
var param="/c mklink "+opt+' "'+dst+'" "'+src+'"';
if( symbolic ){
    var shellApp = new ActiveXObject("Shell.Application");
    shellApp.ShellExecute("cmd.exe",param,"",action);
}else{
    var wshell = new ActiveXObject("WScript.Shell");
    var oExec = wshell.Exec("cmd.exe " + param);
    while( oExec.Status == 0 ){
        WScript.Sleep(100);
    }
}
WScript.Echo("cmd.exe " + param);
WScript.Echo("    " + src + "\n--> " + dst);
WScript.Quit(0);
// vim:set ft=JavaScript:
