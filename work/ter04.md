#### Задание 1

1. Склонировал код из демонстрации и изучал его.
2. Взял файл main.tf из демонстрации и отредактировал его:

изменил количество VM

![image](https://github.com/inyushov/devops-netology/assets/127683348/d9bfe4ee-f72a-4532-8128-836b2d346b0b)

добавил строчку

![image](https://github.com/inyushov/devops-netology/assets/127683348/64282344-4e70-4b2b-b499-79d12fbaf177)

Решил использовать такую конструкцию, так как в задании указано условие, что переменная authorized-keys должна принимать в себя список, а не строку

Переменная ssh-authorized-keys в файле variables.tf выглядит следующим образом:

![image](https://github.com/inyushov/devops-netology/assets/127683348/93901810-cd77-4c05-9bfb-9df92d4989fa)

3. Добавил в файл cloud-init.yml установку nginx и vim:

![image](https://github.com/inyushov/devops-netology/assets/127683348/b961c552-2cfb-497c-902a-accb3d492bf8)

4. 

![image](https://github.com/inyushov/devops-netology/assets/127683348/60e79f4b-92a3-4cab-8dd1-0f6a8af4d769)

![image](https://github.com/inyushov/devops-netology/assets/127683348/1a7dba28-c076-4ffe-89db-77235f8a19bf)

#### Задание 2

