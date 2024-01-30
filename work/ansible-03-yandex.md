#### 1. Дописал playbook: в site.yml добавил ещё один play с tags=lighthouse, который устанавливает и настраивает LightHouse.

#### 2. При создании tasks использовал модули: get_url, template, yum, apt.

#### 3. Выполнил.

#### 4. Подготовил свой inventory-файл prod.yml.

#### 5 .Запустил ansible-lint site.yml.

![image](https://github.com/inyushov/devops-netology/assets/127683348/f33547e0-05ea-4f34-8336-157570c110cb)

[204] Lines should be no longer than 160 chars
site.yml:67

Ошибка говорит нам, что слишком длинная строчка используется в команде. На текущий момент оставлю ее без изменения.

#### 6. Запустил playbook на этом окружении с флагом --check.

![image](https://github.com/inyushov/devops-netology/assets/127683348/4eba73e9-d2c5-47d9-8acc-9325e253ecf7)

Проверка останавливается на этапе установки пакетов Clickhouse, так как они не скачаны в систему.

#### 7. Запустил playbook на prod.yml окружении с флагом --diff

```
root@server1:/vagrant/08-ansible-02-playbook/playbook# ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [Install Clickhouse] **********************************************************************************************

TASK [Get clickhouse distrib] ******************************************************************************************
ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
failed: [clickhouse-01] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "gid": 1000, "group": "centos", "item": "clickhouse-common-static", "mode": "0644", "msg": "Request failed", "owner": "centos", "response": "HTTP Error 404: Not Found", "secontext": "unconfined_u:object_r:user_home_t:s0", "size": 246310036, "state": "file", "status_code": 404, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ******************************************************************************************
ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
ok: [clickhouse-01] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *************************************************************************************
ok: [clickhouse-01]

TASK [Modify Clickhouse config.xml] ************************************************************************************
ok: [clickhouse-01]

TASK [Flush handlers] **************************************************************************************************

TASK [Wait for clickhouse-server to become available] ******************************************************************
Pausing for 30 seconds (output is hidden)
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
ok: [clickhouse-01]

TASK [Create database] *************************************************************************************************
ok: [clickhouse-01]

TASK [Create Clickhouse table] *****************************************************************************************
ok: [clickhouse-01]

PLAY [Vector] **********************************************************************************************************

TASK [Create vector work directory] ************************************************************************************
ok: [vector-01]

TASK [Get Vector distrib] **********************************************************************************************
ok: [vector-01]

TASK [Unzip Vector archive] ********************************************************************************************
ok: [vector-01]

TASK [Install Vector binary] *******************************************************************************************
ok: [vector-01]

TASK [Check Vector installation] ***************************************************************************************
changed: [vector-01]

TASK [Create Vector etc directory] *************************************************************************************
ok: [vector-01]

TASK [Create Vector config vector.yaml] ********************************************************************************
ok: [vector-01]

TASK [Create vector.service daemon] ************************************************************************************
changed: [vector-01]

TASK [Modify Vector.service file ExecStart] ****************************************************************************
--- before: /lib/systemd/system/vector.service
+++ after: /lib/systemd/system/vector.service
@@ -7,7 +7,7 @@
 [Service]
 User=vector
 Group=vector
-ExecStartPre=/usr/bin/vector validate
+ExecStartPre=/usr/bin/vector validate --config-yaml /etc/vector/vector.yaml
 ExecStart=/usr/bin/vector
 ExecReload=/usr/bin/vector validate
 ExecReload=/bin/kill -HUP $MAINPID

changed: [vector-01]

TASK [Modify Vector.service file ExecStartPre] *************************************************************************
--- before: /lib/systemd/system/vector.service
+++ after: /lib/systemd/system/vector.service
@@ -8,7 +8,7 @@
 User=vector
 Group=vector
 ExecStartPre=/usr/bin/vector validate --config-yaml /etc/vector/vector.yaml
-ExecStart=/usr/bin/vector
+ExecStart=/usr/bin/vector --config-yaml /etc/vector/vector.yaml
 ExecReload=/usr/bin/vector validate
 ExecReload=/bin/kill -HUP $MAINPID
 Restart=no

changed: [vector-01]

TASK [Create user vector] **********************************************************************************************
ok: [vector-01]

TASK [Create Vector data_dir] ******************************************************************************************
ok: [vector-01]

RUNNING HANDLER [Start Vector service] *********************************************************************************
changed: [vector-01]

PLAY [Lighthouse] ******************************************************************************************************

TASK [Pre-install Nginx & Git client] **********************************************************************************
changed: [lighthouse-01]

TASK [Clone Lighthouse source code by Git] *****************************************************************************
>> Newly checked out d701335c25cd1bb9b5155711190bad8ab852c2ce
changed: [lighthouse-01]

TASK [Prepare nginx config] ********************************************************************************************
--- before
+++ after: /root/.ansible/tmp/ansible-local-1900796qexj7vgq/tmp79nnos1e/lighthouse.conf.j2
@@ -0,0 +1,12 @@
+server {
+    listen 8080;
+    server_name 0.0.0.0;
+
+    access_log /var/log/nginx/lighthouse-access.log;
+
+    location / {
+        root /home/user/lighthouse/;
+        index index.html;
+
+    }
+}
\ No newline at end of file

changed: [lighthouse-01]

RUNNING HANDLER [Start Lighthouse service] *****************************************************************************
changed: [lighthouse-01]

PLAY RECAP *************************************************************************************************************
clickhouse-01              : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0
lighthouse-01              : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
vector-01                  : ok=13   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```








