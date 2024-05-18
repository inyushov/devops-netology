#### 1.  Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

##### 1.1 Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.

Создал новый Namespace для дз:

![image](https://github.com/inyushov/devops-netology/assets/127683348/64c4c70c-7b62-4852-a162-d651046964ed)

![image](https://github.com/inyushov/devops-netology/assets/127683348/cab24a21-0fa6-4020-a699-56ab637a2d27)

##### 1.2 Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.

![image](https://github.com/inyushov/devops-netology/assets/127683348/bc8f02ba-2e84-4266-9347-238fe9f9fa4f)

##### 1.3 Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.

##### 1.4 Продемонстрировать доступ с помощью curl по доменному имени сервиса.

##### 1.5 Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

![image](https://github.com/inyushov/devops-netology/assets/127683348/66a44105-5193-49fa-8e74-d150e81a7149)

![image](https://github.com/inyushov/devops-netology/assets/127683348/a6f68afe-7708-4b24-bfc5-b238f159a310)

![image](https://github.com/inyushov/devops-netology/assets/127683348/a277477d-3510-484d-97b9-1ca48055cc21)

#### 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

##### 2.1 Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.

![image](https://github.com/inyushov/devops-netology/assets/127683348/c3f6bcc7-e163-4676-b517-a03c8bb5dfd5)

##### 2.2 Продемонстрировать доступ с помощью браузера или curl с локального компьютера.

##### 2.3 Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

![image](https://github.com/inyushov/devops-netology/assets/127683348/8d4e6ed6-ac5b-4b0c-a157-0eb81bd4b3e0)

![image](https://github.com/inyushov/devops-netology/assets/127683348/f61e3414-60cc-4593-a0fa-40da292ead84)








