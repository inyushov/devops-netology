#### Задание 1

1-3 

для ДЗ к лекции 4 https://github.com/netology-code/ter-homeworks/tree/main/04/src

![image](https://github.com/inyushov/devops-netology/assets/127683348/e7695213-8e61-43f2-ae4f-59a8c97275f2)

при запуске checkov (не пойму где ошибка)

![image](https://github.com/inyushov/devops-netology/assets/127683348/752c1b80-6ad2-43d1-9819-88f172cd75d3)


для демо к лекции 4 https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1

![image](https://github.com/inyushov/devops-netology/assets/127683348/25605227-55d2-4179-bcd0-e6461443db3b)

при запуске checkov все так же..

![image](https://github.com/inyushov/devops-netology/assets/127683348/14b80891-10df-4491-8447-0e88f38f2d1b)


Не был инициализирован проект, по этому и нет установленного Terraform провайдера, есть объявленные, но неиспользуемые переменные.

#### Задание 2

1. Создал копию репозитория прошлого ДЗ
   
2. Повторяю демонстрацию лекции

Создал бакет

![image](https://github.com/inyushov/devops-netology/assets/127683348/45494aea-52a5-4cfa-9039-e3ca1606d958)

Создал таблицу блокировок

![image](https://github.com/inyushov/devops-netology/assets/127683348/7158fe25-bd5b-4164-9dc1-67222b9e4c52)

![image](https://github.com/inyushov/devops-netology/assets/127683348/459bbe38-d3b0-4647-9f47-0e8b12ef1c33)

Создал сервисный аккаунт

![image](https://github.com/inyushov/devops-netology/assets/127683348/9f241505-a5d7-44fa-93eb-3076c7316b5d)

Назначаю роль ydb.editor

![image](https://github.com/inyushov/devops-netology/assets/127683348/dd9057b8-b0b6-4b86-bdad-eec51a2e1c78)

Назначаю акканту права на бакет

![image](https://github.com/inyushov/devops-netology/assets/127683348/34225a88-5228-41e6-b061-cea7f94a9e4a)

Делаю миграцию state проекта в S3

![image](https://github.com/inyushov/devops-netology/assets/127683348/69bcc7b6-f012-4394-b9af-501430fec679)

но стейт в бакете не сохраняется. (пока не пойму что делаю не так, вроде бы все делаю по демонстрации лекции!)

![image](https://github.com/inyushov/devops-netology/assets/127683348/42147ba3-966c-4e6c-b6b4-65f4cc340939)

4-6 Запускаю terraform concole и параллельно в другом окне пытаюсь выполнить terraform apply, после чего получаю блокировку стейта

![image](https://github.com/inyushov/devops-netology/assets/127683348/a38292fb-71ce-450b-976d-f7f3a9e41564)

при снятии блокировки получаю ошибку Local state cannot be unlocked by another process

![image](https://github.com/inyushov/devops-netology/assets/127683348/edfb4c30-32df-4e3f-ad15-94d4290db416)

#### Задание 4

Написал переменные с валидацией

![image](https://github.com/inyushov/devops-netology/assets/127683348/765d1c7a-f185-4529-a47e-df1efce9c06c)

Если в адресах без ошибок, то terraform console выведет пустой результат

Если в адресах с ошибками, то terraform console выведет результат валидации

![image](https://github.com/inyushov/devops-netology/assets/127683348/a7629fe5-9eba-459a-8cc5-d7c636ae9f31)








