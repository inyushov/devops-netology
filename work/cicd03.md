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

