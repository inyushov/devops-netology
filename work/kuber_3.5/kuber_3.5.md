#### 1. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

##### 1.1 Установить приложение по команде:

Устанавливаю приложение по указанной команде. Вижу, что в кластере нет указанных в манифесте namespace web и data:

![image](https://github.com/inyushov/devops-netology/assets/127683348/644b801a-ce8f-49a9-a8a9-3b409e1e1b0e)

Создаю namespace web и data  и повторяю установку приложения:

![image](https://github.com/inyushov/devops-netology/assets/127683348/70204669-718b-4b3a-92b8-f3544d0cfd29)

##### 1.2 Выявить проблему и описать.

Проверяю статус deployments и pods:

![image](https://github.com/inyushov/devops-netology/assets/127683348/6a577e1a-7875-4f9b-a33f-447fbc3f5bfe)

Deployments и pods запущены, ошибок нет

Проверяю статус приложений внутри подов. Проверять буду с помощью просмотра логов подов:

![image](https://github.com/inyushov/devops-netology/assets/127683348/02faf3c3-73a8-46cd-a2af-ac68f606a788)

Вижу, что в приложении деплоймента auth-db все в порядке ошибок нет, но с приложением деплоймента web-consumer есть проблема, он не может достучаться до auth-db по имени хоста.

Причина в том, что деплойменты находятся в разных namespace.

##### 1.3 Исправить проблему, описать, что сделано.

Отредактировать манифест деплоймента web-consumer и в строке команды curl auth-db заменить на curl auth-db.data:

![image](https://github.com/inyushov/devops-netology/assets/127683348/27b89963-9890-4645-b82c-8cc248ccde76)


##### 1.4 Продемонстрировать, что проблема решена.

![image](https://github.com/inyushov/devops-netology/assets/127683348/4033b08b-2b80-450f-b416-e7bd9f94cf53)

![image](https://github.com/inyushov/devops-netology/assets/127683348/06a6b647-1b63-4e9e-93e1-53eb73e25e8e)








