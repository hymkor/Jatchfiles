@if (0) == (0) echo off
    cscript //nologo //E:JScript "%~f0" %*
    exit /b 0
@end
var program = "CMD.EXE";
var argv="";
var args = WScript.Arguments;
if( args.length >= 1 ){
    program = args.Item(0);
    if(args.length >= 2 ){
        argv = args.Item(1);
        for(var i=2 ; i < args.length ; i++ ){
            argv = argv + " " + args.Item(i);
        }
    }
}
var shellApp = new ActiveXObject("Shell.Application");
shellApp.ShellExecute(program,argv,"","runas");
// vim:ft=javascript:
