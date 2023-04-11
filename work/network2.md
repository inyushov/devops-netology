1.

![image](https://user-images.githubusercontent.com/127683348/231246119-5395c37b-1b28-46b6-9ea6-d8994ab893ee.png)

2.

Протокол LLDP

Пакет lldpd

Команда lldpctl

3.

Технология VLAN

Пакет vlan
Файл конфигурации находиться /etc/network/interfaces
```
auto vlan11
iface vlan11 inet static
address 192.168.1.1
netmask 255.255.255.0
vlan_raw_device eth0
auto eth0.11
iface eth0.11 inet static
address 192.168.1.1
netmask 255.255.255.0
vlan_raw_device eth0
 ```
 либо через netplan
 
 Файл конфигурации находиться /etc/netplan/01-netcfg.yaml
```
vlans:
enp1s0.50:
id: 50
link: enp1s0
addresses: [192.168.100.2/24]
```
 
