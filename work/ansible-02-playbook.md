#### Подготовил хост через Terraform

![image](https://github.com/inyushov/devops-netology/assets/127683348/0d4ede37-b9e2-448f-808a-81780d42b48c)

![image](https://github.com/inyushov/devops-netology/assets/127683348/93f5acf0-dba0-4e5d-a64c-f9d816cbf769)


#### 1. Подготовил свой inventory-файл prod.yml

![image](https://github.com/inyushov/devops-netology/assets/127683348/76421b96-4587-4b45-a0f2-40c2199784b2)

#### 2. Дописал playbook:

В site.yml добавил блок task с tags: vector, который устанавливает и настраивает Vector

#### 3,4. При создании tasks использовал модули:

get_url, yum, meta, pause, command, file, unarchive, copy, replace, user, service, systemd

#### 5. Запустил ansible-lint site.yml

![image](https://github.com/inyushov/devops-netology/assets/127683348/9c9b4896-613d-4c78-9659-2da15be3ec20)

#### 6. Запустил playbook на этом окружении с флагом --check

```
root@server1:/vagrant/08-ansible-02-playbook/playbook# ansible-playbook -i inventory/prod.yml site.yml --check

PLAY [Install Clickhouse & Vector] *************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [clickhouse-01]

TASK [Get clickhouse distrib] ******************************************************************************************
changed: [clickhouse-01] => (item=clickhouse-client)
changed: [clickhouse-01] => (item=clickhouse-server)
failed: [clickhouse-01] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "item": "clickhouse-common-static", "msg": "Request failed", "response": "HTTP Error 404: Not Found", "status_code": 404, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ******************************************************************************************
changed: [clickhouse-01] => (item=clickhouse-client)
changed: [clickhouse-01] => (item=clickhouse-server)
changed: [clickhouse-01] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *************************************************************************************
fatal: [clickhouse-01]: FAILED! => {"changed": false, "msg": "No RPM file matching 'clickhouse-common-static-22.3.3.44.rpm' found on system", "rc": 127, "results": ["No RPM file matching 'clickhouse-common-static-22.3.3.44.rpm' found on system"]}

PLAY RECAP *************************************************************************************************************
clickhouse-01              : ok=2    changed=1    unreachable=0    failed=1    skipped=0    rescued=1    ignored=0
```

#### 7. Запустил playbook на prod.yml окружении с флагом --diff. Убедился, что изменения на системе произведены

```
root@server1:/vagrant/08-ansible-02-playbook/playbook# ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [Install Clickhouse & Vector] *************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [clickhouse-01]

TASK [Get clickhouse distrib] ******************************************************************************************
changed: [clickhouse-01] => (item=clickhouse-client)
changed: [clickhouse-01] => (item=clickhouse-server)
failed: [clickhouse-01] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "item": "clickhouse-common-static", "msg": "Request failed", "response": "HTTP Error 404: Not Found", "status_code": 404, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ******************************************************************************************
changed: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
ok: [clickhouse-01] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *************************************************************************************
changed: [clickhouse-01]

TASK [Flush handlers] **************************************************************************************************

RUNNING HANDLER [Start clickhouse service] *****************************************************************************
changed: [clickhouse-01]

TASK [Wait for clickhouse-server to become available] ******************************************************************
Pausing for 15 seconds (output is hidden)
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
ok: [clickhouse-01]

TASK [Create database] *************************************************************************************************
changed: [clickhouse-01]

TASK [Create vector work directory] ************************************************************************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0775",
+    "mode": "0755",
     "path": "/home/centos/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [clickhouse-01]

TASK [Get Vector distrib] **********************************************************************************************
changed: [clickhouse-01]

TASK [Unzip Vector archive] ********************************************************************************************
changed: [clickhouse-01]

TASK [Install Vector binary] *******************************************************************************************
changed: [clickhouse-01]

TASK [Check Vector installation] ***************************************************************************************
changed: [clickhouse-01]

TASK [Create Vector config vector.toml] ********************************************************************************
changed: [clickhouse-01]

TASK [Create vector.service daemon] ************************************************************************************
changed: [clickhouse-01]

TASK [Modify vector.service file] **************************************************************************************
--- before: /lib/systemd/system/vector.service
+++ after: /lib/systemd/system/vector.service
@@ -8,7 +8,7 @@
 User=vector
 Group=vector
 ExecStartPre=/usr/bin/vector validate
-ExecStart=/usr/bin/vector
+ExecStart=/usr/bin/vector --config /etc/vector/vector.toml
 ExecReload=/usr/bin/vector validate
 ExecReload=/bin/kill -HUP $MAINPID
 Restart=no

changed: [clickhouse-01]

TASK [Create user vector] **********************************************************************************************
changed: [clickhouse-01]

TASK [Create Vector data_dir] ******************************************************************************************
--- before
+++ after
@@ -1,6 +1,6 @@
 {
-    "group": 0,
-    "owner": 0,
+    "group": 1001,
+    "owner": 1001,
     "path": "/var/lib/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [clickhouse-01]

RUNNING HANDLER [Start Vector service] *********************************************************************************
changed: [clickhouse-01]

PLAY RECAP *************************************************************************************************************
clickhouse-01              : ok=17   changed=15   unreachable=0    failed=0    skipped=0    rescued=1    ignored=0
```

#### Проверил изменения на хосте clickhouse-01 "51.250.67.176"

```
root@server1:/vagrant/08-ansible-02-playbook/playbook# ssh centos@51.250.67.176
[centos@fhmda17ba8k3391ovmtl ~]$ ip -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             10.0.1.11/24 fe80::d20d:d5ff:fe04:eb52/64
[centos@fhmda17ba8k3391ovmtl ~]$ id vector
uid=1001(vector) gid=1001(vector) groups=1001(vector)
[centos@fhmda17ba8k3391ovmtl ~]$ vector --version
vector 0.21.1 (x86_64-unknown-linux-gnu 18787c0 2022-04-22)
[centos@fhmda17ba8k3391ovmtl ~]$ systemctl status clickhouse-server
● clickhouse-server.service - ClickHouse Server (analytic DBMS for big data)
   Loaded: loaded (/usr/lib/systemd/system/clickhouse-server.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2024-01-29 18:32:19 UTC; 7min ago
 Main PID: 8867 (clckhouse-watch)
   CGroup: /system.slice/clickhouse-server.service
           ├─8867 clickhouse-watchdog --config=/etc/clickhouse-server/config.xml --pid-file=/run/clickhouse-server/cl...           └─8869 /usr/bin/clickhouse-server --config=/etc/clickhouse-server/config.xml --pid-file=/run/clickhouse-se...
Jan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal systemd[1]: Started ClickHouse Server (analytic DBMS for big data).
Jan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal clickhouse-server[8867]: Processing configuration file '/etc/cli...'.Jan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal clickhouse-server[8867]: Logging trace to /var/log/clickhouse-se...ogJan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal clickhouse-server[8867]: Logging errors to /var/log/clickhouse-s...ogJan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal clickhouse-server[8867]: Processing configuration file '/etc/cli...'.Jan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal clickhouse-server[8867]: Saved preprocessed configuration to '/v...'.Jan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal clickhouse-server[8867]: Processing configuration file '/etc/cli...'.Jan 29 18:32:19 fhmda17ba8k3391ovmtl.auto.internal clickhouse-server[8867]: Saved preprocessed configuration to '/v...'.Hint: Some lines were ellipsized, use -l to show in full.
[centos@fhmda17ba8k3391ovmtl ~]$ clickhouse-client
ClickHouse client version 22.3.3.44 (official build).
Connecting to localhost:9000 as user default.
Connected to ClickHouse server version 22.3.3 revision 54455.

fhmda17ba8k3391ovmtl.auto.internal :) SHOW DATABASES;

SHOW DATABASES

Query id: a99bfbbe-603b-487d-8e67-e0dd0febea14

┌─name───────────────┐
│ INFORMATION_SCHEMA │
│ default            │
│ information_schema │
│ logs               │
│ system             │
└────────────────────┘

5 rows in set. Elapsed: 0.002 sec.

fhmda17ba8k3391ovmtl.auto.internal :) q
Bye.
[centos@fhmda17ba8k3391ovmtl ~]$ exit
logout
Connection to 51.250.67.176 closed.
```

#### 8. Повторно запустил playbook с флагом --diff и убедился, что playbook идемпотентен.

```
root@server1:/vagrant/08-ansible-02-playbook/playbook# ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [Install Clickhouse & Vector] *************************************************************************************
TASK [Gathering Facts] *************************************************************************************************ok: [clickhouse-01]

TASK [Get clickhouse distrib] ******************************************************************************************ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
failed: [clickhouse-01] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "gid": 1000, "group": "centos", "item": "clickhouse-common-static", "mode": "0644", "msg": "Request failed", "owner": "centos", "response": "HTTP Error 404: Not Found", "secontext": "unconfined_u:object_r:user_home_t:s0", "size": 246310036, "state": "file", "status_code": 404, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ******************************************************************************************ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
ok: [clickhouse-01] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *************************************************************************************ok: [clickhouse-01]

TASK [Flush handlers] **************************************************************************************************
TASK [Wait for clickhouse-server to become available] ******************************************************************Pausing for 15 seconds (output is hidden)
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
ok: [clickhouse-01]

TASK [Create database] *************************************************************************************************ok: [clickhouse-01]

TASK [Create vector work directory] ************************************************************************************ok: [clickhouse-01]

TASK [Get Vector distrib] **********************************************************************************************ok: [clickhouse-01]

TASK [Unzip Vector archive] ********************************************************************************************ok: [clickhouse-01]

TASK [Install Vector binary] *******************************************************************************************ok: [clickhouse-01]

TASK [Check Vector installation] ***************************************************************************************changed: [clickhouse-01]

TASK [Create Vector config vector.toml] ********************************************************************************ok: [clickhouse-01]

TASK [Create vector.service daemon] ************************************************************************************changed: [clickhouse-01]

TASK [Modify vector.service file] **************************************************************************************--- before: /lib/systemd/system/vector.service
+++ after: /lib/systemd/system/vector.service
@@ -8,7 +8,7 @@
 User=vector
 Group=vector
 ExecStartPre=/usr/bin/vector validate
-ExecStart=/usr/bin/vector
+ExecStart=/usr/bin/vector --config /etc/vector/vector.toml
 ExecReload=/usr/bin/vector validate
 ExecReload=/bin/kill -HUP $MAINPID
 Restart=no

changed: [clickhouse-01]

TASK [Create user vector] **********************************************************************************************ok: [clickhouse-01]

TASK [Create Vector data_dir] ******************************************************************************************ok: [clickhouse-01]

RUNNING HANDLER [Start Vector service] *********************************************************************************changed: [clickhouse-01]

PLAY RECAP *************************************************************************************************************
clickhouse-01              : ok=16   changed=4    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0
```
