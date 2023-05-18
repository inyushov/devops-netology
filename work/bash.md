# Домашнее задание к занятию «Командная оболочка Bash: Практические навыки»

### Цель задания

В результате выполнения задания вы:

* познакомитесь с командной оболочкой Bash;
* используете синтаксис bash-скриптов;
* узнаете, как написать скрипт в файл так, чтобы он мог выполниться с параметрами и без.


### Чеклист готовности к домашнему заданию

1. У вас настроена виртуальная машина, контейнер или установлена гостевая ОС семейств Linux, Unix, MacOS.
2. Установлен Bash.


### Инструкция к заданию

1. Скопируйте в свой .md-файл содержимое этого файла, исходники можно посмотреть [здесь](https://raw.githubusercontent.com/netology-code/sysadm-homeworks/devsys10/04-script-01-bash/README.md).
2. Заполните недостающие части документа решением задач — заменяйте `???`, остальное в шаблоне не меняйте, чтобы не сломать форматирование текста, подсветку синтаксиса. Вместо логов можно вставить скриншоты по желанию.
3. Для проверки домашнего задания в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем репозитории.
4. Любые вопросы по выполнению заданий задавайте в чате учебной группы или в разделе «Вопросы по заданию» в личном кабинете.

### Дополнительные материалы

1. [Полезные ссылки для модуля «Скриптовые языки и языки разметки».](https://github.com/netology-code/sysadm-homeworks/tree/devsys10/04-script-03-yaml/additional-info)

------

## Задание 1

Есть скрипт:

```bash
a=1
b=2
c=a+b
d=$a+$b
e=$(($a+$b))
```

Какие значения переменным c, d, e будут присвоены? Почему?

| Переменная  | Значение | Обоснование |
| ------------- | ------------- | ------------- |
| `c`  | a+b  | переменной c присваивается значение текста |
| `d`  | 1+2  | переменной d присваивается текстовая запись выражений переменных |
| `e`  | 3  |  $(()) производится арифметических операция между переменными |

----

## Задание 2

На нашем локальном сервере упал сервис, и мы написали скрипт, который постоянно проверяет его доступность, записывая дату проверок до тех пор, пока сервис не станет доступным. После чего скрипт должен завершиться. 

В скрипте допущена ошибка, из-за которой выполнение не может завершиться, при этом место на жёстком диске постоянно уменьшается. Что необходимо сделать, чтобы его исправить:

```bash
while ((1==1)
do
	curl https://localhost:4757
	if (($? != 0))
	then
		date >> curl.log
	fi
done
```

### Ваш скрипт:

```bash
	while ((1==1))              #здесь отсутствовала закрывающаяся круглая скобка, добавил.
	do
	  curl https://localhost:4757
	if (($? != 0))
	then
	  date >> curl.log
	else                        #< здесь отсутствовало условие выхода из цискла, добавил.
	  break                     #<
	fi
	done
```

---

## Задание 3

Необходимо написать скрипт, который проверяет доступность трёх IP: `192.168.0.1`, `173.194.222.113`, `87.250.250.242` по `80` порту и записывает результат в файл `log`. Проверять доступность необходимо пять раз для каждого узла.

### Ваш скрипт:

```bash
#!/usr/bin/env bash
HOSTS=("192.168.0.1" "173.194.222.113" "87.250.250.242")
PORT=80
LOGFILE=/var/log/hostsping.log
touch $LOGFILE
for i in {1..5}
do
  for h in ${HOSTS[@]}
  do
    curl $h:$PORT --connect-timeout 5
    RET=$?
    echo $(date):" "$h" status is "$RET >> $LOGFILE
  done
done
```
![image](https://user-images.githubusercontent.com/127683348/235499663-0436d17a-96ad-4de2-acfe-a7ccb9ad9de4.png)


---
## Задание 4

Необходимо дописать скрипт из предыдущего задания так, чтобы он выполнялся до тех пор, пока один из узлов не окажется недоступным. Если любой из узлов недоступен — IP этого узла пишется в файл error, скрипт прерывается.

### Ваш скрипт:

```bash
#!/usr/bin/env bash
HOSTS=("173.194.222.113" "192.168.0.1" "87.250.250.242") # Поменял последовательность хостов для наглядного примера
LOGFILE=/var/log/error.log
touch $LOGFILE
while ((1==1))
do
  for h in ${HOSTS[@]}
  do
    curl $h:$PORT --connect-timeout 5
    if [ "$?" != 0 ]
    then
      echo $(date):" "$h" no connection" >> $LOGFILE
      exit 0
    fi
  done
done
```
![image](https://user-images.githubusercontent.com/127683348/235501810-37c81ea0-913a-4eec-a52b-df9211a59d4f.png)

---

## Задание со звёздочкой* 

Это самостоятельное задание, его выполнение необязательно.
____

Мы хотим, чтобы у нас были красивые сообщения для коммитов в репозиторий. Для этого нужно написать локальный хук для Git, который будет проверять, что сообщение в коммите содержит код текущего задания в квадратных скобках, и количество символов в сообщении не превышает 30. Пример сообщения: \[04-script-01-bash\] сломал хук.

### Ваш скрипт:

```bash
???
```

----

### Правила приёма домашнего задания

В личном кабинете отправлена ссылка на .md-файл в вашем репозитории.


### Критерии оценки

Зачёт:

* выполнены все задания;
* ответы даны в развёрнутой форме;
* приложены соответствующие скриншоты и файлы проекта;
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку:

* задание выполнено частично или не выполнено вообще;
* в логике выполнения заданий есть противоречия и существенные недостатки.  
 
Обязательными являются задачи без звёздочки. Их выполнение необходимо для получения зачёта и диплома о профессиональной переподготовке.

Задачи со звёздочкой (*) являются дополнительными или задачами повышенной сложности. Они необязательные, но их выполнение поможет лучше разобраться в теме.