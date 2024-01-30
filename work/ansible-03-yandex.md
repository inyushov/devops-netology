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












