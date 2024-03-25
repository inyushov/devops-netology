#### 1.

Используя директорию help внутри этого домашнего задания, запустил связку prometheus-grafana.

![image](https://github.com/inyushov/devops-netology/assets/127683348/cf258f95-eb31-4f46-9887-c050ffd4dbe8)

Зашел в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
Подключил поднятый мною prometheus, как источник данных.

![image](https://github.com/inyushov/devops-netology/assets/127683348/cca3f80b-d0a2-425f-871f-0a8f9e9d049e)


#### 2.

Создал Dashboard и в ней создал Panels

Утилизация CPU для nodeexporter (в процентах, 100-idle);
```
100 - (avg by (instance) (rate(node_cpu_seconds_total{job="nodeexporter",mode="idle"}[1m])) * 100)
```

CPULA 1/5/15;
```
avg by (instance)(rate(node_load1{}[1m]))
avg by (instance)(rate(node_load5{}[1m]))
avg by (instance)(rate(node_load15{}[1m]))
```
Количество свободной оперативной памяти;
```
avg(node_memory_MemFree_bytes{instance="nodeexporter:9100",job="nodeexporter"})
```

Количество места на файловой системе.
```
avg(node_filesystem_avail_bytes{instance="nodeexporter:9100",job="nodeexporter"})
```
![image](https://github.com/inyushov/devops-netology/assets/127683348/f86efd85-0631-402f-bf25-af5682151fec)

#### 3.

Создал для каждой Dashboard подходящее правило alert

![image](https://github.com/inyushov/devops-netology/assets/127683348/b0c2e3bf-bff2-47af-8c21-bdc415f593f4)

#### 4.

Листинг файла

https://github.com/inyushov/devops-netology/blob/main/work/monitoring-grafana/dashboard_exp.json



