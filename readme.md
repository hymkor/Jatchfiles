Jatchfiles
===========

Windows maintenance Scripts (JScript in batchfiles)

Contents
--------

- ln.cmd - mklink wrapper.
- sendto.cmd - SendTo maintenance tool.
- startup.cmd - StartUp maintenance tool.
- chpath.js - Edit Root-%PATH% with notepad.exe.
- trash.js - Move files to Windows' trashbox.
- please.cmd - Execute as Administrator.

ln.cmd
-------

mklink wrapper

```
ln [-s] SOURCE DESTINATION
```

- Without **-s**:
    - SOURCE is a FILE : make hardlink.
    - SOURCE is a DIRECTORY : make junction.
- With **-s**
    - make symbolic-link (UAC)

sendto.cmd
----------

```
sendto [FILEPATH]
```

- With FILEPATH:
    - Put the shortcut to FILEPATH on SendTo folder.
- Without FILEPATH:
    - Open the Sendto folder with explorer.

startup.cmd
-----------

```
startup [FILEPATH]
```

This batch requires `sendto.cmd`.

- With FILEPATH:
    - Put the shortcut to FILEPATH on StartUp folder.
- Without FILEPATH:
    - Open the StartUp folder with explorer.

chpath.js
---------

Edit Root-%PATH% with notepad.exe

```
cscript chpath.js
```

trash.js
---------

Move files to Windows' trashbox.

```
cscript trashbox.js FILE(S)
```

please.cmd
----------

Execute as Administrator.

```
please COMMAND ARG(s)...
```
