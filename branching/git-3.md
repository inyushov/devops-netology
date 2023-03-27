login as: inyushov
inyushov@192.168.1.8's password:
Linux debian1 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2 (2022-10-21) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sun Mar 26 18:18:06 2023 from 192.168.1.7
inyushov@debian1:~$ sudo -i
[sudo] пароль для inyushov:
root@debian1:~# cd /devops-netology
root@debian1:/devops-netology# ls
Basics_of_system_administration_inyushov.md  README.md
has_been_moved.txt                           terraform
root@debian1:/devops-netology# mkdir branching
root@debian1:/devops-netology# cd branching
root@debian1:/devops-netology/branching# git status
На ветке main
Ваша ветка обновлена в соответствии с «origin/main».

нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching# mcedit merge.sh

root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git add *
root@debian1:/devops-netology/branching# git status
На ветке main
Ваша ветка обновлена в соответствии с «origin/main».

Изменения, которые будут включены в коммит:
  (use "git restore --staged <file>..." to unstage)
        новый файл:    merge.sh
        новый файл:    rebase.sh

root@debian1:/devops-netology/branching# git commit -a -m "prepare for merge and rebase"
[main 03e604b] prepare for merge and rebase
 2 files changed, 16 insertions(+)
 create mode 100644 branching/merge.sh
 create mode 100644 branching/rebase.sh
root@debian1:/devops-netology/branching# git status
На ветке main
Ваша ветка опережает «origin/main» на 1 коммит.
  (используйте «git push», чтобы опубликовать ваши локальные коммиты)

нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching# git push https://github.com/inyushov/devops-netology.git main
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Перечисление объектов: 5, готово.
Подсчет объектов: 100% (5/5), готово.
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (4/4), 454 bytes | 227.00 KiB/s, готово.
Total 4 (delta 1), reused 2 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/inyushov/devops-netology.git
   3171d8e..03e604b  main -> main
root@debian1:/devops-netology/branching# git switch -c git-merge
Переключено на новую ветку «git-merge»
root@debian1:/devops-netology/branching# mcedit merge.sh

root@debian1:/devops-netology/branching# git status
На ветке git-merge
Изменения, которые не в индексе для коммита:
  (используйте «git add <файл>…», чтобы добавить файл в индекс)
  (use "git restore <file>..." to discard changes in working directory)
        изменено:      merge.sh

нет изменений добавленных для коммита
(используйте «git add» и/или «git commit -a»)
root@debian1:/devops-netology/branching# git add merge.sh
root@debian1:/devops-netology/branching# git status
На ветке git-merge
Изменения, которые будут включены в коммит:
  (use "git restore --staged <file>..." to unstage)
        изменено:      merge.sh

root@debian1:/devops-netology/branching# git commit -a -m "merge: @ instead *"
[git-merge d706cf4] merge: @ instead *
 1 file changed, 2 insertions(+), 2 deletions(-)
root@debian1:/devops-netology/branching# git push https://github.com/inyushov/devops-netology.git main
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Everything up-to-date
root@debian1:/devops-netology/branching# git push https://github.com/inyushov/devops-netology.git
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (4/4), 383 bytes | 383.00 KiB/s, готово.
Total 4 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
remote:
remote: Create a pull request for 'git-merge' on GitHub by visiting:
remote:      https://github.com/inyushov/devops-netology/pull/new/git-merge
remote:
To https://github.com/inyushov/devops-netology.git
 * [new branch]      git-merge -> git-merge
root@debian1:/devops-netology/branching# git status
На ветке git-merge
нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching#
root@debian1:/devops-netology/branching# mcedit merge.sh

root@debian1:/devops-netology/branching# git commit -a -m "merge: use shift"
[git-merge 1c11424] merge: use shift
 1 file changed, 3 insertions(+), 2 deletions(-)
root@debian1:/devops-netology/branching# git status
На ветке git-merge
нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching# git add merge.sh
root@debian1:/devops-netology/branching# git status
На ветке git-merge
нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching# git push https://github.com/inyushov/devops-netology.git
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (4/4), 455 bytes | 227.00 KiB/s, готово.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/inyushov/devops-netology.git
   d706cf4..1c11424  git-merge -> git-merge
root@debian1:/devops-netology/branching# git checkout main
Переключено на ветку «main»
Ваша ветка опережает «origin/main» на 1 коммит.
  (используйте «git push», чтобы опубликовать ваши локальные коммиты)
root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git status
На ветке main
Ваша ветка опережает «origin/main» на 1 коммит.
  (используйте «git push», чтобы опубликовать ваши локальные коммиты)

