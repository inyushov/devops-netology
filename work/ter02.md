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
   
2. В блоке ресурса создал вторую ВМ с указанными параметрами и объявил её переменные с префиксом vm_db_ в файле vms_platform.tf

main.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/4e5898a4-94a1-467f-9126-b7a32a71336b)

vms_platform.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/bb47469a-faff-4917-88af-dea367d133b3)

3. Применил конфигурацию, внеслись изменения в текущую инфраструктуру, создалась еще одна виртуальная машина

![image](https://github.com/inyushov/devops-netology/assets/127683348/a5ce506f-115b-4251-8e60-9de7953e6180)

#### Задание 4

1. Объявил в outputs.tf output типа map, получился следующий output

![image](https://github.com/inyushov/devops-netology/assets/127683348/5cdc89ab-5b9c-40da-9d61-cb45dc2ea2f3)

2. Применил изменения, terraform output

![image](https://github.com/inyushov/devops-netology/assets/127683348/0d0035ca-3311-4944-9889-73fdbf010865)

#### Задание 5

1. В файле locals.tf применил интерполяцию, в одном блоке описал имена виртуальных машин

![image](https://github.com/inyushov/devops-netology/assets/127683348/91f9119b-5b24-47c7-a9a3-1d2715a51c0d)

2. Заменил переменные с именами виртуальных машин из файла variables.tf на созданные мною local-переменные

![image](https://github.com/inyushov/devops-netology/assets/127683348/22035f32-37b3-49fa-b165-bfbd57d1a946)

![image](https://github.com/inyushov/devops-netology/assets/127683348/5ffbb2ac-991a-4366-9404-5e08c9494c43)

3. Применил изменения

#### Задание 6

1. Описываю переменные ".._cores",".._memory",".._core_fraction" в vms_platform.tf

![image](https://github.com/inyushov/devops-netology/assets/127683348/e5ec2d49-f36c-42e4-a575-a362d83ed03f)

В main.tf в блоке resources применяю описанные выше переменные

![image](https://github.com/inyushov/devops-netology/assets/127683348/59b5b94c-08db-4dd4-ab25-5d0aea0c6a83)

![image](https://github.com/inyushov/devops-netology/assets/127683348/c4131db1-3038-4053-83c5-da9720893692)

2. Для блока metadata описываю переменные

![image](https://github.com/inyushov/devops-netology/assets/127683348/68009ae3-0517-4353-88e5-02d2ee730913)

В main.tf в блоке resources применяю описанные выше переменные

![image](https://github.com/inyushov/devops-netology/assets/127683348/518e1852-2489-46a5-b6f0-7bcf6095309d)

![image](https://github.com/inyushov/devops-netology/assets/127683348/04e854a3-ee07-4ca5-a37b-a2ebc81dc413)

3. Удалил неиспользуемые переменные

4. Команда terraform plan изменение не выявила

 ![image](https://github.com/inyushov/devops-netology/assets/127683348/c0ede124-e136-418f-a1b8-c5982a0108a2)






