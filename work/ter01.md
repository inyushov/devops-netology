1. Находясь в каталоге с файлом main.tf командой terraform init произвожу инициализацию рабочего каталога и скачиваю зависимости, указанные в файле
   
   ![image](https://github.com/inyushov/devops-netology/assets/127683348/fa870a41-44b4-4346-ba01-86dfb01374fa)

2. Файл .gitignore. необходим для указания списка других файлов или папок, которые Git будет игнорировать при работе. Возможно применение внутри файла шаблонов, например, .tfstate.*. В данном конкретном файле .gitignore указан файл personal.auto.tfvars как возможное хранилище для секретной информации.

3. Выполняю код из файла main.tf

   ![image](https://github.com/inyushov/devops-netology/assets/127683348/91cfea8a-1745-4976-9d95-9fc9ec254c43)

   Был создан 16-изначный случайный пароль в ключе "result":

   ![image](https://github.com/inyushov/devops-netology/assets/127683348/329e5206-b591-4dfd-b512-0a7b2b69929d)

4. Раскомментировал блок кода, примерно расположенный на строчках 29–42 файла main.tf. , выполняю команду terraform validate

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
