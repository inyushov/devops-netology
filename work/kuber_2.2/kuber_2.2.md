#### 1. Создать Deployment приложения, использующего локальный PV, созданный вручную.

##### 1.1 Создать Deployment приложения, состоящего из контейнеров busybox и multitool.

Создал новый Namespace для дз:

![image](https://github.com/inyushov/devops-netology/assets/127683348/3d3f5556-f832-4991-90d5-27a9e1e735a4)

![image](https://github.com/inyushov/devops-netology/assets/127683348/406b2d0e-b3d0-457f-a5c0-ed01b65fe719)

Статус пода Pending означает, что под не запустился по причине отсутствия PVC с именем pvc-vol

##### 1.2 Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.

Применяю манифесты PVC c именем Pvc-vol и PV-vol:

![image](https://github.com/inyushov/devops-netology/assets/127683348/45366f08-36b4-4c9b-a27a-25c4494e74d0)

![image](https://github.com/inyushov/devops-netology/assets/127683348/ef42b0ce-110b-432b-ad84-22c0fbf07fc4)

Теперь проверю статус пода, который ожидал создания PVC с именем pvc-vol:

![image](https://github.com/inyushov/devops-netology/assets/127683348/08b55c77-419e-46f6-a6f6-e98d644f7d83)

##### 1.3 Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории.

![image](https://github.com/inyushov/devops-netology/assets/127683348/83f63956-fa30-42ea-bf44-882bad651437)

##### 1.4 Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.

![image](https://github.com/inyushov/devops-netology/assets/127683348/eccca9e7-3e5a-47db-8864-414346912e26)

PersistentVolumes это ресурсы кластера Kubernetes, которые существуют независимо от подов. Диск и данные, предоставленные PV, продолжают существовать при изменении кластера, а также при удалении и повторном создании подов.

##### 1.5 Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV. Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.

![image](https://github.com/inyushov/devops-netology/assets/127683348/39b1abad-ddb6-48b2-9d38-14d025b337b0)

![image](https://github.com/inyushov/devops-netology/assets/127683348/6ddc5fbe-fdba-443d-b003-632728be2631)

Удаление PV удаляет только ссылку на хранилище, а не сами данные. Данные в базовом хранилище будут сохраняться до тех пор, пока не будут удалены вручную.

#### 2. Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

##### 2.1 Включить и настроить NFS-сервер на MicroK8S.

![image](https://github.com/inyushov/devops-netology/assets/127683348/62e7dfc5-0871-4642-81ea-ce966aecb889)

##### 2.2 Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
















