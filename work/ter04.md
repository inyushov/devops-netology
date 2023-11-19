#### Получившийся код по домашнему заданию https://github.com/inyushov/devops-netology/tree/main/work/04/src

#### Задание 1

1. Склонировал код из демонстрации и изучил его
2. Взял файл main.tf из демонстрации и отредактировал его:

изменил количество VM

![image](https://github.com/inyushov/devops-netology/assets/127683348/d9bfe4ee-f72a-4532-8128-836b2d346b0b)

добавил строчку

![image](https://github.com/inyushov/devops-netology/assets/127683348/64282344-4e70-4b2b-b499-79d12fbaf177)

Решил использовать данную конструкцию, так как в задании указано условие, что переменная authorized-keys должна принимать в себя список, а не строку

Переменная ssh-authorized-keys в файле variables.tf выглядит следующим образом:

![image](https://github.com/inyushov/devops-netology/assets/127683348/93901810-cd77-4c05-9bfb-9df92d4989fa)

3. Добавил в файл cloud-init.yml установку nginx и vim:

![image](https://github.com/inyushov/devops-netology/assets/127683348/b961c552-2cfb-497c-902a-accb3d492bf8)

4. Скриншот подключения к консоли и вывод команды sudo nginx -t

![image](https://github.com/inyushov/devops-netology/assets/127683348/39fe1457-c7e4-4e23-98a0-fdd9f3651b26)

![image](https://github.com/inyushov/devops-netology/assets/127683348/60e79f4b-92a3-4cab-8dd1-0f6a8af4d769)



#### Задание 2

1. Написал локальный модуль с одной сетью и одной подсетью в зоне ru-central1-a

![image](https://github.com/inyushov/devops-netology/assets/127683348/066dcc29-f28b-4410-96ec-88952f2e2fa1)


2. В модуле использовал переменные с именем сети, зоны и cidr блок

![image](https://github.com/inyushov/devops-netology/assets/127683348/54bfad5d-d00b-43cd-b1fd-d7edc77132f6)

3. В terraform console проверил, какой output будет показан при вызове модуля module.vpc_dev

![image](https://github.com/inyushov/devops-netology/assets/127683348/bf4503e4-4011-4f88-8425-a6cb3ff4ec56)

4. Заменил сетевые ресурсы созданным модулем

![image](https://github.com/inyushov/devops-netology/assets/127683348/95840d19-e7d6-446e-a5f4-58012c065d96)

5. Вывод module.vpc_dev не изменился

![image](https://github.com/inyushov/devops-netology/assets/127683348/6a52e9b8-6bb2-499e-ad91-426b1d72838e)

6. С помощью terraform-docs сгенерировал файл документации. https://github.com/inyushov/devops-netology/blob/main/work/04/src/docs.md

![image](https://github.com/inyushov/devops-netology/assets/127683348/e61aebbc-6da9-4ea4-ab46-ba81b5b7843d)

#### Задание 3

1. Текущий список ресурсов в стейте

![image](https://github.com/inyushov/devops-netology/assets/127683348/3227a822-6d05-4175-9b79-87f7f895b6e3)

2. Полностью удалил из стейта модуль vpc_dev

![image](https://github.com/inyushov/devops-netology/assets/127683348/4431e7e4-61be-42d2-80ae-91d705d49f30)

3. Полностью удалил из стейта модуль test-vm

![image](https://github.com/inyushov/devops-netology/assets/127683348/3841ddc1-6395-43ac-bb9d-f0223361000b)

4. Импортирую всё обратно

![image](https://github.com/inyushov/devops-netology/assets/127683348/ebe28ceb-cdf4-457f-8496-ff7eb2187253)

![image](https://github.com/inyushov/devops-netology/assets/127683348/3ae11b4a-08b0-4f74-bcfe-8f869864dbfe)

![image](https://github.com/inyushov/devops-netology/assets/127683348/c8edfff8-0bc4-4d74-8e54-680cb72fc806)

![image](https://github.com/inyushov/devops-netology/assets/127683348/d06f4349-54a7-4784-947d-32ec97934da4)

Выполняю terraform plan

![image](https://github.com/inyushov/devops-netology/assets/127683348/390620fa-abd2-42a6-a954-eed3bf23b9c1)

Удалил все созданные ресурсы

![image](https://github.com/inyushov/devops-netology/assets/127683348/57cf6834-7ffb-4e44-83ff-021802cef760)










