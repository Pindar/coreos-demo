# coreos-demo

This is a demo project that shows how to setup various tools on a CoreOS cluster. For example:

- ElasticSearch (Cluster+Client)
- Rsyslog
- Kibana
- Datadog Agent
- Logspout
- Registrator
- Skydns2
- RabbitMQ (Cluster)

You can find more details on my blog www.itnotes.de

Please prepare a CoreOS cluster with flannel. As soon it is running please set the following configuration parameter:

- set datadog key: `etcdctl set /operations/datadog/ddapikey MY_KEY`
- set skydns config: `etcdctl set /skydns/config '{"domain":"example.local."}'`
- set etcd-key `etcdctl set /operations/etcd/1 '{"host":"HOST_IP","port":4001}'`