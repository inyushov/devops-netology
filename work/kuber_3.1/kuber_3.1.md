#### 1. Необходимо определить требуемые ресурсы

Известно, что проекту нужны база данных, система кеширования, а само приложение состоит из бекенда и фронтенда. Опишите, какие ресурсы нужны, если известно:

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения. 
2. База данных должна быть отказоустойчивой. Потребляет 4 ГБ ОЗУ в работе, 1 ядро. 3 копии. 
3. Кеш должен быть отказоустойчивый. Потребляет 4 ГБ ОЗУ в работе, 1 ядро. 3 копии. 
4. Фронтенд обрабатывает внешние запросы быстро, отдавая статику. Потребляет не более 50 МБ ОЗУ на каждый экземпляр, 0.2 ядра. 5 копий. 
5. Бекенд потребляет 600 МБ ОЗУ и по 1 ядру на копию. 10 копий.

 #### Посчитаем необходимые ресурсы для запуска нод:
 
 Руководствуясь условиями задачи в условиях отказоустойчивости будем брать 3 Worker Node и 3 Control Node, в минимальной конфигурации 2 Ядра, 2 ОЗУ.

 ##### Всего: 6 ГБ ОЗУ и 6 ядер


 #### Посчитаем необходимые ресурсы для проекта:

 БД: 4 ГБ ОЗУ * 3 и 1 ядро * 3          = Итого: 12 ГБ ОЗУ и 3 ядра
 
 Кеш: 4 ГБ ОЗУ * 3 и 1 ядро * 3         = Итого: 12 ГБ ОЗУ и 3 ядра
 
 Фронтенд: 50 МБ ОЗУ * 5 и 0.2 ядра * 5 = Итого: 250 МБ ОЗУ и 1 ядро
 
 Бекенд: 600 МБ ОЗУ * 10 и 1 * 10       = Итого: 6 ГБ ОЗУ и 10 ядер
 
 ##### Всего: 30.250 ГБ ОЗУ и 17 ядер


 #### Предложу добавить запас 30% к необходимым ресурсам для проекта:

 ##### Всего: Округлим до 40 ГБ ОЗУ и 22 ядра
 

 ### ИТОГО: На данный проект понадобится не менее 46 ГБ ОЗУ и 28 ядер


 

 
