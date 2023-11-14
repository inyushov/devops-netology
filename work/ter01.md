Чек-лист готовности к домашнему заданию

1. 

![image](https://github.com/inyushov/devops-netology/assets/127683348/ffac063f-2ced-4fdd-9d2a-44192439b133)

2. 

![image](https://github.com/inyushov/devops-netology/assets/127683348/7027e181-5a2c-4cd1-a08e-d42f9dca405d)

3.

![image](https://github.com/inyushov/devops-netology/assets/127683348/2b19bb13-6e33-437a-bcc1-d1eee11ccef4)

4.

![image](https://github.com/inyushov/devops-netology/assets/127683348/23f61555-4013-4c9c-83df-d5434742c3c9)


Задание


1. Находясь в каталоге с файлом main.tf командой terraform init произвожу инициализацию рабочего каталога и скачиваю зависимости, указанные в файле
   
   ![image](https://github.com/inyushov/devops-netology/assets/127683348/fa870a41-44b4-4346-ba01-86dfb01374fa)

2. Файл .gitignore. необходим для указания списка других файлов или папок, которые Git будет игнорировать при работе. Возможно применение внутри файла шаблонов, например, .tfstate.*. В данном конкретном файле .gitignore указан файл personal.auto.tfvars как возможное хранилище для секретной информации.

3. Выполняю код из файла main.tf

   ![image](https://github.com/inyushov/devops-netology/assets/127683348/91cfea8a-1745-4976-9d95-9fc9ec254c43)

   Был создан 16-изначный случайный пароль в ключе "result":

   ![image](https://github.com/inyushov/devops-netology/assets/127683348/17190442-8c16-44e8-abbd-2a32f3aa4db9)

   ![image](https://github.com/inyushov/devops-netology/assets/127683348/45b4dc96-ad2d-4c55-83ce-77f91e7fb40e)



5. Раскомментировал блок кода, примерно расположенный на строчках 29–42 файла main.tf. , выполняю команду terraform validate

   ![image](https://github.com/inyushov/devops-netology/assets/127683348/113ba94c-5b86-4875-82c1-05c4cde394b1)

Нашел следующие ошибки в коде:
1. Не было указано имя ресурса docker_image, написал nginx: resource "docker_image" "nginx" {
2. Имя контейнера Docker было написано неправильно - 1nginx, правильный вариант: resource "docker_container" "nginx" {
3. В строке name = "example_${random_password.random_string_FAKE.resulT}" _FAKE оказалось лишним, т.к. создавался ресурс resource "random_password" "random_string" { и ключ resulT написан с буквой T в верхнем регистре, должно быть написано с буквой в нижнем регистре.

Исправленный фрагмент кода выглядит так:

![image](https://github.com/inyushov/devops-netology/assets/127683348/26e10c07-9239-4741-8566-87c00d9f040b)

![image](https://github.com/inyushov/devops-netology/assets/127683348/e8aed5e5-9a0a-4996-828b-e0c2714f5b6c)

5. Выполняю исправленный код. В результате получаю запущенный контейнер nginx с именем example_i3BpYkXWnIzeErPr

![image](https://github.com/inyushov/devops-netology/assets/127683348/e3258cba-be06-455c-88d6-dd684ca0c247)

6. Меняю в блоке resource "docker_container" "nginx" { имя контейнера на hello_world и выполняю команду terraform apply -auto-approve и docker ps

![image](https://github.com/inyushov/devops-netology/assets/127683348/8da17fac-1e95-49e3-abf8-9fcf98683a76)

В итоге получаю следующее: так как используется один и тот же образ, контейнер с именем example_i3BpYkXWnIzeErPr был удален и был создан контейнер с именем hello_world.

Опасность команды terraform apply -auto-approve заключается в том, что будет выполняться пропуск планирования ресурсов и вопрос о применении кода не будет задан, что грозит риском потерять уже развернутые ресурсы. В моем случае был удален контейнер и создан новый.

7. Командой terraform destroy уничтожаю все ресурсы, на вопрос отвечаю yes и вижу, что все описанные в main.tf ресурсы уничтожены:

![image](https://github.com/inyushov/devops-netology/assets/127683348/8485a859-e46c-4c38-9f1e-07d926c5e032)

![image](https://github.com/inyushov/devops-netology/assets/127683348/c3d94f59-fc3c-4f0a-b7f5-5cf181319c5b)

Но при этом создался файл terraform.tfstate.backup, содержащий в себе данные до уничтожения ресурсов.

8. Образ nginx:latest не был удален потому, что в описании ресурса образа есть настройка удержания образа keep_locally = true.

