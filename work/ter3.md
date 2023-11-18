#### Задание 1

1. Изучил проект.
2. Заполнил токен, ID облака и ID папки пользователя в personal.auto.tfvars.
3. Инициализировал проект и выполнил код.

Создалась сеть и подсеть с именем Develop и группа безопасности с именем example_dynamic и правилами трафика

![image](https://github.com/inyushov/devops-netology/assets/127683348/17396013-bb18-45bb-86ec-a261ba488c19)

![image](https://github.com/inyushov/devops-netology/assets/127683348/e11e9233-c39d-4393-a493-360fa13ccf97)

#### Задание 2

1. Создал файл count-vm.tf и описал в нем две одинаковые VM, с названием web-1 и web-2

![image](https://github.com/inyushov/devops-netology/assets/127683348/9201ac9c-e3ef-4b46-8c0e-b43d963088d2)

Назначил VM созданную в первом задании группу безопасности

![image](https://github.com/inyushov/devops-netology/assets/127683348/5d6062b9-386b-4d40-834b-e9844c350a4b)

2. Создал файл for_each-vm.tf. В нем описал создание двух VM с именами "main" и "replica" разных по cpu/ram/disk , используя мета-аргумент for_each loop

![image](https://github.com/inyushov/devops-netology/assets/127683348/e2c3d267-8208-4fbf-8f89-9975a91c2180)

Добавил переменную each_vm в variables.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/feb47041-2cfc-4002-aa46-d34aadc57140)

3. Добавим в for_each-vm.tf атрибут depends_on = [yandex_compute_instance.count], чтобы данный ресурс создавался после первых VM

![image](https://github.com/inyushov/devops-netology/assets/127683348/088a339f-32a5-4ede-a51e-9a6758712f4a)

4. Создал файл locals.tf, куда внесес переменную ssh, для считывания ключа ~/.ssh/id_ed25519.pub и его последующего использования в блоке metadata

![image](https://github.com/inyushov/devops-netology/assets/127683348/83bcbb2c-330f-41a0-a500-42542b11a870)

5. Инициализировал проект

![image](https://github.com/inyushov/devops-netology/assets/127683348/54408ded-c942-45ec-a1a3-cf357ff21ad1)

![image](https://github.com/inyushov/devops-netology/assets/127683348/fee7d83c-9498-4341-b53f-ccfeeaf03da8)

#### Задание 3

1. Создал файл disk_vm.tf и внес в него ресурс yandex_compute_disk

![image](https://github.com/inyushov/devops-netology/assets/127683348/6f883d83-b195-4d92-8557-01e978b98996)

2. Создал виртуальную машину storage и используя мета-аргумент for_each подключил к ней созданные диски

![image](https://github.com/inyushov/devops-netology/assets/127683348/424601ed-d75c-4cdd-b0e8-346ea9a608e6)

Итог:

![image](https://github.com/inyushov/devops-netology/assets/127683348/a76aad5d-1402-46ef-b685-9afc67811211)

![image](https://github.com/inyushov/devops-netology/assets/127683348/cbf12365-eb64-43b1-8993-6aebeacf3d15)

#### Задание 4

1. Создаk файл ansible.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/de31c53b-c109-43cd-88ee-2990020e4266)

2. Создал файл-шаблон ansible.tftpl

![image](https://github.com/inyushov/devops-netology/assets/127683348/fa20b59d-50d9-4e78-83c4-9108b53328af)

3. Выполнил код

![image](https://github.com/inyushov/devops-netology/assets/127683348/ae8cf21d-3a29-41d2-b614-a3890a970a91)

Скриншот получившегося файла

![image](https://github.com/inyushov/devops-netology/assets/127683348/5b4b0cd4-0849-41dc-965e-d3cde173d056)

Удалил все созданные ресурсы




















