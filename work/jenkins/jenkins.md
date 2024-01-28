Создал две VM с помощью Terraform.

![image](https://github.com/inyushov/devops-netology/assets/127683348/ed9c15fa-4b6b-409a-9a40-60f43ae8adc7)

Установил Jenkins при помощи playbook.

![image](https://github.com/inyushov/devops-netology/assets/127683348/79a0ab72-dc93-454a-b63f-cb2032681513)

Запустил Jenkins и проверил его работоспособность

![image](https://github.com/inyushov/devops-netology/assets/127683348/5fd4fc51-2f32-4b17-877f-0d35dfe06d83)

Сделал первоначальную настройку. Подключил агент.

![image](https://github.com/inyushov/devops-netology/assets/127683348/6a2eee89-35fb-46cc-84d6-2a8e884945e8)

Создал Freestyle Job, который запускает molecule test из моего репозитория с ролью vector-role:

![image](https://github.com/inyushov/devops-netology/assets/127683348/d992f36b-ed2f-45cd-a9b8-c4d004975ce3)

Создал Declarative Pipeline Job, который запускает molecule test из того же репозитория:

