#### Задание 1

1. Изучил проект и посмотрел variables.tf. Файл variables.tf нужен для определения типов переменных и при необходимости, установки их значения по умолчанию.

2. Переименовал файл personal.auto.tfvars_example в personal.auto.tfvars, заполнил переменные. Посмотрел, что файл personal.auto.tfvars находится в .gitignore, по этому можно не опасаться утечки данных.

3. Используя свой текущий ssh-ключ, записал его pub часть в переменную vms_ssh_root_key.

4. Инициализировал проект, выполнил код. Нашел ошибки в блоке resource "yandex_compute_instance" "platform" {.

Ошибки были следующие:

В строке platform_id = "standart-v4" должно быть слово standard1 (т.к. согластно документации Yandex.Cloud https://cloud.yandex.ru/docs/compute/concepts/vm-platforms платформы могут быть только v1, v2 и v3)
В строке cores = 1 указано неправильное количество ядер процессора (т.к. согласно документации Yandex.Cloud https://cloud.yandex.ru/docs/compute/concepts/performance-levels минимальное количество виртуальных ядер процессора для всех платформ равно двум.

![image](https://github.com/inyushov/devops-netology/assets/127683348/7a3dc00c-59c4-4009-b9ee-a4c16ec8440c)

5. Параметр preemptible = true применяется в случае, если нужно сделать виртуальную машину прерываемой, то есть с возможность остановки виртуальной машины в любой момент. Применятся если с момента запуска виртуальной машины прошло 24 часа либо возникает нехватка ресурсов для запуска виртуальной машины. Прерываемые виртуальные машины не обеспечивают отказоустойчивость.
Параметр core_fraction=5 указывает базовую производительность ядра в процентах, указывается для экономии ресурсов.

Виртуальная машина успешно создана:

![image](https://github.com/inyushov/devops-netology/assets/127683348/73b13246-81e4-4a24-99a7-d16c2afd60f6)

![image](https://github.com/inyushov/devops-netology/assets/127683348/cc88cdfa-f0ac-4528-9082-511f01c00e4e)

![image](https://github.com/inyushov/devops-netology/assets/127683348/0ba20cc6-df5a-412d-8089-318b3a0bddfe)

#### Задание 2

1. Изучил файлы проекта.

2. Изменил main.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/33a4ae5d-20fe-4a49-a345-5e3570bc31a4)

3. Добавил новые переменные в variables.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/12cc8162-fbdb-4db7-8c2c-51f3eae7204f)

4. Выполнил terraform plan, появилось сообщение о том, что terraform не нашел отличий от действующей инфраструктуры

![image](https://github.com/inyushov/devops-netology/assets/127683348/d0d89dcf-6100-46c4-8fe0-3f32da142171)

#### Задание 3

1. Создал в корне проекта файл 'vms_platform.tf'. Перенес в него все переменные первой ВМ
   
3. В блоке ресурса создал вторую ВМ с указанными параметрами и объявил её переменные с префиксом vm_db_ в файле vms_platform.tf

main.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/4e5898a4-94a1-467f-9126-b7a32a71336b)

vms_platform.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/bb47469a-faff-4917-88af-dea367d133b3)

4. Применил конфигурацию, вносится изменение в текущую инфраструктуру, создается еще одна виртуальная машина

![image](https://github.com/inyushov/devops-netology/assets/127683348/a5ce506f-115b-4251-8e60-9de7953e6180)







