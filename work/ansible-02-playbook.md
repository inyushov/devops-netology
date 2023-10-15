#### 1. Подготовьте свой inventory-файл prod.yml

![image](https://github.com/inyushov/devops-netology/assets/127683348/671b793d-44c9-427f-98bd-c91e67b20a1e)

#### 5. Запустите ansible-lint site.yml и исправьте ошибки, если они есть

![image](https://github.com/inyushov/devops-netology/assets/127683348/e6e12970-e4b4-463a-a951-82326ef98d72)

#### 6. Попробуйте запустить playbook на этом окружении с флагом --check

![image](https://github.com/inyushov/devops-netology/assets/127683348/0eac6c29-e824-4286-926f-c5a232c065a7)

Возникает ошибка.
В интернете искал, но не нашел четкого описания как решить данную проблему.

TASK [Install clickhouse packages] *****************************************************************************************fatal: [clickhouse]: FAILED! => {"ansible_facts": {"pkg_mgr": "apt"}, "changed": false, "msg": ["Could not detect which major revision of yum is in use, which is required to determine module backend.", "You should manually specify use_backend to tell the module whether to use the yum (yum3) or dnf (yum4) backend})"]}


#### 7. Запустите playbook на prod.yml окружении с флагом --diff. Убедитесь, что изменения на системе произведены

![image](https://github.com/inyushov/devops-netology/assets/127683348/f6006553-0d8c-4533-bfac-82caf84ce9ea)


### Здравствуйте, c yum решил вопрос, ваша рекомендация помогла, но возникли другие ошибки:

#### C clickhouse останавливаюсь на создании базы данных: 

TASK [Create database] ************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:34
skipping: [clickhouse] => {"changed": true, "cmd": ["clickhouse-client", "-q", "create database logs;"], "delta": null, "end": null, "msg": "Command would have run if not in check mode", "rc": 0, "start": null, "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}

#### c Vector останавливаюсь на запуске сервиса:

RUNNING HANDLER [Start Vector service] ********************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:44
fatal: [vector]: FAILED! => {"changed": false, "msg": "Could not find the requested service vector: host"}




#### ansible-playbook -i inventory/prod.yml site.yml --check -vv

PLAYBOOK: site.yml ****************************************************************************************************
2 plays in site.yml

PLAY [Install Clickhouse] *********************************************************************************************

TASK [Gathering Facts] ************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:2
ok: [clickhouse]
META: ran handlers

TASK [Get clickhouse distrib] *****************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:12
ok: [clickhouse] => (item=clickhouse-client) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-client-22.3.8.39.rpm", "elapsed": 20, "gid": 1000, "group": "vagrant", "item": "clickhouse-client", "mode": "0755", "msg": "HTTP Error 304: Not Modified", "owner": "vagrant", "size": 38090, "state": "file", "status_code": 304, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-client-22.3.8.39.x86_64.rpm"}
ok: [clickhouse] => (item=clickhouse-server) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-server-22.3.8.39.rpm", "elapsed": 20, "gid": 1000, "group": "vagrant", "item": "clickhouse-server", "mode": "0755", "msg": "HTTP Error 304: Not Modified", "owner": "vagrant", "size": 61151, "state": "file", "status_code": 304, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-server-22.3.8.39.x86_64.rpm"}
ok: [clickhouse] => (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.8.39.rpm", "elapsed": 20, "gid": 1000, "group": "vagrant", "item": "clickhouse-common-static", "mode": "0755", "msg": "HTTP Error 304: Not Modified", "owner": "vagrant", "size": 246542319, "state": "file", "status_code": 304, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.8.39.x86_64.rpm"}

TASK [Install clickhouse packages] ************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:22
ok: [clickhouse] => {"changed": false, "msg": "", "rc": 0, "results": ["clickhouse-common-static-22.3.8.39-1.x86_64 providing clickhouse-common-static-22.3.8.39.rpm is already installed", "clickhouse-client-22.3.8.39-1.x86_64 providing clickhouse-client-22.3.8.39.rpm is already installed", "clickhouse-server-22.3.8.39-1.x86_64 providing clickhouse-server-22.3.8.39.rpm is already installed"]}

TASK [Flush handlers] *************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:32
META: ran handlers

#### TASK [Create database] ************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:34
skipping: [clickhouse] => {"changed": true, "cmd": ["clickhouse-client", "-q", "create database logs;"], "delta": null, "end": null, "msg": "Command would have run if not in check mode", "rc": 0, "start": null, "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}
META: ran handlers
META: ran handlers

PLAY [Install Vector] *************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:41
ok: [vector]
META: ran handlers

TASK [Get Vector distrib] *********************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:51
ok: [vector] => {"changed": false, "dest": "./vector-0.21.1-1.x86_64.rpm", "elapsed": 30, "gid": 1000, "group": "vagrant", "mode": "0644", "msg": "HTTP Error 304: Not Modified", "owner": "vagrant", "size": 51623439, "state": "file", "status_code": 304, "uid": 1000, "url": "https://packages.timber.io/vector/0.21.1/vector-0.21.1-1.x86_64.rpm"}

TASK [Install Vector packages] ****************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:56
NOTIFIED HANDLER Start Vector service for vector
changed: [vector] => {"changed": true, "changes": {"installed": ["vector-0.21.1-1.x86_64.rpm"]}, "results": []}

TASK [Deploy config Vector] *******************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:63
changed: [vector] => {"changed": true}

#### RUNNING HANDLER [Start Vector service] ********************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:44
fatal: [vector]: FAILED! => {"changed": false, "msg": "Could not find the requested service vector: host"}
META: ran handlers

NO MORE HOSTS LEFT ****************************************************************************************************

PLAY RECAP ************************************************************************************************************
clickhouse                 : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
vector                     : ok=4    changed=2    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

#### ansible-playbook -i inventory/prod.yml site.yml -vv
ansible-playbook [core 2.12.10]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.8.10 (default, May 26 2023, 14:05:08) [GCC 9.4.0]
  jinja version = 2.10.1
  libyaml = True
Using /etc/ansible/ansible.cfg as config file
BECOME password:
[WARNING]: Found both group and host with same name: clickhouse
[WARNING]: Found both group and host with same name: vector
Skipping callback 'default', as we already have a stdout callback.
Skipping callback 'minimal', as we already have a stdout callback.
Skipping callback 'oneline', as we already have a stdout callback.

PLAYBOOK: site.yml ****************************************************************************************************
2 plays in site.yml

PLAY [Install Clickhouse] *********************************************************************************************

TASK [Gathering Facts] ************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:2
ok: [clickhouse]
META: ran handlers

TASK [Get clickhouse distrib] *****************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:12
ok: [clickhouse] => (item=clickhouse-client) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-client-22.3.8.39.rpm", "elapsed": 20, "gid": 1000, "group": "vagrant", "item": "clickhouse-client", "mode": "0755", "msg": "HTTP Error 304: Not Modified", "owner": "vagrant", "size": 38090, "state": "file", "status_code": 304, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-client-22.3.8.39.x86_64.rpm"}
ok: [clickhouse] => (item=clickhouse-server) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-server-22.3.8.39.rpm", "elapsed": 20, "gid": 1000, "group": "vagrant", "item": "clickhouse-server", "mode": "0755", "msg": "HTTP Error 304: Not Modified", "owner": "vagrant", "size": 61151, "state": "file", "status_code": 304, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-server-22.3.8.39.x86_64.rpm"}
ok: [clickhouse] => (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.8.39.rpm", "elapsed": 20, "gid": 1000, "group": "vagrant", "item": "clickhouse-common-static", "mode": "0755", "msg": "HTTP Error 304: Not Modified", "owner": "vagrant", "size": 246542319, "state": "file", "status_code": 304, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.8.39.x86_64.rpm"}

TASK [Install clickhouse packages] ************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:22
ok: [clickhouse] => {"changed": false, "msg": "", "rc": 0, "results": ["clickhouse-common-static-22.3.8.39-1.x86_64 providing clickhouse-common-static-22.3.8.39.rpm is already installed", "clickhouse-client-22.3.8.39-1.x86_64 providing clickhouse-client-22.3.8.39.rpm is already installed", "clickhouse-server-22.3.8.39-1.x86_64 providing clickhouse-server-22.3.8.39.rpm is already installed"]}

TASK [Flush handlers] *************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:32
META: ran handlers

#### TASK [Create database] ************************************************************************************************
task path: /devops-netology/work/ansible8_2/playbook/site.yml:34
fatal: [clickhouse]: FAILED! => {"changed": false, "cmd": ["clickhouse-client", "-q", "create database logs;"], "delta": "0:00:01.219304", "end": "2023-10-15 20:35:46.016747", "failed_when_result": true, "msg": "non-zero return code", "rc": 210, "start": "2023-10-15 20:35:44.797443", "stderr": "Code: 210. DB::NetException: Connection refused (localhost:9000). (NETWORK_ERROR)", "stderr_lines": ["Code: 210. DB::NetException: Connection refused (localhost:9000). (NETWORK_ERROR)"], "stdout": "", "stdout_lines": []}

PLAY RECAP ************************************************************************************************************
clickhouse                 : ok=3    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0


