1. Установите Ansible версии 2.10 или выше.

![image](https://github.com/inyushov/devops-netology/assets/127683348/c7db985c-7b75-4997-a1f8-64f3eb6c10a0)

2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте Playbook из репозитория с домашним заданием и перенесите его в свой репозиторий.

https://github.com/inyushov/devops-netology/tree/main/work/playbook

### Основная часть

#### 1. Попробуйте запустить playbook на окружении из test.yml, зафиксируйте значение, которое имеет факт some_fact для указанного хоста при выполнении playbook.

![image](https://github.com/inyushov/devops-netology/assets/127683348/af14802a-4aab-48f3-abfd-513b8687c607)

#### 2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на all default fact.

![image](https://github.com/inyushov/devops-netology/assets/127683348/8070f327-8ee8-4375-a2fc-61dce0c245e9)


#### 3. Воспользуйтесь подготовленным (используется docker) или создайте собственное окружение для проведения дальнейших испытаний.

![image](https://github.com/inyushov/devops-netology/assets/127683348/22aa4cc1-5d18-4b48-bf81-58d66dcd3720)

#### 4. Проведите запуск playbook на окружении из prod.yml. Зафиксируйте полученные значения some_fact для каждого из managed host.

![image](https://github.com/inyushov/devops-netology/assets/127683348/c59bc656-fc42-41fc-8fdb-41da1bdec230)

Значение some_fact для контейнера centos7: el

Значение some_fact для контейнера ubuntu: deb

#### 5. Добавьте факты в group_vars каждой из групп хостов так, чтобы для some_fact получились значения: для deb — deb default fact, для el — el default fact.

Редактируем файлы:
group_vars/el/examp.yml:

  some_fact: "el default fact"

Редактируем файлы:
group_vars/deb/examp.yml:

  some_fact: "deb default fact"

![image](https://github.com/inyushov/devops-netology/assets/127683348/c828f6e4-d672-4b9a-8a1b-282045363dd4)

#### 6. Повторите запуск playbook на окружении prod.yml. Убедитесь, что выдаются корректные значения для всех хостов.

![image](https://github.com/inyushov/devops-netology/assets/127683348/2848f15e-2fec-4223-b5a0-7f559866c7d4)

#### 7. При помощи ansible-vault зашифруйте факты в group_vars/deb и group_vars/el с паролем netology.

![image](https://github.com/inyushov/devops-netology/assets/127683348/56a89340-5ff6-49a7-98e4-775f48b94a4b)

#### 8 Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь в работоспособности.

![image](https://github.com/inyushov/devops-netology/assets/127683348/64156392-fda8-4320-ac6c-fb13406b1490)

#### 9. Посмотрите при помощи ansible-doc список плагинов для подключения. Выберите подходящий для работы на control node.

![image](https://github.com/inyushov/devops-netology/assets/127683348/6de9af32-8a22-4e30-96bb-8b8a89867c23)

Выбрал плагин local

![image](https://github.com/inyushov/devops-netology/assets/127683348/62fd7fa0-acbb-4a5a-8755-c1c7c2389ef2)

#### 10. В prod.yml добавьте новую группу хостов с именем local, в ней разместите localhost с необходимым типом подключения.

![image](https://github.com/inyushov/devops-netology/assets/127683348/028754cf-ee99-4c63-9418-08ed320cb24f)

#### 11. Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь, что факты some_fact для каждого из хостов определены из верных group_vars.

![image](https://github.com/inyushov/devops-netology/assets/127683348/0f6d5e57-969c-445c-80b4-e15c7f894a1c)

#### 12. Заполните README.md ответами на вопросы. Сделайте git push в ветку master. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым playbook и заполненным README.md.


















