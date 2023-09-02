### Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume

![image](https://github.com/inyushov/devops-netology/assets/127683348/c0d86be4-8662-4cb3-a453-78c80b706a96)

Подключитесь к БД PostgreSQL, используя psql

Воспользуйтесь командой \? для вывода подсказки по имеющимся в psql управляющим командам

![image](https://github.com/inyushov/devops-netology/assets/127683348/0808636e-18b9-495a-b31b-2f6e6e73a197)

вывод списка БД

![image](https://github.com/inyushov/devops-netology/assets/127683348/804a7cc5-3fea-4d1c-a62f-cb769dcc56dd)

подключения к БД

![image](https://github.com/inyushov/devops-netology/assets/127683348/ea56ff54-8065-4f4f-8b89-ab6ba77ad159)

вывод списка таблиц

![image](https://github.com/inyushov/devops-netology/assets/127683348/bdb5849a-ef77-4061-b334-308653548817)

вывод описания содержимого таблиц

![image](https://github.com/inyushov/devops-netology/assets/127683348/1819af83-dcab-465e-a2fa-b8b2fa9c5c1b)

выход из psql

![image](https://github.com/inyushov/devops-netology/assets/127683348/e21673b2-3887-461e-b7e0-9d178bebe0b1)

### Задача 2

Используя psql, создайте БД test_database

![image](https://github.com/inyushov/devops-netology/assets/127683348/c3303e6b-ff16-4c5a-a254-ba1dad462c56)

Изучите бэкап БД.

Восстановите бэкап БД в test_database.

![image](https://github.com/inyushov/devops-netology/assets/127683348/ed750353-ad42-4269-8119-bdf382af8417)

Перейдите в управляющую консоль psql внутри контейнера

![image](https://github.com/inyushov/devops-netology/assets/127683348/5651237d-3cb2-45ea-9821-8a9508af7e46)

Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице

![image](https://github.com/inyushov/devops-netology/assets/127683348/d7ee2733-ba73-4d36-88d9-5833501296b4)

Используя таблицу pg_stats, найдите столбец таблицы orders с наибольшим средним значением размера элементов в байтах

Приведите в ответе команду, которую вы использовали для вычисления, и полученный результат

![image](https://github.com/inyushov/devops-netology/assets/127683348/4c7ab0ba-236d-49a0-ab44-34be5dedfa39)

### Задача 3

Переименовываем старую таблицу и создаем новую с разбиением

![image](https://github.com/inyushov/devops-netology/assets/127683348/a40520ca-8e04-4d40-a0f3-2eac42f21fb4)

Изначально на этапе проектирования таблиц можно было сделать её шардированной, тогда не пришлось бы переименовывать исходную таблицу и переносить данные в новую.

### Задача 4

![image](https://github.com/inyushov/devops-netology/assets/127683348/37e664bf-8320-4be8-bde7-ac5f0a727e1f)

Для уникальности можно добавить индекс: CREATE INDEX ON orders ((lower(title)));





