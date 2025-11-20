  au BufNewFile,BufRead IoTOSconfig setf kconfig
  au BufNewFile,BufRead APPconfig setf kconfig
  au BufRead,BufNewFile SConstruct set filetype=python
  au BufRead,BufNewFile SConscript set filetype=python
