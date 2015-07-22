var shellApp = new ActiveXObject("Shell.Application");
var trashBox = shellApp.NameSpace(10);
var fsObj = new ActiveXObject("Scripting.FileSystemObject");
for(var i=0 ; i <WScript.Arguments.length ; i++ ){
    var arg1 = WScript.Arguments(i);
    var path1 = fsObj.GetAbsolutePathName(arg1);
    trashBox.MoveHere(path1);
}
