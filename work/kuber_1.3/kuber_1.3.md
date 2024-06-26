#### 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

##### 1.1 Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.

Создал новый Namespace для отдельной работы подов, деплойментов, сервисов в этом задании

![image](https://github.com/inyushov/devops-netology/assets/127683348/2427e457-25e1-44fb-b98d-069e6df55d50)

Создал манифест Deployment приложения, который состоит из двух контейнеров nginx и multitool и в параметре HTTP_PORT у контейнера multitool, указал порт 81.
Если не указать порт, то будет возникать ошибка, что данный порт уже занят другим nginx из другого контейнера.

![image](https://github.com/inyushov/devops-netology/assets/127683348/e9d0d270-4220-428b-8000-de5eef656979)

![image](https://github.com/inyushov/devops-netology/assets/127683348/4734852c-d167-4d40-94c2-71ef200d5a13)

![image](https://github.com/inyushov/devops-netology/assets/127683348/a0c4c945-0a63-4c83-8493-f6625b1f0a42)

##### 1.2 После запуска увеличить количество реплик работающего приложения до 2.

Заменил значение replicas на 2 и обновил deployment:

![image](https://github.com/inyushov/devops-netology/assets/127683348/4f21993f-cdbe-42e5-bf5a-170b1ada2a0a)

##### 1.3 Продемонстрировать количество подов до и после масштабирования.

До:

![image](https://github.com/inyushov/devops-netology/assets/127683348/6355b5c7-c3d7-4e4e-b0aa-f59b2954471a)

После:

![image](https://github.com/inyushov/devops-netology/assets/127683348/5784f231-0577-4861-9173-d4efc6733d1b)

##### 1.4 Создать Service, который обеспечит доступ до реплик приложений из п.1.

![image](https://github.com/inyushov/devops-netology/assets/127683348/94c31afd-ae5b-4fc8-a264-ab8d561059d7)

![image](https://github.com/inyushov/devops-netology/assets/127683348/7fc41b1a-c991-41bb-82c3-3cd53eac8e19)

##### 1.5 Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложений из п.1.

![image](https://github.com/inyushov/devops-netology/assets/127683348/f90d3379-fce3-46b6-94e4-c7436e38a56a)

![image](https://github.com/inyushov/devops-netology/assets/127683348/8556c7f3-0d72-4b81-b847-6aaaab7c471a)

Ответил nginx

#### 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

##### 2.1 Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.

##### 2.2 Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.

![image](https://github.com/inyushov/devops-netology/assets/127683348/1f0b3f4e-3ef6-45a0-900e-02f5ddc53888)

Под не запущен и находится в состоянии Init:0/1

##### 2.3 Создать и запустить Service. Убедиться, что Init запустился.

##### 2.4 Продемонстрировать состояние пода до и после запуска сервиса.

![image](https://github.com/inyushov/devops-netology/assets/127683348/b0674456-0361-4be3-83c0-359104527f72)

![image](https://github.com/inyushov/devops-netology/assets/127683348/2758085b-cbeb-42de-9986-9696f8705981)

До:

![image](https://github.com/inyushov/devops-netology/assets/127683348/4fce7c08-37ea-420d-9a2d-1f40fb4dcf00)

После:

![image](https://github.com/inyushov/devops-netology/assets/127683348/1caf7346-d100-4a7b-bb49-a48530f8a5fd)











