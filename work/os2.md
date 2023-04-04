


2. Для просмотра метрик использовал команду curl localhost:9100/metrics

CPU:
    node_cpu_seconds_total{cpu="0",mode="idle"} 
    node_cpu_seconds_total{cpu="0",mode="system"} 
    node_cpu_seconds_total{cpu="0",mode="user"}
    node_cpu_seconds_total{cpu="1",mode="idle"} 
    node_cpu_seconds_total{cpu="1",mode="system"} 
    node_cpu_seconds_total{cpu="1",mode="user"}
    process_cpu_seconds_total

память:
    node_memory_MemAvailable_bytes 
    node_memory_MemFree_bytes

диск:
    node_disk_io_time_seconds_total{device="sda"} 
    node_disk_read_time_seconds_total{device="sda"} 
    node_disk_write_time_seconds_total{device="sda"}

сеть:
    node_network_receive_errs_total{device="eth0"} 
    node_network_receive_bytes_total{device="eth0"} 
    node_network_transmit_bytes_total{device="eth0"}
    node_network_transmit_errs_total{device="eth0"}

4.
![image](https://user-images.githubusercontent.com/127683348/229931620-0d7f6f33-07e0-4847-acde-a8fc54d9f6e6.png)

4.
 ![image](https://user-images.githubusercontent.com/127683348/229934595-fb039c9f-eca1-442e-a8f4-8d9b2750df8c.png)
 
5.
 ![image](https://user-images.githubusercontent.com/127683348/229934860-6e6c8916-b8e2-4c8e-835b-4bbc511c2482.png)


