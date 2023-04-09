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





