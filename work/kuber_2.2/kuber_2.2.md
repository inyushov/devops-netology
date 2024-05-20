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

![image](https://github.com/inyushov/devops-netology/assets/127683348/37fa40e2-4000-4290-8ff2-db7718892492)

![image](https://github.com/inyushov/devops-netology/assets/127683348/b642f143-587c-4409-a763-0e33e92c73fe)

![image](https://github.com/inyushov/devops-netology/assets/127683348/f928bbf8-6a4f-4e41-ae60-ba12f1e06fdb)

![image](https://github.com/inyushov/devops-netology/assets/127683348/a945bc21-ceac-4dc8-b115-db3427839358)

Ошибка: 
failed to provision volume with StorageClass "nfs-csi": rpc error: code = Internal desc = failed to mount nfs server: rpc error: code = Internal desc = mount failed: exit status 32
Mounting command: mount
Mounting arguments: -t nfs -o hard,nfsvers=4.1 192.168.56.11:/srv/nfs /tmp/pvc-82d0fa4f-86a7-4db2-bf85-5bf8a2b24086
Output: mount.nfs: access denied by server while mounting 192.168.56.11:/srv/nfs
  Normal  ExternalProvisioning  11s (x4 over 55s)  persistentvolume-controller  Waiting for a volume to be created either by the external provisioner 'nfs.csi.k8s.io' or manually by the system administrator. If volume creation is delayed, please verify that the provisioner is running and correctly registered.

Установил пакет nfs-common через команду sudo apt install nfs-common -y , установка прошла успешно:

![image](https://github.com/inyushov/devops-netology/assets/127683348/3407a557-fb12-42c5-958f-5ebe67ca9aea)

Повторил выполнение задания с нуля:

![image](https://github.com/inyushov/devops-netology/assets/127683348/cedb8509-20b3-403e-aa82-52d8ff9cf6fd)

К сожалению ошибка осталась(

![image](https://github.com/inyushov/devops-netology/assets/127683348/49573694-f90a-4300-b1d9-b2ba11115a63)