Изменения, которые не в индексе для коммита:
  (используйте «git add <файл>…», чтобы добавить файл в индекс)
  (use "git restore <file>..." to discard changes in working directory)
        изменено:      rebase.sh

нет изменений добавленных для коммита
(используйте «git add» и/или «git commit -a»)
root@debian1:/devops-netology/branching# git add rebase.sh
root@debian1:/devops-netology/branching# git status
На ветке main
Ваша ветка опережает «origin/main» на 1 коммит.
  (используйте «git push», чтобы опубликовать ваши локальные коммиты)

Изменения, которые будут включены в коммит:
  (use "git restore --staged <file>..." to unstage)
        изменено:      rebase.sh

root@debian1:/devops-netology/branching# git push https://github.com/inyushov/devops-netology.git
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Everything up-to-date
root@debian1:/devops-netology/branching# git commit -a -m "Изм main"
[main 659a61a] Изм main
 1 file changed, 5 insertions(+), 3 deletions(-)
root@debian1:/devops-netology/branching# git push https://github.com/inyushov/devops-netology.git
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
Сжатие объектов: 100% (2/2), готово.
Запись объектов: 100% (4/4), 395 bytes | 395.00 KiB/s, готово.
Total 4 (delta 2), reused 3 (delta 2), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/inyushov/devops-netology.git
   03e604b..659a61a  main -> main
root@debian1:/devops-netology/branching# git log
commit 659a61a2a63c0b37f31cc142d326e76426a61544 (HEAD -> main)
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 27 21:24:38 2023 +0300

    Изм main

commit 03e604b12d53e4e82cf3220f1348dade953132bd
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 27 21:05:09 2023 +0300

    prepare for merge and rebase

commit 3171d8ed41871c4383e2ba52683700c4b31c9482 (origin/main, origin/HEAD)
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Sun Mar 19 23:02:37 2023 +0300

    Update and rename inyushov_vagrant.md to Basics_of_system_administration_inyushov.md

commit d1e03514c58c36d3495acce932d14a1872167247
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Sun Mar 19 22:05:30 2023 +0300

:...skipping...
commit 659a61a2a63c0b37f31cc142d326e76426a61544 (HEAD -> main)
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 27 21:24:38 2023 +0300

    Изм main

commit 03e604b12d53e4e82cf3220f1348dade953132bd
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 27 21:05:09 2023 +0300

    prepare for merge and rebase

commit 3171d8ed41871c4383e2ba52683700c4b31c9482 (origin/main, origin/HEAD)
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Sun Mar 19 23:02:37 2023 +0300

    Update and rename inyushov_vagrant.md to Basics_of_system_administration_inyushov.md

commit d1e03514c58c36d3495acce932d14a1872167247
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Sun Mar 19 22:05:30 2023 +0300

    Create inyushov_vagrant.md

commit 99eabc67a8455195e3695491248e994110317765 (tag: v0.1, tag: v0.0)
Author: inyushov <inyushov777@yandex.ru>
Date:   Wed Mar 15 22:15:58 2023 +0300

    Update

commit 02b65139a1bf6f6a82e28fed5e9382daeb4b8646
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Tue Mar 14 00:04:04 2023 +0300

    Update README.md

commit df08d90afc4e9a20e2b8da5b79dde15d82382d25
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 13 22:24:31 2023 +0300

    First commit

commit db49cd5ae16d16358ce44820744b38038e3cc3b3
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 13 21:02:41 2023 +0300

    Moved and deleted

commit b67648f501eaa70f5854c353d9562f50b290854a
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 13 20:54:15 2023 +0300

    Prepare to delete and move

commit 0ebf17469c260bd9b35306d6577da0f416141a4b
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 13 20:46:13 2023 +0300

    Added gitignore

commit 26adb37c5d26dbe5fe5c9ec40d33e18df0928de0
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 13 20:29:38 2023 +0300

    First commit

commit e36f0f98b90d28de32bdab012f8574d5031fe7d0
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Mon Mar 13 20:09:34 2023 +0300

    Initial commit

root@debian1:/devops-netology/branching# git checkout 03e604b12d53e4e82cf3220f1348dade953132bd
Note: switching to '03e604b12d53e4e82cf3220f1348dade953132bd'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD сейчас на 03e604b prepare for merge and rebase
root@debian1:/devops-netology/branching# git log
commit 03e604b12d53e4e82cf3220f1348dade953132bd (HEAD)
Author: inyushov <inyushov777@yandex.ru>
Date:   Mon Mar 27 21:05:09 2023 +0300

    prepare for merge and rebase

commit 3171d8ed41871c4383e2ba52683700c4b31c9482 (origin/main, origin/HEAD)
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Sun Mar 19 23:02:37 2023 +0300

    Update and rename inyushov_vagrant.md to Basics_of_system_administration_inyushov.md

