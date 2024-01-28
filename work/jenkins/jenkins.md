Создал две VM с помощью Terraform.

![image](https://github.com/inyushov/devops-netology/assets/127683348/ed9c15fa-4b6b-409a-9a40-60f43ae8adc7)

Установил Jenkins при помощи playbook.

![image](https://github.com/inyushov/devops-netology/assets/127683348/79a0ab72-dc93-454a-b63f-cb2032681513)

Запустил Jenkins и проверил его работоспособность

![image](https://github.com/inyushov/devops-netology/assets/127683348/5fd4fc51-2f32-4b17-877f-0d35dfe06d83)

Сделал первоначальную настройку. Подключил агент.

![image](https://github.com/inyushov/devops-netology/assets/127683348/6a2eee89-35fb-46cc-84d6-2a8e884945e8)

Создал Freestyle Job, который запускает molecule test из моего репозитория с ролью vector-role но выходит ошибка на шаге molecule test

Started by user admin
Running as SYSTEM
Building remotely on agent (linux ansible) in workspace /opt/jenkins_agent/workspace/freestyle
The recommended git tool is: NONE
using credential a6a2c3ec-844e-4ddb-ae90-0929162393a3
Cloning the remote Git repository
Cloning repository https://github.com/inyushov/vector-role.git
 > git init /opt/jenkins_agent/workspace/freestyle # timeout=10
Fetching upstream changes from https://github.com/inyushov/vector-role.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_SSH to set credentials 
[INFO] Currently running in a labeled security context
[INFO] Currently SELinux is 'enforcing' on the host
 > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/freestyle@tmp/jenkins-gitclient-ssh10000243882455538278.key
Verifying host key using known hosts file
You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
 > git fetch --tags --progress https://github.com/inyushov/vector-role.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/inyushov/vector-role.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 94d950a8a66cd37f7b0fd39c4a734c209129994f (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 94d950a8a66cd37f7b0fd39c4a734c209129994f # timeout=10
Commit message: "Delete 1.md"
 > git rev-list --no-walk 94d950a8a66cd37f7b0fd39c4a734c209129994f # timeout=10
[freestyle] $ /bin/sh -xe /tmp/jenkins2888930472223278145.sh
+ export LC_ALL=en_US.utf8
+ LC_ALL=en_US.utf8
[freestyle] $ /bin/sh -xe /tmp/jenkins728319682137734497.sh
+ git clone https://github.com/inyushov/vector-role.git
Cloning into 'vector-role'...
+ cd vector-role/
+ ls -l
total 48
drwxr-xr-x. 2 root root    22 Jan 28 19:09 defaults
drwxr-xr-x. 2 root root    22 Jan 28 19:09 handlers
drwxr-xr-x. 2 root root    22 Jan 28 19:09 meta
drwxr-xr-x. 4 root root    36 Jan 28 19:09 molecule
-rw-r--r--. 1 root root   484 Jan 28 19:09 README.md
drwxr-xr-x. 2 root root    52 Jan 28 19:09 tasks
drwxr-xr-x. 2 root root    39 Jan 28 19:09 tests
-rw-r--r--. 1 root root   278 Jan 28 19:09 tox.ini
-rw-r--r--. 1 root root 36803 Jan 28 19:09 tox_output.log
-rw-r--r--. 1 root root    91 Jan 28 19:09 tox-requirements.txt
drwxr-xr-x. 2 root root    22 Jan 28 19:09 vars
[freestyle] $ /bin/sh -xe /tmp/jenkins10964512157381068506.sh
+ molecule test
/tmp/jenkins10964512157381068506.sh: line 2: molecule: command not found
Build step 'Execute shell' marked build as failure
Finished: FAILURE



