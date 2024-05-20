#### 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

Создал новый Namespace для дз:

![image](https://github.com/inyushov/devops-netology/assets/127683348/ded02b93-efdf-437f-bdf3-58e8df867c3e)

Service:

![image](https://github.com/inyushov/devops-netology/assets/127683348/c63e7e6e-2102-41f9-b7f5-ffdc982284dc)

Configmap:

![image](https://github.com/inyushov/devops-netology/assets/127683348/484df597-1319-4ce6-a6a7-1a85e2c711cc)

Deployment:

![image](https://github.com/inyushov/devops-netology/assets/127683348/bac80cec-3d2a-4f0a-a02c-7544040d3d4a)

curl:

![image](https://github.com/inyushov/devops-netology/assets/127683348/ff1f0e31-29e0-4785-a970-98400de2513e)

браузер:

![image](https://github.com/inyushov/devops-netology/assets/127683348/74f106fc-e0c4-48b8-9aff-b9eab4d1c9fd)

#### 2. Создать приложение с вашей веб-страницей, доступной по HTTPS

Deployment:

![image](https://github.com/inyushov/devops-netology/assets/127683348/081bc4a7-97cc-4bf2-92a5-8175a5e07692)

Configmap:

![image](https://github.com/inyushov/devops-netology/assets/127683348/02dd3585-6dbe-46ce-800b-19f4787a2dc3)

Выпускаю самоподписный сертификат SSL:

![image](https://github.com/inyushov/devops-netology/assets/127683348/6fe02df3-19c3-4077-9045-a03c92d4898d)

Файлы сертификата переместил в созданную папку cert:

![image](https://github.com/inyushov/devops-netology/assets/127683348/c5e7aff4-0db0-4a66-9a22-cb43ff21df92)

Создаю secret:

![image](https://github.com/inyushov/devops-netology/assets/127683348/9a84b821-616d-4f2b-92ef-c6061215f07d)

![image](https://github.com/inyushov/devops-netology/assets/127683348/9a146ee9-6b7b-4c12-bed1-9a38e3573412)


Ingress:

![image](https://github.com/inyushov/devops-netology/assets/127683348/31884a82-5bea-4d3c-9e42-f847b5101b7d)

Service:

![image](https://github.com/inyushov/devops-netology/assets/127683348/14b857f7-4910-4fae-84db-63f6862591d6)

Запускаем все созданные манифесты и проверяем:

![image](https://github.com/inyushov/devops-netology/assets/127683348/7ee07612-8572-4b4e-8787-758e54c894a5)

![image](https://github.com/inyushov/devops-netology/assets/127683348/0c8a1191-dde3-4ea1-9e3b-3eafe7615ea1)

Прописываю dns my-kuber.com в файл hosts и проверяю доступность измененной страницы через curl:

![image](https://github.com/inyushov/devops-netology/assets/127683348/d471a512-b3ee-4464-adb3-9a41698423c3)











