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
