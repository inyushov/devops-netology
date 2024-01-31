#### 1. Создал в старой версии playbook файл requirements.yml и заполнил его содержимым указанным в задании.

```
---
  - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
    scm: git
    version: "1.13"
    name: clickhouse 
```

#### 2. При помощи ansible-galaxy скачал себе эту роль.

```
root@server1:/vagrant/ansible-04-playbook/playbook# ansible-galaxy role install -p roles -r requirements.yml
Starting galaxy role install process
- extracting clickhouse to /vagrant/ansible-04-playbook/playbook/roles/clickhouse
- clickhouse (1.13) was installed successfully
```

#### 3. Создал новый каталог с ролью при помощи:

```
root@server1:/vagrant/ansible-04-playbook/playbook/roles# ansible-galaxy role init vector-role
- Role vector-role was created successfully
root@server1:/vagrant/ansible-04-playbook/playbook/roles# ansible-galaxy role init lighthouse-role
- Role lighthouse-role was created successfully
```

#### 4. На основе tasks из старого playbook заполнил новую role. Разнес переменные между vars и default.

#### 5. Перенес нужные шаблоны конфигов в templates.

#### 6. Описал в README.md обе роли и их параметры.