commit d1e03514c58c36d3495acce932d14a1872167247
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Sun Mar 19 22:05:30 2023 +0300

    Create inyushov_vagrant.md

commit 99eabc67a8455195e3695491248e994110317765 (tag: v0.1, tag: v0.0)
Author: inyushov <inyushov777@yandex.ru>
Date:   Wed Mar 15 22:15:58 2023 +0300

    Update

commit 02b65139a1bf6f6a82e28fed5e9382daeb4b8646
Author: Andrey <127683348+inyushov@users.noreply.github.com>
Date:   Tue Mar 14 00:04:04 2023 +0300

    Update README.md

root@debian1:/devops-netology/branching# git switch -c git-rebase
Переключено на новую ветку «git-rebase»
root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git commit -a -m "git-rebase 1"
[git-rebase 87af3dc] git-rebase 1
 1 file changed, 5 insertions(+), 3 deletions(-)
root@debian1:/devops-netology/branching# git status
На ветке git-rebase
нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git commit -a -m "git-rebase 2"
[git-rebase fc75a4b] git-rebase 2
 1 file changed, 1 insertion(+), 1 deletion(-)
root@debian1:/devops-netology/branching# git push origin git-rebase
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Перечисление объектов: 11, готово.
Подсчет объектов: 100% (11/11), готово.
Сжатие объектов: 100% (8/8), готово.
Запись объектов: 100% (8/8), 765 bytes | 255.00 KiB/s, готово.
Total 8 (delta 3), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (3/3), completed with 1 local object.
remote:
remote: Create a pull request for 'git-rebase' on GitHub by visiting:
remote:      https://github.com/inyushov/devops-netology/pull/new/git-rebase
remote:
To https://github.com/inyushov/devops-netology.git
 * [new branch]      git-rebase -> git-rebase
root@debian1:/devops-netology/branching# git merge git-merge
Merge made by the 'recursive' strategy.
 branching/merge.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
root@debian1:/devops-netology/branching# git status
На ветке git-rebase
нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching# git checkout main
Переключено на ветку «main»
Ваша ветка опережает «origin/main» на 2 коммита.
  (используйте «git push», чтобы опубликовать ваши локальные коммиты)
root@debian1:/devops-netology/branching# git push
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Everything up-to-date
root@debian1:/devops-netology/branching# git merge git-merge
Merge made by the 'recursive' strategy.
 branching/merge.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
root@debian1:/devops-netology/branching# git push origin
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
Сжатие объектов: 100% (3/3), готово.
Запись объектов: 100% (3/3), 361 bytes | 361.00 KiB/s, готово.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/inyushov/devops-netology.git
   659a61a..6da4e38  main -> main
root@debian1:/devops-netology/branching# git checkout git-rebase
Переключено на ветку «git-rebase»
root@debian1:/devops-netology/branching# git rebase -i main
error: could not parse 'pick'
error: неправильная строка 2: fixup pick fc75a4b git-rebase 2
Вы можете исправить это с помощью «git rebase --edit-todo», а потом запустив «git rebase --continue».
Или вы можете прервать процесс перемещения, выполнив «git rebase --abort»
root@debian1:/devops-netology/branching# git status
интерактивное перемещение в процессе; над 6da4e38
Команды не выполнены.
Следующая команда для выполнения (2 команды осталось):
   pick 87af3dc git-rebase 1
   fixup pick fc75a4b git-rebase 2
  (используйте «git rebase --edit-todo», чтобы просмотреть и изменить)
Вы сейчас редактируете коммит при перемещении ветки  «git-rebase» над «6da4e38».
  (используйте «git commit --amend», чтобы исправить текущий коммит)
  (используйте «git rebase --continue», когда будете довольны изменениями)

нечего коммитить, нет изменений в рабочем каталоге
root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git rebase -i main
fatal: It seems that there is already a rebase-merge directory, and
I wonder if you are in the middle of another rebase.  If that is the
case, please try
        git rebase (--continue | --abort | --skip)
If that is not the case, please
        rm -fr ".git/rebase-merge"
and run me again.  I am stopping in case you still have something
valuable there.

root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# mcedit rebase --edit-todo
Сбой запуска:
Неизвестный параметр --edit-todo

Использование:
  mcedit [ПАРАМЕТР…] [+номер_строки] файл1[:номер_строки] [файл1[:номер_строки]...]


GNU Midnight Commander, версия 4.8.26


Параметры справки:
  -h, --help                Показать параметры справки
  --help-all                Показать все параметры справки
  --help-terminal           Настройки терминала
  --help-color              Цветовые настройки

