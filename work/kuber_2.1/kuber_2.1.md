#### 1. Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

##### 1.1 Создать Deployment приложения, состоящего из контейнеров busybox и multitool.

##### 1.2 Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.

##### 1.3 Обеспечить возможность чтения файла контейнером multitool.

Создал новый Namespace для дз:

![image](https://github.com/inyushov/devops-netology/assets/127683348/1554531d-a7e4-49aa-b0f2-e52b40f35257)

![image](https://github.com/inyushov/devops-netology/assets/127683348/d002c5d0-cd58-442a-b645-56458f28db52)

![image](https://github.com/inyushov/devops-netology/assets/127683348/2356b764-3808-4b7e-b9c6-3e9592d55e6e)

##### 1.4 Продемонстрировать, что multitool может читать файл, который периодоически обновляется.

##### 1.5 Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.

![image](https://github.com/inyushov/devops-netology/assets/127683348/a376ffe4-a497-4ca5-b6f6-cfe0e20165ca)

#### 2. Создать DaemonSet приложения, которое может прочитать логи ноды.

##### 2.1 Создать DaemonSet приложения, состоящего из multitool.

##### 2.2 Обеспечить возможность чтения файла /var/log/syslog кластера MicroK8S.

![image](https://github.com/inyushov/devops-netology/assets/127683348/6e4e0007-dd08-4978-808e-4ed6693903ba)

![image](https://github.com/inyushov/devops-netology/assets/127683348/97c7cdaa-2f61-4124-8956-2a478bf31099)

##### 2.3 Продемонстрировать возможность чтения файла изнутри пода.

##### 2.4 Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

![image](https://github.com/inyushov/devops-netology/assets/127683348/52b1144f-c533-4e3b-9675-c6259d69a5c2)














