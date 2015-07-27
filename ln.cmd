@if (0) == (0) echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set "ARGV="
for %%I in (%*) do set ARGV=!ARGV! "%%~I"
cscript //nologo /E:JScript "%~f0" %ARGV%
endlocal
exit /b %ERRORLEVEL%
@end
var args = WScript.Arguments

if( args.length < 2 ){
    WScript.Echo("Usage: ln.cmd [-s] SOURCEFILE(s) TARGET");
    WScript.Quit(1);
}

var fsObj = new ActiveXObject("Scripting.FileSystemObject");
var start = 0;
var symbolic = false;
if( args.Item(0) == "-s" ){
    symbolic = true;
    ++start;
}
var src = [];
for(var i=start ; i < args.length-1 ; i++ ){
    src.push( fsObj.GetAbsolutePathName(args.Item(start+i)) );
}
var dst = fsObj.GetAbsolutePathName(args.Item(args.length-1));

function makeparam(src1,dst1){
    var result="";
    if( fsObj.FolderExists(dst1) ){
        result = '"' + fsObj.BuildPath(dst1,fsObj.GetFileName(src1)) + '" ';
    }else{
        result = '"' + dst1 + '" ';
    }
    result += '"' + src1 + '" ';
    return result;
}

var param="/c ";
if( symbolic ){
    for(var i=0 ; i < src.length ; i++ ){
        if( i > 0 ){
            param += "& ";
        }
        param += (fsObj.FolderExists(src[i]) ? "mklink /D " : "mklink ");
        param += makeparam(src[i],dst);
    }
    var shellApp = new ActiveXObject("Shell.Application");
    shellApp.ShellExecute("cmd.exe",param,"","runas");
}else{
    for(var i=0 ; i < src.length ; i++ ){
        if( i > 0 ){
            param += "& ";
        }
        param += (fsObj.FolderExists(src[i]) ? "mklink /J " : "mklink /H ");
        param += makeparam(src[i],dst);
    }
    var wshell = new ActiveXObject("WScript.Shell");
    var oExec = wshell.Exec("cmd.exe " + param);
    while( oExec.Status == 0 ){
        WScript.Sleep(100);
    }
}
WScript.Echo("cmd.exe " + param);
WScript.Quit(0);
// vim:set ft=JavaScript:
