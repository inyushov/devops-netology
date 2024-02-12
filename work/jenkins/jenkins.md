#### Создал две VM с помощью Terraform.

![image](https://github.com/inyushov/devops-netology/assets/127683348/5704cb5d-e841-4c83-9b8c-cbd5ec88ec3f)

#### Установил Jenkins при помощи playbook.

![image](https://github.com/inyushov/devops-netology/assets/127683348/79a0ab72-dc93-454a-b63f-cb2032681513)

#### Сделал первоначальную настройку. Подключил агент.

![image](https://github.com/inyushov/devops-netology/assets/127683348/1e13e543-427e-4e4c-baa1-68f50b5071e7)


#### 1. Создал Freestyle Job, но сборка завершается с ошибкой

![image](https://github.com/inyushov/devops-netology/assets/127683348/321a3d49-6d46-48c1-9b71-18785847254e)

```
Started by user admin
Running as SYSTEM
Building remotely on agent (ansible) in workspace /opt/jenkins_agent/workspace/freestyle
The recommended git tool is: NONE
using credential 3d49eb96-80f2-4779-85a4-915edb4bbfc6
 > git rev-parse --resolve-git-dir /opt/jenkins_agent/workspace/freestyle/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/inyushov/vector-role.git # timeout=10
Fetching upstream changes from https://github.com/inyushov/vector-role.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_ASKPASS to set credentials 
 > git fetch --tags --progress https://github.com/inyushov/vector-role.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 481e333924e2e808a4497a9108dfa03f24971b8a (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 481e333924e2e808a4497a9108dfa03f24971b8a # timeout=10
Commit message: "Update main.yml"
 > git rev-list --no-walk 481e333924e2e808a4497a9108dfa03f24971b8a # timeout=10
[freestyle] $ /bin/sh -xe /tmp/jenkins9193507102659184183.sh
+ molecule test
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Guessed /opt/jenkins_agent/workspace/freestyle as project root directory
INFO     Using /home/jenkins/.cache/ansible-lint/e90229/roles/glennbell.linux_administration symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/home/jenkins/.cache/ansible-lint/e90229/roles
INFO     Running default > dependency
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
WARNING  Skipping, missing the requirements file.
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'
/usr/local/lib/python3.6/site-packages/paramiko/transport.py:33: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.hazmat.backends import default_backend
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /opt/jenkins_agent/workspace/freestyle/molecule/default/converge.yml
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
INFO     Running default > create
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/quay.io/centos/centos:stream8)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '391917310007.32371', 'results_file': '/home/jenkins/.ansible_async/391917310007.32371', 'changed': True, 'failed': False, 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
ok: [instance]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Create vector work directory] ******************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
changed: [instance]

TASK [vector-role : Get Vector distrib] ****************************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
changed: [instance]

TASK [vector-role : Unzip Vector archive] **************************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
changed: [instance]

TASK [vector-role : Install Vector binary] *************************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
fatal: [instance]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: sudo: command not found\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}

PLAY RECAP *********************************************************************
instance                   : ok=4    changed=3    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/home/jenkins/.cache/molecule/freestyle/default/inventory', '--skip-tags', 'molecule-notest,notest', '/opt/jenkins_agent/workspace/freestyle/molecule/default/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
Build step 'Execute shell' marked build as failure
Finished: FAILURE
```



#### 2. Сделал Declarative Pipeline Job, так же завершается ошибкой.

![image](https://github.com/inyushov/devops-netology/assets/127683348/e37f0f8e-741f-4c16-a299-31338ddb581d)

![image](https://github.com/inyushov/devops-netology/assets/127683348/e0af778c-8f5c-4d43-be64-8cae1eee74df)

```
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on agent in /opt/jenkins_agent/workspace/declarative pipeline
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clear work dir)
[Pipeline] deleteDir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clone git repo)
[Pipeline] dir
Running in /opt/jenkins_agent/workspace/declarative pipeline/vector-role
[Pipeline] {
[Pipeline] git
The recommended git tool is: NONE
No credentials specified
Cloning the remote Git repository
Cloning repository https://github.com/inyushov/vector-role.git
 > git init /opt/jenkins_agent/workspace/declarative pipeline/vector-role # timeout=10
Fetching upstream changes from https://github.com/inyushov/vector-role.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
 > git fetch --tags --progress https://github.com/inyushov/vector-role.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/inyushov/vector-role.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
Checking out Revision 481e333924e2e808a4497a9108dfa03f24971b8a (refs/remotes/origin/main)
Commit message: "Update main.yml"
First time build. Skipping changelog.
[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Molecule test)
[Pipeline] dir
Running in /opt/jenkins_agent/workspace/declarative pipeline/vector-role
[Pipeline] {
[Pipeline] sh
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 481e333924e2e808a4497a9108dfa03f24971b8a # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b main 481e333924e2e808a4497a9108dfa03f24971b8a # timeout=10
+ molecule test
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Guessed /opt/jenkins_agent/workspace/declarative pipeline/vector-role as project root directory
INFO     Using /home/jenkins/.cache/ansible-lint/3edc82/roles/glennbell.linux_administration symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/home/jenkins/.cache/ansible-lint/3edc82/roles
INFO     Running default > dependency
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
WARNING  Skipping, missing the requirements file.
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'
/usr/local/lib/python3.6/site-packages/paramiko/transport.py:33: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.hazmat.backends import default_backend
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /opt/jenkins_agent/workspace/declarative pipeline/vector-role/molecule/default/converge.yml
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
INFO     Running default > create
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/quay.io/centos/centos:stream8)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '521310179760.30944', 'results_file': '/home/jenkins/.ansible_async/521310179760.30944', 'changed': True, 'failed': False, 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
ok: [instance]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Create vector work directory] ******************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
changed: [instance]

TASK [vector-role : Get Vector distrib] ****************************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
changed: [instance]

TASK [vector-role : Unzip Vector archive] **************************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
changed: [instance]

TASK [vector-role : Install Vector binary] *************************************
[WARNING]: Collection community.docker does not support Ansible version 2.10.17
fatal: [instance]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: sudo: command not found\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}

PLAY RECAP *********************************************************************
instance                   : ok=4    changed=3    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/home/jenkins/.cache/molecule/vector-role/default/inventory', '--skip-tags', 'molecule-notest,notest', '/opt/jenkins_agent/workspace/declarative pipeline/vector-role/molecule/default/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Collection community.docker does not support Ansible version 2.10.17

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: script returned exit code 1
Finished: FAILURE
```

#### После установки Python 3.9 и переключение по умолчанию на версию python3.9 не проходит даже molecule --version ошибка, соответственно если переключаюсь обратно на python3.6 то все ок!
```
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ molecule --version
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
/usr/local/lib/python3.6/site-packages/requests/__init__.py:104: RequestsDependencyWarning: urllib3 (1.26.18) or chardet (5.0.0)/charset_normalizer (2.0.12) doesn't match a supported version!
  RequestsDependencyWarning)
molecule 3.6.1 using python 3.6
    ansible:2.10.17
    delegated:3.6.1 from molecule
    docker:1.1.0 from molecule_docker requiring collections: community.docker>=1.9.1
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ which python3
/usr/bin/python3
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ which python3.6
/usr/bin/python3.6
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ which python3.9
/usr/local/bin/python3.9
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ cat /usr/local/bin/molecule
#!/usr/bin/python3
# -*- coding: utf-8 -*-
import re
import sys
from molecule.__main__ import main
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(main())
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.9 1
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ sudo update-alternatives --config python3

There are 2 programs which provide 'python3'.

  Selection    Command
-----------------------------------------------
   1           /usr/local/bin/python3.9
*+ 2           /usr/bin/python3.6

Enter to keep the current selection[+], or type selection number: 1
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ molecule --version
Traceback (most recent call last):
  File "/usr/local/bin/molecule", line 5, in <module>
    from molecule.__main__ import main
ModuleNotFoundError: No module named 'molecule'
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ sudo update-alternatives --config python3

There are 2 programs which provide 'python3'.

  Selection    Command
-----------------------------------------------
 + 1           /usr/local/bin/python3.9
*  2           /usr/bin/python3.6

Enter to keep the current selection[+], or type selection number: 2
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$ molecule --version
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
/usr/local/lib/python3.6/site-packages/requests/__init__.py:104: RequestsDependencyWarning: urllib3 (1.26.18) or chardet (5.0.0)/charset_normalizer (2.0.12) doesn't match a supported version!
  RequestsDependencyWarning)
molecule 3.6.1 using python 3.6
    ansible:2.10.17
    delegated:3.6.1 from molecule
    docker:1.1.0 from molecule_docker requiring collections: community.docker>=1.9.1
[centos@fhm0isvj571ijv5hc9fp Python-3.9.6]$

### Решил не останавливаться и продолжить выполения заданий, так как уже много времени потерял устраняя данную ошибку.

```
#### 3. Перенес Declarative Pipeline в репозиторий в файл Jenkinsfile https://github.com/inyushov/vector-role/blob/main/Jenkinsfile

#### 4. Создал Multibranch Pipeline на запуск Jenkinsfile из репозитория.

Результат сканирования:

![image](https://github.com/inyushov/devops-netology/assets/127683348/575198e7-aad8-439b-a3c2-237d0484292d)

После запуска сборка Multibranch Pipeline выполняется с ошибкой, так как все идет с первого задания.

![image](https://github.com/inyushov/devops-netology/assets/127683348/cee5f0d6-da20-4bae-b240-aaa1d5d8c7de)

#### 5. Создал Scripted Pipeline, наполнить его скриптом из pipeline https://github.com/netology-code/mnt-homeworks/blob/MNT-video/09-ci-04-jenkins/pipeline
#### 6. Внес необходимые изменения, чтобы Pipeline запускал ansible-playbook без флагов --check --diff, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами --check --diff

![image](https://github.com/inyushov/devops-netology/assets/127683348/2adca68a-7b7e-4f74-8154-712ffb9accc4)

![image](https://github.com/inyushov/devops-netology/assets/127683348/add67e0e-94a5-4c11-afd6-d1a017d9ba9f)









