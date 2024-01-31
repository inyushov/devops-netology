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

#### 7. Повторил шаги 3–6 для LightHouse:

#### 8. Выложил все roles в репозитории. Проставил теги, используя семантическую нумерацию. Добавил roles в requirements.yml в playbook.

lighthouse-role, tag: 1.0.0

vector-role, tag: 1.0.0.

requirements.yml https://github.com/inyushov/devops-netology/blob/main/work/08-ansible-04-role/src/playbook/requirements.yml

#### 9. Переработал playbook на использование roles.

site.yml https://github.com/inyushov/devops-netology/blob/main/work/08-ansible-04-role/src/playbook/site.yml

Работа playbook и предварительное скачивание требуемых ролей, описанных в requirements.yml:

ansible-playbook -i inventory/prod.yml site.yml

```
root@server1:/vagrant/ansible-04-playbook/playbook# ansible-playbook -i inventory/prod.yml site.yml

PLAY [Install Clickhouse] **********************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Include OS Family Specific Variables] ***************************************************************
ok: [clickhouse-01]

TASK [clickhouse : include_tasks] **************************************************************************************
included: /vagrant/ansible-04-playbook/playbook/roles/clickhouse/tasks/precheck.yml for clickhouse-01

TASK [clickhouse : Requirements check | Checking sse4_2 support] *******************************************************
ok: [clickhouse-01]

TASK [clickhouse : Requirements check | Not supported distribution && release] *****************************************
skipping: [clickhouse-01]

TASK [clickhouse : include_tasks] **************************************************************************************
included: /vagrant/ansible-04-playbook/playbook/roles/clickhouse/tasks/params.yml for clickhouse-01

TASK [clickhouse : Set clickhouse_service_enable] **********************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Set clickhouse_service_ensure] **********************************************************************
ok: [clickhouse-01]

TASK [clickhouse : include_tasks] **************************************************************************************
included: /vagrant/ansible-04-playbook/playbook/roles/clickhouse/tasks/install/yum.yml for clickhouse-01

TASK [clickhouse : Install by YUM | Ensure clickhouse repo GPG key imported] *******************************************
ok: [clickhouse-01]

TASK [clickhouse : Install by YUM | Ensure clickhouse repo installed] **************************************************
ok: [clickhouse-01]

TASK [clickhouse : Install by YUM | Ensure clickhouse package installed (latest)] **************************************
ok: [clickhouse-01]

TASK [clickhouse : Install by YUM | Ensure clickhouse package installed (version latest)] ******************************
skipping: [clickhouse-01]

TASK [clickhouse : include_tasks] **************************************************************************************
included: /vagrant/ansible-04-playbook/playbook/roles/clickhouse/tasks/configure/sys.yml for clickhouse-01

TASK [clickhouse : Check clickhouse config, data and logs] *************************************************************
ok: [clickhouse-01] => (item=/var/log/clickhouse-server)
ok: [clickhouse-01] => (item=/etc/clickhouse-server)
ok: [clickhouse-01] => (item=/var/lib/clickhouse/tmp/)
ok: [clickhouse-01] => (item=/var/lib/clickhouse/)

TASK [clickhouse : Config | Create config.d folder] ********************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Config | Create users.d folder] *********************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Config | Generate system config] ********************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Config | Generate users config] *********************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Config | Generate remote_servers config] ************************************************************
skipping: [clickhouse-01]

TASK [clickhouse : Config | Generate macros config] ********************************************************************
skipping: [clickhouse-01]

TASK [clickhouse : Config | Generate zookeeper servers config] *********************************************************
skipping: [clickhouse-01]

TASK [clickhouse : Config | Fix interserver_http_port and intersever_https_port collision] *****************************
skipping: [clickhouse-01]

TASK [clickhouse : Notify Handlers Now] ********************************************************************************

TASK [clickhouse : include_tasks] **************************************************************************************
included: /vagrant/ansible-04-playbook/playbook/roles/clickhouse/tasks/service.yml for clickhouse-01

TASK [clickhouse : Ensure clickhouse-server.service is enabled: True and state: started] *******************************
ok: [clickhouse-01]

TASK [clickhouse : Wait for Clickhouse Server to Become Ready] *********************************************************
ok: [clickhouse-01]

TASK [clickhouse : include_tasks] **************************************************************************************
included: /vagrant/ansible-04-playbook/playbook/roles/clickhouse/tasks/configure/db.yml for clickhouse-01

TASK [clickhouse : Set ClickHose Connection String] ********************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Gather list of existing databases] ******************************************************************
ok: [clickhouse-01]

TASK [clickhouse : Config | Delete database config] ********************************************************************

TASK [clickhouse : Config | Create database config] ********************************************************************

TASK [clickhouse : include_tasks] **************************************************************************************
included: /vagrant/ansible-04-playbook/playbook/roles/clickhouse/tasks/configure/dict.yml for clickhouse-01

TASK [clickhouse : Config | Generate dictionary config] ****************************************************************
skipping: [clickhouse-01]

TASK [clickhouse : include_tasks] **************************************************************************************
skipping: [clickhouse-01]

PLAY [Install Vector] **************************************************************************************************

TASK [vector-role : Create vector work directory] **********************************************************************
ok: [vector-01]

TASK [vector-role : Get Vector distrib] ********************************************************************************
ok: [vector-01]

TASK [vector-role : Unzip Vector archive] ******************************************************************************
ok: [vector-01]

TASK [vector-role : Install Vector binary] *****************************************************************************
ok: [vector-01]

TASK [vector-role : Check Vector installation] *************************************************************************
changed: [vector-01]

TASK [vector-role : Create Vector etc directory] ***********************************************************************
ok: [vector-01]

TASK [vector-role : Create Vector config vector.yaml] ******************************************************************
ok: [vector-01]

TASK [vector-role : Create vector.service daemon] **********************************************************************
changed: [vector-01]

TASK [vector-role : Modify Vector.service file ExecStart] **************************************************************
changed: [vector-01]

TASK [vector-role : Modify Vector.service file ExecStartPre] ***********************************************************
changed: [vector-01]

TASK [vector-role : Create user vector] ********************************************************************************
ok: [vector-01]

TASK [vector-role : Create Vector data_dir] ****************************************************************************
ok: [vector-01]

RUNNING HANDLER [vector-role : Start Vector service] *******************************************************************
changed: [vector-01]

PLAY [Lighthouse] ******************************************************************************************************

TASK [lighthouse-role : Pre-install Nginx & Git client] ****************************************************************
ok: [lighthouse-01]

TASK [lighthouse-role : Clone Lighthouse source code by Git] ***********************************************************
ok: [lighthouse-01]

TASK [lighthouse-role : Prepare nginx config] **************************************************************************
ok: [lighthouse-01]

PLAY RECAP *************************************************************************************************************
clickhouse-01              : ok=24   changed=0    unreachable=0    failed=0    skipped=10   rescued=0    ignored=0
lighthouse-01              : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
vector-01                  : ok=13   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
#### 10. Выложил playbook в репозиторий.

#### 11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

оба репозитория с roles:
https://github.com/inyushov/vector-role
https://github.com/inyushov/lighthouse-role

репозиторий с playbook:
https://github.com/inyushov/devops-netology/tree/main/work/08-ansible-04-role/src/playbook

