#### 1. Yandex Cloud

##### Создать бакет Object Storage и разместить в нём файл с картинкой:

[Конфигурация bucket.tf](https://github.com/inyushov/devops-netology/blob/main/work/clopro-02/src/bucket.tf)

Скрин Бакета

![image](https://github.com/inyushov/devops-netology/assets/127683348/c2e30ab5-ec74-443e-b451-f3c8d26cf416)

Полученная ссылка для скачивания

https://storage.yandexcloud.net/test-storage-picture/Screenshot_1.jpg

##### Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать image_id = fd827b91d99psvq5fjit 

[Конфигурация main.tf](https://github.com/inyushov/devops-netology/blob/main/work/clopro-02/src/main.tf)

Скрин Instance Group

![image](https://github.com/inyushov/devops-netology/assets/127683348/37b67ed5-1c13-46a7-9670-411a3f6ee616)

Скрин Target Group

![image](https://github.com/inyushov/devops-netology/assets/127683348/e507d33a-820e-4c74-a150-2c5272d5cd3d)

Балансировщики

![image](https://github.com/inyushov/devops-netology/assets/127683348/d38e6911-15be-4ddf-8f1b-43e00081c0f5)

Скрин картинки на инстансах из Instance Group

![image](https://github.com/inyushov/devops-netology/assets/127683348/f230cb91-3749-4c63-bf62-4af6690b62c0)

##### Подключить группу к сетевому балансировщику:

Конфигурация [network.tf](https://github.com/inyushov/devops-netology/blob/main/work/clopro-02/src/network.tf)

![image](https://github.com/inyushov/devops-netology/assets/127683348/2f2ccc96-434c-45fe-8ccb-4659cfe56d88)

![image](https://github.com/inyushov/devops-netology/assets/127683348/427cc0de-670d-49c6-a37b-b6757d8fbf23)

Проверка работоспособности при удалении одной машины

![image](https://github.com/inyushov/devops-netology/assets/127683348/a84aa5ae-7177-484f-ab50-d7e69ced9ede)

![image](https://github.com/inyushov/devops-netology/assets/127683348/91a2a176-7c62-4c65-b36d-a7f6781aba12)

![image](https://github.com/inyushov/devops-netology/assets/127683348/f86dac98-e6f8-4b82-a4a6-ba2e9298ab83)

![image](https://github.com/inyushov/devops-netology/assets/127683348/238d03d6-57f2-4005-99e7-7621f04cc829)


Проверяем вызов по адресу балансировщика:

![image](https://github.com/inyushov/devops-netology/assets/127683348/b5d3ff11-6e9b-4c0a-a539-1c40d6d27aec)






