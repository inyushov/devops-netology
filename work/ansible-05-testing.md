### Molecule

#### 1. Запуститл molecule test -s ubuntu_xenial внутри корневой директории clickhouse-role

```
root@server1:/vagrant/ansible-05-testing/playbook/roles/clickhouse# molecule test -s ubuntu_xenial
INFO     ubuntu_xenial scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/7e099f/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/7e099f/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/7e099f/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/hosts
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/group_vars
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/host_vars
INFO     Running ubuntu_xenial > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/hosts
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/group_vars
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/host_vars
INFO     Running ubuntu_xenial > lint
COMMAND: yamllint .
ansible-lint
flake8

/bin/bash: yamllint: command not found
fatal: not a git repository (or any parent up to mount point /)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
/usr/bin/ansible-lint:6: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
  from pkg_resources import load_entry_point
Traceback (most recent call last):
  File "/usr/bin/ansible-lint", line 11, in <module>
    load_entry_point('ansible-lint==4.2.0', 'console_scripts', 'ansible-lint')()
  File "/usr/lib/python3/dist-packages/ansiblelint/__main__.py", line 153, in main
    args = get_playbooks_and_roles(options=options)
  File "/usr/lib/python3/dist-packages/ansiblelint/utils.py", line 772, in get_playbooks_and_roles
    files = OrderedDict.fromkeys(sorted(subprocess.check_output(
  File "/usr/lib/python3.8/subprocess.py", line 415, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
  File "/usr/lib/python3.8/subprocess.py", line 516, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['git', 'ls-files', '*.yaml', '*.yml']' returned non-zero exit status 128.
/bin/bash: line 2: flake8: command not found
CRITICAL Lint failed with error code 127
WARNING  An error occurred during the test sequence action: 'lint'. Cleaning up.
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/hosts
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/group_vars
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/host_vars
INFO     Running ubuntu_xenial > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/hosts
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/group_vars
INFO     Inventory /vagrant/ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/ubuntu_xenial/inventory/host_vars
INFO     Running ubuntu_xenial > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu_xenial)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=ubuntu_xenial)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```

#### 2. Перешол в каталог с ролью vector-role и создал сценарий тестирования по умолчанию при помощи molecule init scenario --driver-name docker

```
root@server1:/vagrant/ansible-05-testing/playbook/roles/vector-role# molecule init scenario --driver-name docker
INFO     Initializing new scenario default...
INFO     Initialized scenario in /vagrant/ansible-05-testing/playbook/roles/vector-role/molecule/default successfully.
```
#### 3. Добавил oraclelinux:8, ubuntu:latest для инстансов и протестировал роль

#### molecule test -s oraclelinux_8