Параметры приложения:
  -V, --version             Показать текущую версию
  -f, --datadir             Распечатать имя каталога для данных
  -F, --datadir-info        Показ расширенной информации об используемых каталогах
  --configure-options       Распечатать параметры конфигурации
  -P, --printwd=<файл>      Записать последний рабочий каталог в указанный файл
  -U, --subshell            Включить поддержку встроенной командной оболочки (по умолчанию)
  -u, --nosubshell          Отключить поддержку встроенной командной оболочки
  -l, --ftplog=<файл>       Записывать диалог с FTP в заданный файл
  -v, --view=<файл>         Просматривать файл
  -e, --edit=<файл> ...     Редактировать файлы


Пожалуйста, посылайте любые сообщения об ошибках (включая вывод "mc -V")
как тикеты на www.midnight-commander.org



root@debian1:/devops-netology/branching# git rebase -i main
fatal: It seems that there is already a rebase-merge directory, and
I wonder if you are in the middle of another rebase.  If that is the
case, please try
        git rebase (--continue | --abort | --skip)
If that is not the case, please
        rm -fr ".git/rebase-merge"
and run me again.  I am stopping in case you still have something
valuable there.

root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git rebase --continue
error: could not parse 'pick'
error: неправильная строка 2: fixup pick fc75a4b git-rebase 2
error: пожалуйста исправьте это с помощью «git rebase --edit-todo».
root@debian1:/devops-netology/branching# git rebase --edit-todo
error: could not parse 'pick'
error: неправильная строка 2: fixup pick fc75a4b git-rebase 2
root@debian1:/devops-netology/branching# git rebase -i main
fatal: It seems that there is already a rebase-merge directory, and
I wonder if you are in the middle of another rebase.  If that is the
case, please try
        git rebase (--continue | --abort | --skip)
If that is not the case, please
        rm -fr ".git/rebase-merge"
and run me again.  I am stopping in case you still have something
valuable there.

root@debian1:/devops-netology/branching# git rebase --continue
Автослияние branching/rebase.sh
КОНФЛИКТ (содержимое): Конфликт слияния в branching/rebase.sh
error: не удалось применить коммит 87af3dc… git-rebase 1
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 87af3dc... git-rebase 1
root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git add rebase.sh
root@debian1:/devops-netology/branching# git rebase --continue
Автослияние branching/rebase.sh
КОНФЛИКТ (содержимое): Конфликт слияния в branching/rebase.sh
error: не удалось применить коммит fc75a4b… git-rebase 2
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply fc75a4b... git-rebase 2
root@debian1:/devops-netology/branching# git rebase --continue
branching/rebase.sh: needs merge
Вы должны отредактировать все
конфликты слияния, а потом пометить
их как разрешенные с помощью git add
root@debian1:/devops-netology/branching# mcedit rebase.sh

root@debian1:/devops-netology/branching# git add rebase.sh
root@debian1:/devops-netology/branching# git rebase --continue
[отделённый HEAD d309206] Merge branch 'git-merge'
 Date: Mon Mar 27 21:44:07 2023 +0300
Successfully rebased and updated refs/heads/git-rebase.
root@debian1:/devops-netology/branching# git push -u origin git-rebase
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
To https://github.com/inyushov/devops-netology.git
 ! [rejected]        git-rebase -> git-rebase (non-fast-forward)
error: не удалось отправить некоторые ссылки в «https://github.com/inyushov/devops-netology.git»
подсказка: Обновления были отклонены, так как верхушка вашей текущей ветки
подсказка: позади ее внешней части. Заберите и слейте внешние изменения
подсказка: (например, с помощью «git pull …») перед повторной попыткой отправки
подсказка: изменений.
подсказка: Для дополнительной информации, смотрите «Note about fast-forwards»
подсказка: в «git push --help».
root@debian1:/devops-netology/branching# git push -u origin git-rebase -f
Username for 'https://github.com': inyushov
Password for 'https://inyushov@github.com':
Перечисление объектов: 10, готово.
Подсчет объектов: 100% (10/10), готово.
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (4/4), 428 bytes | 214.00 KiB/s, готово.
Total 4 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/inyushov/devops-netology.git
 + fc75a4b...d309206 git-rebase -> git-rebase (forced update)
Ветка «git-rebase» отслеживает внешнюю ветку «git-rebase» из «origin».
root@debian1:/devops-netology/branching# git checkout main
Переключено на ветку «main»
Ваша ветка обновлена в соответствии с «origin/main».
root@debian1:/devops-netology/branching# git merge git-rebase
Merge made by the 'recursive' strategy.
 branching/rebase.sh | 1 +
 1 file changed, 1 insertion(+)
root@debian1:/devops-netology/branching#
