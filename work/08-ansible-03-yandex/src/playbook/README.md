# Install:
* Clickhouse
* Vector
* Lighthouse
* Nginx

## Что делает playbook:

site.yml содержит 3 play.  Каждый Play содержит в себе task'и по установке Clickhouse, Vector и Lighthouse соответственно. Каждый play можно выполнить отдельно, используя тэги: clickhouse, vector и lighthouse.

## Параметры

Плейбук использует 4 файла с переменными: 3 файла для каждой из групп хостов индивидуально:

clickhouse_vars.yml
vector_vars.yml
lighthouse_vars.yml

и один файл, применяемый для всез групп хостов:

all_vars.yml

Для конфигурации Vector и Nginx используются шаблоны конфигов:

vector.yaml.j2
lighthouse.conf.j2

## Теги
- lighthouse
- clickhouse
- vector

## Запуск

- Для запуска playbook нужно выполнить команду
```ansible-playbook -i inventory/prod.yml site.yml```, где ```inventory/prod.yml``` - путь к Inventory файлу, ```site.yml``` - файл playbook. 
