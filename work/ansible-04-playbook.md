#### 1. Создал в старой версии playbook файл requirements.yml и заполнил его содержимым указанным в задании.

#### 2. При помощи ansible-galaxy скачал себе эту роль.

```
root@server1:/vagrant/ansible-04-playbook/playbook# ansible-galaxy role install -p roles -r requirements.yml
Starting galaxy role install process
- extracting clickhouse to /vagrant/ansible-04-playbook/playbook/roles/clickhouse
- clickhouse (1.11.0) was installed successfully
```
