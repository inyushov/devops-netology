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
[root@26ea5591b589 vector-role]# tox
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.1.1,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.11.17,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.3.2,click==8.1.7,click-help-colors==0.9.4,cookiecutter==2.5.0,cryptography==41.0.7,distro==1.8.0,enrich==1.2.7,idna==3.6,importlib-metadata==6.7.0,Jinja2==3.1.2,jmespath==1.0.1,lxml==4.9.3,markdown-it-py==2.2.0,MarkupSafe==2.1.3,mdurl==0.1.2,molecule==3.5.2,molecule-podman==1.1.0,packaging==23.2,paramiko==2.12.0,pathspec==0.11.2,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.1,PyYAML==5.4.1,requests==2.31.0,rich==13.7.0,ruamel.yaml==0.18.5,ruamel.yaml.clib==0.2.8,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.2.3,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,wcmatch==8.4.1,yamllint==1.26.3,zipp==3.15.0
py37-ansible210 run-test-pre: PYTHONHASHSEED='1967078038'
py37-ansible210 run-test: commands[0] | molecule test -s tox --destroy always
INFO     tox scenario test matrix: destroy, create, converge, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b984a4/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b984a4/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b984a4/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running tox > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '124529077575.65', 'results_file': '/root/.ansible_async/124529077575.65', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="stupefied_curie registry username: None specified") 

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/debian:latest") 

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=stupefied_curie)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/debian:latest) 

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="stupefied_curie command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=stupefied_curie: None specified) 

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=stupefied_curie)

TASK [Wait for instance(s) creation to complete] *******************************
changed: [localhost] => (item=stupefied_curie)

PLAY RECAP *********************************************************************
localhost                  : ok=8    changed=3    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running tox > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [stupefied_curie]

TASK [Copy something to test use of synchronize module] ************************
changed: [stupefied_curie]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Check if the system is not support by this role] ***********
skipping: [stupefied_curie]

TASK [vector-role : Create vector work directory] ******************************
changed: [stupefied_curie]

TASK [vector-role : Get Vector distrib] ****************************************
changed: [stupefied_curie]

TASK [vector-role : Unzip Vector archive] **************************************
changed: [stupefied_curie]

TASK [vector-role : Install Vector binary] *************************************
changed: [stupefied_curie]

TASK [vector-role : Create Vector etc directory] *******************************
changed: [stupefied_curie]

TASK [vector-role : Create Vector config vector.yaml] **************************
changed: [stupefied_curie]

TASK [vector-role : Create user vector] ****************************************
changed: [stupefied_curie]

TASK [vector-role : Create Vector data_dir] ************************************
changed: [stupefied_curie]

PLAY RECAP *********************************************************************
stupefied_curie            : ok=10   changed=9    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running tox > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '375379396132.2222', 'results_file': '/root/.ansible_async/375379396132.2222', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.1.1,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.11.17,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.3.2,click==8.1.7,click-help-colors==0.9.4,cookiecutter==2.5.0,cryptography==41.0.7,distro==1.8.0,enrich==1.2.7,idna==3.6,importlib-metadata==6.7.0,Jinja2==3.1.2,jmespath==1.0.1,lxml==4.9.3,markdown-it-py==2.2.0,MarkupSafe==2.1.3,mdurl==0.1.2,molecule==3.5.2,molecule-podman==1.1.0,packaging==23.2,paramiko==2.12.0,pathspec==0.11.2,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.1,PyYAML==5.4.1,requests==2.31.0,rich==13.7.0,ruamel.yaml==0.18.5,ruamel.yaml.clib==0.2.8,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.2.3,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,wcmatch==8.4.1,yamllint==1.26.3,zipp==3.15.0
py37-ansible30 run-test-pre: PYTHONHASHSEED='1967078038'
py37-ansible30 run-test: commands[0] | molecule test -s tox --destroy always
INFO     tox scenario test matrix: destroy, create, converge, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b984a4/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b984a4/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b984a4/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running tox > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '728118538986.2361', 'results_file': '/root/.ansible_async/728118538986.2361', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="stupefied_curie registry username: None specified") 

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/debian:latest") 

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=stupefied_curie)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/debian:latest) 

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="stupefied_curie command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=stupefied_curie: None specified) 

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=stupefied_curie)

TASK [Wait for instance(s) creation to complete] *******************************
changed: [localhost] => (item=stupefied_curie)

PLAY RECAP *********************************************************************
localhost                  : ok=8    changed=3    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running tox > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [stupefied_curie]

TASK [Copy something to test use of synchronize module] ************************
changed: [stupefied_curie]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Check if the system is not support by this role] ***********
skipping: [stupefied_curie]

TASK [vector-role : Create vector work directory] ******************************
changed: [stupefied_curie]

TASK [vector-role : Get Vector distrib] ****************************************
changed: [stupefied_curie]

TASK [vector-role : Unzip Vector archive] **************************************
changed: [stupefied_curie]

TASK [vector-role : Install Vector binary] *************************************
changed: [stupefied_curie]

TASK [vector-role : Create Vector etc directory] *******************************
changed: [stupefied_curie]

TASK [vector-role : Create Vector config vector.yaml] **************************
changed: [stupefied_curie]

TASK [vector-role : Create user vector] ****************************************
changed: [stupefied_curie]

TASK [vector-role : Create Vector data_dir] ************************************
changed: [stupefied_curie]

PLAY RECAP *********************************************************************
stupefied_curie            : ok=10   changed=9    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running tox > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '295918952954.4518', 'results_file': '/root/.ansible_async/295918952954.4518', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
_____________________________________________________________________________________________________________ summary ______________________________________________________________________________________________________________
  py37-ansible210: commands succeeded
  py37-ansible30: commands succeeded
  congratulations :)

```
