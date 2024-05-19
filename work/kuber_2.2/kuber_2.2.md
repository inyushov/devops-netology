#### 1. Создать Deployment приложения, использующего локальный PV, созданный вручную.

##### 1.1 Создать Deployment приложения, состоящего из контейнеров busybox и multitool.

Создал новый Namespace для дз:

![image](https://github.com/inyushov/devops-netology/assets/127683348/3d3f5556-f832-4991-90d5-27a9e1e735a4

![image](https://github.com/inyushov/devops-netology/assets/127683348/406b2d0e-b3d0-457f-a5c0-ed01b65fe719)

Статус пода Pending означает, что под не запустился по причине отсутствия PVC с именем pvc-vol

Применяю манифесты PVC c именем Pvc-vol и PV-vol:

![image](https://github.com/inyushov/devops-netology/assets/127683348/45366f08-36b4-4c9b-a27a-25c4494e74d0)

![image](https://github.com/inyushov/devops-netology/assets/127683348/ef42b0ce-110b-432b-ad84-22c0fbf07fc4)

Теперь проверю статус пода, который ожидал создания PVC с именем pvc-vol:

![image](https://github.com/inyushov/devops-netology/assets/127683348/eb81e6fc-3083-40b4-acd4-355b63fe147e)









