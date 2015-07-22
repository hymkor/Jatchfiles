JBatchfiles
===========

Tools written with JScript in Batchfiles for Windows7 or later.

Contents
--------

- ln.cmd - mklink wrapper.
- sendto.cmd - SendTo maintenance tool.
- startup.cmd - StartUp maintenance tool.

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
