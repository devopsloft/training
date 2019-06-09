# <a href="http://www.devopsloft.io">DevOps Loft</a>

<img src="http://www.devopsloft.io/static/logo.png" alt="drawing" width="250" hight="250"/>

## Disclaimer: AWS services are subject to charges. Be aware and use cautiously

<details>
  <summary>Prerequisites</summary>
  <ul>
    <li>Install Git</li>
    <li>GitHub account</li>
    <li>Fork this repo</li>
    <li>Clone your forked repo</li>
    <li>Install Vagrant</li>
    <li>Install VirtualBox</li>
    <li>AWS account</li>
    <li>AWS cli credentials</li>
    <li>Create S3 bucket</li>
  </ul>
</details>

## Useful commands

##### Spin environment

~~~
  $ vagrant up
~~~

##### SSH the environment

~~~
  $ vagrant ssh
~~~

##### Which docker containers are running?

~~~
  vagrant@ubuntu-bionic:~$ docker ps
~~~

##### Want to run vault CLI commands?

~~~
  vagrant@ubuntu-bionic:~$ cd /vagrant
  vagrant@ubuntu-bionic:/vagrant$ docker-compose exec vault-cli /bin/sh
  / # vault status
  / # exit
  vagrant@ubuntu-bionic:/vagrant$ exit
~~~

##### Initialize (non dev) Vault

~~~
  / # vault operator init
~~~

##### Destroy environment

~~~
  $ vagrant destroy -f
~~~
