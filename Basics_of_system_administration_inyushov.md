Работа в терминале (лекция 1)

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

Работа в терминале (лекция 2)

1. type -t cd
builtin Встроенная в оболочку, команда или функция, выполняемая непосредственно в самой оболочке
Если к примеру сделать ее внешней, то она не будет менять каталог в текущей оболочке

2. grep <some_string> <some_file> -c

3. systemd(1)

4. Переходим в /dev/pts/0
cd qqq 2>/dev/pts/1
Тогда в /dev/pts/1 будет
-bash: cd: qqq: No such file or directory

```
5. Да получиться. ls -la | grep .. > abc.txt

если без PIPE, то cat <ab.txt >abc.txt
```

6. Вывести можем через перенаправление в нужный эмулятор tty.

![image](https://user-images.githubusercontent.com/127683348/229319750-9b99aba4-042a-41e8-a834-5ae6b213f446.png)


7. bash 5>&1 создаст дескриптор c FD 5 и перенатправит его в stdout, а echo netology > /proc/$$/fd/5 выведет netology в дескриптор "5", который был пернеаправлен в stdout, после чего на экране увидим netology

8. Да получиться, это можно сделать поменяв стандартные потоки местами через промежуточный новый дескриптор
  ls % 5>&2 2>&1 1>&5 |grep -c 'cannot access'

9. Выведет переменные окружения, либо с помощью env.

10./proc/<PID>/cmdline - отображает полную командную строку запуска процесса, если он полностью не ушел в своп, либо не превратился в зомби, в этом случае отобразит 0 символов

/proc/<PID>/exe - Под Linux 2.2 и 2.4 exe является символьной ссылкой содержащей полное имя выполняемого файла.

11. sse4_2
  
12. Происходит так потому что при входе в shell удаленный хост предполагает, что соединение выполняется пользователем. Изменить поведение можно добавить флаг -t и тогда принудительно создается псевдотерминал.

13. Воспользовался данной ссылкой: https://github.com/nelhage/reptyr#readme  Выполнял sudo reptyr -T
  
14. Команда tee читает из input и записывает в output и в файл, а работает потому что команда запущена от sudo
  
Операционные системы (лекция 1)
  
1. chdir("/tmp") 
  
2. openat(AT_FDCWD, "/usr/share/misc/magic.mgc", O_RDONLY) = 3
  
3. lsof | grep ищем название текстового файла
получаем данные приложения
обнуляем открытый удаленный файл командой echo '' >/proc/4.../../.
  
4. Зомби-процессы освобождает ресурсы, но запись в таблице процессов остается
  
5. sudo /usr/sbin/opensnoop-bpfcc
PID    COMM               FD ERR PATH
976    VBoxService         6   0 /proc/meminfo
976    VBoxService         6   0 /proc/stat
976    VBoxService         6   0 /proc/meminfo
976    VBoxService         6   0 /proc/stat
976    VBoxService         6   0 /proc/meminfo
976    VBoxService         6   0 /proc/stat
976    VBoxService         6   0 /var/run/utmp
664    dbus-daemon        -1   2 /usr/local/share/dbus-1/system-services
664    dbus-daemon        20   0 /usr/share/dbus-1/system-services
664    dbus-daemon        -1   2 /lib/dbus-1/system-services
664    dbus-daemon        20   0 /var/lib/snapd/dbus-1/system-services/
976    VBoxService         6   0 /proc/meminfo
976    VBoxService         6   0 /proc/stat
976    VBoxService         6   0 /proc/meminfo
976    VBoxService         6   0 /proc/stat
976    VBoxService         6   0 /proc/meminfo
976    VBoxService         6   0 /proc/stat
669    irqbalance          6   0 /proc/interrupts
669    irqbalance          6   0 /proc/stat

6. uname()
Part of the utsname information is also accessible  via  /proc/sys/kernel/{ostype, hostname, osrelease, version, domainname}
  
7. ;  - позволяет запускать несколько команд за один раз, и выполнение команды происходит последовательно.
&& -  Оператор AND (&&) будет выполнять вторую команду только в том случае, если при выполнении первой команды SUCCEEDS, т.е. состояние выхода первой команды равно “0” — программа выполнена успешно. Эта команда очень полезна при проверке состояния выполнения последней команды.

Использовать set -e - не имеет смысла, т.к. при ошибке выполнение команд прекратиться.
  
8. -e - прекращает выполнение скрипта если команда завершилась ошибкой, выводит в stderr строку с ошибкой
-u - прекращает выполнение скрипта, если встретилась несуществующая переменная
-x - выводит выполняемые команды в stdout перед выполненинем
-o pipefail - прекращает выполнение скрипта, даже если одна из частей пайпа завершилась ошибкой

При таком запуске скрипт получается безопасным, происходит автоматическая обработка ошибок.
 
9. Ss - процесс, ожидающий завершения, лидер сессии, R+ - процесс выполняется, фоновый процесс
