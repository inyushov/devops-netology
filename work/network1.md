1.

vagrant@vagrant:~$ telnet stackoverflow.com 80

Trying 151.101.129.69...
Connected to stackoverflow.com.
Escape character is '^]'.
GET /questions HTTP/1.0
HOST: stackoverflow.com

HTTP/1.1 403 Forbidden
Connection: close
Content-Length: 1924
Server: Varnish
Retry-After: 0
Content-Type: text/html
Accept-Ranges: bytes
Date: Sun, 09 Apr 2023 17:53:33 GMT
Via: 1.1 varnish
X-Served-By: cache-fra-eddf8230080-FRA
X-Cache: MISS
X-Cache-Hits: 0
X-Timer: S1681062814.616345,VS0,VE1
X-DNS-Prefetch-Control: off
Connection closed by foreign host.

Получен код 403 Forbidden. Данный ответ означает что доступ к запрошенному ресурсу запрещен. Сервер понял запрос, но не выполнит его.

2.

![Screenshot_7](https://user-images.githubusercontent.com/127683348/230790714-4bdf2c3e-2c25-49de-ab74-d724779e4555.jpg)

![Screenshot_8](https://user-images.githubusercontent.com/127683348/230790721-563bfb02-e854-427c-84b6-bbb9471ce7b8.jpg)

В ответ получили код 200 (OK)

Страница полностью загрузилась за 1.62 сек.

Самый долгий запрос это- начальная загрузка страницы 498 ms

3.

![image](https://user-images.githubusercontent.com/127683348/230791313-78caf57d-a505-4dad-ba3f-8997a0880b35.png)

31.173.86.210

4.

Провайдер: PJSC MegaFon

AS25159


vagrant@vagrant:~$ whois 31.173.86.210
% This is the RIPE Database query service.
% The objects are in RPSL format.
%
% The RIPE Database is subject to Terms and Conditions.
% See http://www.ripe.net/db/support/db-terms-conditions.pdf

% Note: this output has been filtered.
%       To receive output for a database update, use the "-B" flag.

% Information related to '31.173.80.0 - 31.173.87.255'

% Abuse contact for '31.173.80.0 - 31.173.87.255' is 'abuse-mailbox@megafon.ru'

inetnum:        31.173.80.0 - 31.173.87.255
descr:          Metropolitan branch of OJSC MegaFon
netname:        MF-STF-CGN-20150729
country:        RU
admin-c:        MA23317-RIPE
tech-c:         MWST-RIPE
mnt-lower:      GDC-TR-CoreIP
mnt-lower:      MEGAFON-AUTO-MNT
mnt-domains:    MEGAFON-DNS-MNT
mnt-domains:    MEGAFON-AUTO-MNT
status:         LIR-PARTITIONED PA
mnt-by:         MEGAFON-RIPE-MNT
created:        2022-07-06T08:30:24Z
last-modified:  2022-07-06T08:30:24Z
source:         RIPE

role:           Mobile
address:        Samara
nic-hdl:        MA23317-RIPE
mnt-by:         GDC-TR-CoreIP
created:        2020-02-05T11:44:29Z
last-modified:  2020-02-05T11:44:29Z
source:         RIPE # Filtered

role:           MegaFon PJSC - GNOC West TRM IP
address:        PJSC "MegaFon"
address:        41, Oruzheyniy lane
address:        Moscow, 127006
abuse-mailbox:  abuse-mailbox@megafon.ru
remarks:        -----------------------------------------------------------
remarks:        Customer Service Center, is available at 24 x 7
remarks:        -----------------------------------------------------------
remarks:        Technical questions: gnocwest_tr@megafon.ru
remarks:        Routing and peering: gnoceast_backbone@megafon.ru
remarks:        -----------------------------------------------------------
remarks:        SPAM and Network security: abuse-mailbox@megafon.ru
remarks:        Please use abuse-mailbox@megafon.ru e-mail address for complaints.
remarks:        All messages to any other our address, relative to SPAM
remarks:        or security issues, will not be concerned.
remarks:        -----------------------------------------------------------
remarks:        Information: http://www.megafon.ru
remarks:        -----------------------------------------------------------
admin-c:        GMV-RIPE
nic-hdl:        MWST-RIPE
mnt-by:         MEGAFON-RIPE-MNT
mnt-by:         MEGAFON-WEST-MNT
created:        2015-02-17T12:00:24Z
last-modified:  2023-02-04T07:47:33Z
source:         RIPE # Filtered

% Information related to '31.173.80.0/21AS25159'

route:          31.173.80.0/21
descr:          MegaFon-Moscow
origin:         AS25159
mnt-by:         MEGAFON-RIPE-MNT
mnt-by:         MEGAFON-AUTO-MNT
mnt-by:         GDC-TR-CoreIP
created:        2015-07-29T07:54:27Z
last-modified:  2021-08-16T12:28:40Z
source:         RIPE

% This query was served by the RIPE Database Query Service version 1.106 (ABERDEEN)

5.

6.

![image](https://user-images.githubusercontent.com/127683348/230792492-1af9c396-8620-46c2-b935-7b8e93fc9be3.png)

Наибольшая задержка на 11 участке.




