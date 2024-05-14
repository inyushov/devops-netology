#### 1. Yandex Cloud

##### Создать бакет Object Storage и разместить в нём файл с картинкой:

[Конфигурация bucket.tf](https://github.com/inyushov/devops-netology/blob/main/work/clopro-02/src/bucket.tf)

Скрин Бакета

![image](https://github.com/inyushov/devops-netology/assets/127683348/c2e30ab5-ec74-443e-b451-f3c8d26cf416)

Полученная ссылка для скачивания

https://storage.yandexcloud.net/test-storage-picture/Screenshot_1.jpg

##### Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать image_id = fd827b91d99psvq5fjit 

[main.tf](https://github.com/inyushov/devops-netology/blob/main/work/clopro-02/src/main.tf)