```
root@server1:/vagrant/ansible-05-testing/playbook/roles/vector-role# molecule test -s oraclelinux_8
INFO     oraclelinux_8 scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/f5bcd7/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/f5bcd7/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/f5bcd7/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running oraclelinux_8 > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running oraclelinux_8 > lint
INFO     Lint is disabled.
INFO     Running oraclelinux_8 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running oraclelinux_8 > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running oraclelinux_8 > syntax

playbook: /vagrant/ansible-05-testing/playbook/roles/vector-role/molecule/oraclelinux_8/converge.yml
INFO     Running oraclelinux_8 > create

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Synchronization the context] *********************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:8)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '35259047458.2004776', 'results_file': '/root/.ansible_async/35259047458.2004776', 'changed': True, 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running oraclelinux_8 > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running oraclelinux_8 > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [instance]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Create vector work directory] ******************************
changed: [instance]

TASK [vector-role : Get Vector distrib] ****************************************
changed: [instance]

TASK [vector-role : Unzip Vector archive] **************************************
changed: [instance]

TASK [vector-role : Install Vector binary] *************************************
changed: [instance]

TASK [vector-role : Check Vector installation] *********************************
changed: [instance]

TASK [vector-role : Create Vector etc directory] *******************************
changed: [instance]

TASK [vector-role : Create Vector config vector.yaml] **************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ansible.errors.AnsibleUndefinedVariable: 'all_clickhouse_db' is undefined
fatal: [instance]: FAILED! => {"changed": false, "msg": "AnsibleUndefinedVariable: 'all_clickhouse_db' is undefined"}

PLAY RECAP *********************************************************************
instance                   : ok=7    changed=6    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/vector-role/oraclelinux_8/inventory', '--skip-tags', 'molecule-notest,notest', '/vagrant/ansible-05-testing/playbook/roles/vector-role/molecule/oraclelinux_8/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running oraclelinux_8 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running oraclelinux_8 > destroy

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
root@server1:/vagrant/ansible-05-testing/playbook/roles/vector-role# molecule test -s oraclelinux_8
INFO     oraclelinux_8 scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/f5bcd7/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/f5bcd7/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/f5bcd7/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running oraclelinux_8 > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running oraclelinux_8 > lint
INFO     Lint is disabled.
INFO     Running oraclelinux_8 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running oraclelinux_8 > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running oraclelinux_8 > syntax

playbook: /vagrant/ansible-05-testing/playbook/roles/vector-role/molecule/oraclelinux_8/converge.yml
INFO     Running oraclelinux_8 > create

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Synchronization the context] *********************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:8)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '263716065890.2006939', 'results_file': '/root/.ansible_async/263716065890.2006939', 'changed': True, 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running oraclelinux_8 > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running oraclelinux_8 > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [instance]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Create vector work directory] ******************************
changed: [instance]

TASK [vector-role : Get Vector distrib] ****************************************
changed: [instance]

TASK [vector-role : Unzip Vector archive] **************************************
changed: [instance]

TASK [vector-role : Install Vector binary] *************************************
changed: [instance]

TASK [vector-role : Check Vector installation] *********************************
changed: [instance]

TASK [vector-role : Create Vector etc directory] *******************************
changed: [instance]

TASK [vector-role : Create Vector config vector.yaml] **************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ansible.errors.AnsibleUndefinedVariable: 'all_clickhouse_db' is undefined
fatal: [instance]: FAILED! => {"changed": false, "msg": "AnsibleUndefinedVariable: 'all_clickhouse_db' is undefined"}

PLAY RECAP *********************************************************************
instance                   : ok=7    changed=6    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/vector-role/oraclelinux_8/inventory', '--skip-tags', 'molecule-notest,notest', '/vagrant/ansible-05-testing/playbook/roles/vector-role/molecule/oraclelinux_8/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running oraclelinux_8 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running oraclelinux_8 > destroy

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```

#### molecule test -s ubuntu_latest

```
root@server1:/vagrant/ansible-05-testing/playbook/roles/vector-role# molecule test -s ubuntu_latest
INFO     ubuntu_latest scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/f5bcd7/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/f5bcd7/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/f5bcd7/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running ubuntu_latest > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running ubuntu_latest > lint
INFO     Lint is disabled.
INFO     Running ubuntu_latest > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running ubuntu_latest > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running ubuntu_latest > syntax

playbook: /vagrant/ansible-05-testing/playbook/roles/vector-role/molecule/ubuntu_latest/converge.yml
INFO     Running ubuntu_latest > create

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Synchronization the context] *********************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:8)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '81727346690.2002821', 'results_file': '/root/.ansible_async/81727346690.2002821', 'changed': True, 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'instance', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running ubuntu_latest > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running ubuntu_latest > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [instance]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Create vector work directory] ******************************
changed: [instance]

TASK [vector-role : Get Vector distrib] ****************************************
changed: [instance]

TASK [vector-role : Unzip Vector archive] **************************************
changed: [instance]

TASK [vector-role : Install Vector binary] *************************************
changed: [instance]

TASK [vector-role : Check Vector installation] *********************************
changed: [instance]

TASK [vector-role : Create Vector etc directory] *******************************
changed: [instance]

TASK [vector-role : Create Vector config vector.yaml] **************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ansible.errors.AnsibleUndefinedVariable: 'all_clickhouse_db' is undefined
fatal: [instance]: FAILED! => {"changed": false, "msg": "AnsibleUndefinedVariable: 'all_clickhouse_db' is undefined"}

PLAY RECAP *********************************************************************
instance                   : ok=7    changed=6    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/vector-role/ubuntu_latest/inventory', '--skip-tags', 'molecule-notest,notest', '/vagrant/ansible-05-testing/playbook/roles/vector-role/molecule/ubuntu_latest/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running ubuntu_latest > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running ubuntu_latest > destroy

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=instance)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```


