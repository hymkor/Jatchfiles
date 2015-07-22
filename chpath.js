if( WScript.Arguments.length <= 0 ){
    var shellApp = new ActiveXObject("Shell.Application");
    shellApp.ShellExecute( "wscript.exe","\"" + WScript.ScriptFullName + "\" uac" , "" , "runas");
    shellApp = null;
    WScript.Quit();
}
var wshShell=new ActiveXObject("WScript.Shell");
var objFSO = new ActiveXObject("Scripting.FileSystemObject");
var sysEnv=wshShell.Environment;
var path = sysEnv.Item("PATH");
var TempName = objFSO.GetTempName();

var objWriter = objFSO.CreateTextFile(TempName,true,false);
objWriter.Write( path.replace(/;/g,"\r\n").replace("[\r\n]+$","") );
objWriter.Close();
var objWriter = null;

var objExec = wshShell.Exec("notepad " + TempName);
while(objExec.Status == 0 ){
    WScript.Sleep(100);
}
var output = objExec.StdOut.ReadAll();
if( output != "" ){
    WScript.Echo( output );
}
output = objExec.Stderr.ReadAll();
if( output != ""  ){
    WScript.Echo( output );
}

var objReader = objFSO.OpenTextFile(TempName,1);
path = objReader.ReadAll();
path = path.replace(/\r*\n/g,";");
path = path.replace(/;;+/g,";");
path = path.replace(/;+$/g,"");
objReader.Close();
objReader = null;

objFSO.DeleteFile(TempName);
sysEnv.Item("PATH") = path;
objFSO = null;
