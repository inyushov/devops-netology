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
