#### Задание 1

1. Склонировал код из демонстрации и изучал его.
2. Взял файл main.tf из демонстрации и отредактировал его:

изменил количество VM

![image](https://github.com/inyushov/devops-netology/assets/127683348/d9bfe4ee-f72a-4532-8128-836b2d346b0b)

добавил строчку

![image](https://github.com/inyushov/devops-netology/assets/127683348/64282344-4e70-4b2b-b499-79d12fbaf177)

Решил использовать такую конструкцию, так как в задании указано условие, что переменная authorized-keys должна принимать в себя список, а не строку.

Переменная ssh-authorized-keys в файле variables.tf выглядит следующим образом:

![image](https://github.com/inyushov/devops-netology/assets/127683348/93901810-cd77-4c05-9bfb-9df92d4989fa)

3. Добавил в файл cloud-init.yml установку nginx и vim:

![image](https://github.com/inyushov/devops-netology/assets/127683348/b961c552-2cfb-497c-902a-accb3d492bf8)

4. Скриншот подключения к консоли и вывод команды sudo nginx -t

![image](https://github.com/inyushov/devops-netology/assets/127683348/60e79f4b-92a3-4cab-8dd1-0f6a8af4d769)

![image](https://github.com/inyushov/devops-netology/assets/127683348/1a7dba28-c076-4ffe-89db-77235f8a19bf)

#### Задание 2

1. Написал локальный модуль с одной сетью и одной подсетью в зоне ru-central1-a

![image](https://github.com/inyushov/devops-netology/assets/127683348/066dcc29-f28b-4410-96ec-88952f2e2fa1)


2. В модуле использовал переменные с именем сети, зоны и cidr блок

![image](https://github.com/inyushov/devops-netology/assets/127683348/54bfad5d-d00b-43cd-b1fd-d7edc77132f6)

3. В terraform console проверил, какой output будет показан при вызове модуля module.vpc_dev

![image](https://github.com/inyushov/devops-netology/assets/127683348/bf4503e4-4011-4f88-8425-a6cb3ff4ec56)

4. Заменил сетевые ресурсы созданным модулем

![image](https://github.com/inyushov/devops-netology/assets/127683348/95840d19-e7d6-446e-a5f4-58012c065d96)

![image](https://github.com/inyushov/devops-netology/assets/127683348/8867f69a-e055-45c4-9c77-dbadb0ef08ca)

5. Вывод module.vpc_dev не изменился

![image](https://github.com/inyushov/devops-netology/assets/127683348/6a52e9b8-6bb2-499e-ad91-426b1d72838e)

6. С помощью terraform-docs сгенерировал файл документации. 

![image](https://github.com/inyushov/devops-netology/assets/127683348/e61aebbc-6da9-4ea4-ab46-ba81b5b7843d)



