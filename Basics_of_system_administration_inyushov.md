5. HISTSIZE Строчка 862, ignoreboth — не записывать команду, которая начинается с пробела, либо команду, которая дублирует предыдущую.

6. { list; }
              list is simply executed in the current shell environment.  list must be terminated with  a  newline  or
              semicolon.  This is known as a group command.  The return status is the exit status of list.  Note that
              unlike the metacharacters ( and ), { and } are reserved words and must occur where a reserved  word  is
              permitted  to be recognized.  Since they do not cause a word break, they must be separated from list by
              whitespace or another shell metacharacter.
 Строка 257
 
7. Команда touch {000001..100000}.txt, аналогичным образом создать 300000 файлов не получилось -bash: /usr/bin/rm: Argument list too long

8. Делает проверку наличия директории /tmp

9. mkdir /tmp/new_path_directory/ , cp /bin/bash /tmp/new_path_directory/ , PATH=/tmp/new_path_directory/:$PATH

10. at - выполняет команды в указанное время, batch - выполняет команду, когда позволяют уровни загрузки системы; другими словами, когда средняя нагрузка падает ниже 1,5  или значения, указанного при вызове atd
