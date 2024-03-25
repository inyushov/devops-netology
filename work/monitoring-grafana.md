#### 1.

Запустил связку prometheus-grafana

![image](https://github.com/inyushov/devops-netology/assets/127683348/cf258f95-eb31-4f46-9887-c050ffd4dbe8)

Зашел в веб-интерфейс grafana, подключил поднятый prometheus, скриншот веб-интерфейса grafana со списком подключенных Datasource

![image](https://github.com/inyushov/devops-netology/assets/127683348/cca3f80b-d0a2-425f-871f-0a8f9e9d049e)


#### 2.

утилизация CPU для nodeexporter (в процентах, 100-idle);
```
100 - (avg by (instance) (rate(node_cpu_seconds_total{job="nodeexporter",mode="idle"}[1m])) * 100)
```


![image](https://github.com/inyushov/devops-netology/assets/127683348/362285a3-a55c-487e-8bfc-f8b21c3a981f)
