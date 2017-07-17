This repository can be used to create a docker-swarm for development.

Although provisioning scripts have been written to provision a master node and
two worker nodes, docker swarm needs to be set up manually. Use the
```start.sh``` script to create and provision the docker nodes.

SSH into each of the nodes, using the command: ```vagrant ssh <node-name>```,
where node-name could be one of master, node1 or node2.

Nodes are accessible over host-only network, using the IPs:

- master: 192.168.99.10
- node1: 192.168.99.11
- node2: 192.168.99.12

Host can be accessed from within each node with the IP '192.168.99.1'

In order to use docker-swarm, all images need to be provided in a
docker-registry. By default, the nodes have unsecure access to the registry
running on the host machine at 192.168.99.1:5000, however, this registry needs
to be created using the command:
```docker run -d -p 5000:5000 --name registry registry:2```

## Setting up Docker-Swarm manually

First, initialize docker-swarm within master.

```
$ sudo docker swarm init --advertise-addr 192.168.99.10
```

this will output the command that needs to be run inside each node to add it to
the swarm:
```
      docker swarm join --token SWMTKN-1-1iresdrsdsotgpbtfcdcwwb95s8vaz0vbom4c6uyspnzwlsafo-1rxm086dl521aio9nbmb59nqh 192.168.99.10:2377
```

copy this command, and execute it in each of the nodes, with the sudo command

Now, list the swarm nodes, by executing the following command in the master node:

```
$ sudo docker node ls
```