### Tox

#### 1. Добавил.

#### 2. Запуститил.

```
root@server1:/vagrant/ansible-05-testing/playbook/roles/vector-role# docker run --privileged=True -v /vagrant/ansible-05-testing/playbook/roles/vector-role:/opt/vector-
role -w /opt/vector-role -it aragast/netology:latest /bin/bash
[root@93dc5aedd7a6 vector-role]#
```
#### 2.Внутри контейнера выполнил команду tox

```
[root@9dd46d23a8e4 vector-role]# tox
py37-ansible210 create: /opt/vector-role/.tox/py37-ansible210
ERROR: invocation failed (exit code 1), logfile: /opt/vector-role/.tox/py37-ansible210/log/py37-ansible210-0.log
============================================================================== log start ===============================================================================
OSError: [Errno 71] Protocol error: '/usr/local/bin/python3.7' -> '/opt/vector-role/.tox/py37-ansible210/bin/python'

=============================================================================== log end ================================================================================
ERROR: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.7 py37-ansible210 (exited with code 1)
py37-ansible30 create: /opt/vector-role/.tox/py37-ansible30
ERROR: invocation failed (exit code 1), logfile: /opt/vector-role/.tox/py37-ansible30/log/py37-ansible30-0.log
============================================================================== log start ===============================================================================
OSError: [Errno 71] Protocol error: '/usr/local/bin/python3.7' -> '/opt/vector-role/.tox/py37-ansible30/bin/python'

=============================================================================== log end ================================================================================
ERROR: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.7 py37-ansible30 (exited with code 1)
py39-ansible210 create: /opt/vector-role/.tox/py39-ansible210
ERROR: invocation failed (exit code 1), logfile: /opt/vector-role/.tox/py39-ansible210/log/py39-ansible210-0.log
============================================================================== log start ===============================================================================
OSError: [Errno 71] Protocol error: '/usr/local/bin/python3.9' -> '/opt/vector-role/.tox/py39-ansible210/bin/python'

=============================================================================== log end ================================================================================
ERROR: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.9 py39-ansible210 (exited with code 1)
py39-ansible30 create: /opt/vector-role/.tox/py39-ansible30
ERROR: invocation failed (exit code 1), logfile: /opt/vector-role/.tox/py39-ansible30/log/py39-ansible30-0.log
============================================================================== log start ===============================================================================
OSError: [Errno 71] Protocol error: '/usr/local/bin/python3.9' -> '/opt/vector-role/.tox/py39-ansible30/bin/python'

=============================================================================== log end ================================================================================
ERROR: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.9 py39-ansible30 (exited with code 1)
_______________________________________________________________________________ summary ________________________________________________________________________________
ERROR:   py37-ansible210: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.7 py37-ansible210 (exited with code 1)
ERROR:   py37-ansible30: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.7 py37-ansible30 (exited with code 1)
ERROR:   py39-ansible210: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.9 py39-ansible210 (exited with code 1)
ERROR:   py39-ansible30: InvocationError for command /usr/bin/python3 -m virtualenv --no-download --python /usr/local/bin/python3.9 py39-ansible30 (exited with code 1)
```
