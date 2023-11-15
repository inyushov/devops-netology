Задание 1

1. Изучил проект и посмотрел variables.tf. Файл variables.tf нужен для определения типов переменных и при необходимости, установки их значения по умолчанию.

2. Переименовал файл personal.auto.tfvars_example в personal.auto.tfvars, заполнил переменные. Посмотрел, что файл personal.auto.tfvars находится в .gitignore, по этому можно не опасаться утечки данных.

3. Используя свой текущий ssh-ключ, записал его pub часть в переменную vms_ssh_root_key.

4. Инициализировал проект, выполнил код. Нашел ошибки в блоке resource "yandex_compute_instance" "platform" {.

Ошибки были следующие:

В строке platform_id = "standart-v4" должно быть слово standard1 (т.к. согластно документации Yandex.Cloud https://cloud.yandex.ru/docs/compute/concepts/vm-platforms платформы могут быть только v1, v2 и v3)
В строке cores = 1 указано неправильное количество ядер процессора (т.к. согласно документации Yandex.Cloud https://cloud.yandex.ru/docs/compute/concepts/performance-levels минимальное количество виртуальных ядер процессора для всех платформ равно двум.
![image](https://github.com/inyushov/devops-netology/assets/127683348/9f442cf8-6138-4cb8-b675-611205a0b2b2)


