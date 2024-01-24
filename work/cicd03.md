Создал две VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7. Для создания использовал Terraform, ссылка на код.

Прописал в inventory созданные хосты.

Добавил в директорию files файл со своим публичным ключом (id_ed25519.pub).

Запустил playbook, дождался успешного завершения:

![image](https://github.com/inyushov/devops-netology/assets/127683348/f5d7c154-2c36-466c-9300-b08883d8cab0)

Открыл браузер, проверил готовность SonarQube через браузер
Зашел под admin\admin, поменял пароль на свой.

![image](https://github.com/inyushov/devops-netology/assets/127683348/84ac1de1-1b04-444e-afd5-4e035c99c25d)

Проверил готовность Nexus через бразуер.
Подключился под admin\admin123, поменял пароль, сохранил анонимный доступ.

![image](https://github.com/inyushov/devops-netology/assets/127683348/fc68b13e-cec6-43bc-af07-35962c79982f)

## Знакомоство с SonarQube

Решение основной части

Создал новый проект, назвал Netology.

Sonar-scanner предлагает скачать пакет. Скачиваю его и размещаю в директории загрузок, выбор директории будет не важен.

Чтобы бинарник Sonar-scanner был доступен, добавляю его в переменную PATH.

Проверяю вывод команды sonar-scanner --version:

![image](https://github.com/inyushov/devops-netology/assets/127683348/d1309c05-98f4-49bf-915c-480d988097cd)

Запускаю анализатор кода с дополнительным ключом:

![image](https://github.com/inyushov/devops-netology/assets/127683348/795e151c-fd76-49c7-9c27-c58603d8b30b)

После анализа получаю ссылку на дашборд с результатом анализа:

![image](https://github.com/inyushov/devops-netology/assets/127683348/a48462e7-1601-4d85-a314-d4ee43737ab8)

Смотрю результат в интерфейсе, вижу, что есть 2 бага и 1 Code Smells:

![image](https://github.com/inyushov/devops-netology/assets/127683348/4c83b774-bb7c-4723-89ac-0ea4b080b28e)

![image](https://github.com/inyushov/devops-netology/assets/127683348/990d7a6f-c4b1-48a9-84f4-73d34fd63528)

Исправляю ошибки.

Заново запускаю анализатор, вижу, что ошибок и предупреждений нет.

Скриншот успешного прохождения анализа:

![image](https://github.com/inyushov/devops-netology/assets/127683348/6c968573-24da-4a98-9b4d-0abfb772586d)

## Знакомство с Nexus



