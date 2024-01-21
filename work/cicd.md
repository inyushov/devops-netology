Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

Open -> On reproduce.
On reproduce -> Open, Done reproduce.
Done reproduce -> On fix.
On fix -> On reproduce, Done fix.
Done fix -> On test.
On test -> On fix, Done.
Done -> Closed, Open.

![image](https://github.com/inyushov/devops-netology/assets/127683348/fa4fb33f-321e-44f3-b0a1-9fa5dab06a24)

Остальные задачи должны проходить по упрощённому workflow:

Open -> On develop.
On develop -> Open, Done develop.
Done develop -> On test.
On test -> On develop, Done.
Done -> Closed, Open.

![image](https://github.com/inyushov/devops-netology/assets/127683348/896a4dd0-d94b-4cb0-a3c1-c68dd16e2576)

![image](https://github.com/inyushov/devops-netology/assets/127683348/f1232d1b-7867-4834-9747-fa02133ecb8c)

![image](https://github.com/inyushov/devops-netology/assets/127683348/60336a09-469b-4100-837c-bbb6c1063244)

![image](https://github.com/inyushov/devops-netology/assets/127683348/7c9fe06f-6674-4de8-9de5-de74566f010f)



