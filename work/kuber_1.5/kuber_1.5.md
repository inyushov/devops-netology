#### 1. Создать Deployment приложений backend и frontend

#### 1.1 Создать Deployment приложения frontend из образа nginx с количеством реплик 3 шт.

Создал новый Namespace для дз:

![image](https://github.com/inyushov/devops-netology/assets/127683348/37939798-9fe7-431e-9947-9fc6d03e6ae1)

![image](https://github.com/inyushov/devops-netology/assets/127683348/11d25189-2190-46df-94dd-392ebf55dea0)

#### 1.2 Создать Deployment приложения backend из образа multitool.

![image](https://github.com/inyushov/devops-netology/assets/127683348/36a7ddb6-298c-417a-b21e-522d9a6b7169)

#### 1.3 Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.

Поднимаю frontend:

![image](https://github.com/inyushov/devops-netology/assets/127683348/e8756cbb-318a-4a43-bbca-fa7bb5661931)

Поднимаю backend:

![image](https://github.com/inyushov/devops-netology/assets/127683348/e1e9095f-d53a-4468-a9fd-be75b92000ee)

#### 1.4 Продемонстрировать, что приложения видят друг друга с помощью Service.

#### 1.5 Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

curl c frontend:

![image](https://github.com/inyushov/devops-netology/assets/127683348/2aa473bd-049b-48bd-ac48-5f030694170a)

curl c backend:

![image](https://github.com/inyushov/devops-netology/assets/127683348/9a785313-5f78-4a32-ba54-4f4adc39910d)

#### 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

#### 2.1 Включить Ingress-controller в MicroK8S.

![image](https://github.com/inyushov/devops-netology/assets/127683348/f9fd3b04-8895-4110-83f9-d7e3a5c2775b)

![image](https://github.com/inyushov/devops-netology/assets/127683348/b5979239-d6d2-4ea5-9ed1-0bb303214b4c)

#### 2.2 Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался frontend а при добавлении /api - backend.

![image](https://github.com/inyushov/devops-netology/assets/127683348/5e53f1aa-728a-4f67-8092-618206e23d3e)

#### 2.3 Продемонстрировать доступ с помощью браузера или curl с локального компьютера.

#### 2.4 Предоставить манифесты и скриншоты или вывод команды п.2.

![image](https://github.com/inyushov/devops-netology/assets/127683348/4cca7203-e0af-45dd-a6cc-bafa71ca2c12)

![image](https://github.com/inyushov/devops-netology/assets/127683348/15d55f10-3399-4e56-a0ff-3b6d22302c1a)




