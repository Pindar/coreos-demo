# coreos-demo

This is a demo project that shows how to setup a log server infrastructure quickly on top of a CoreOS cluster.

You can find more details on my blog www.itnotes.de

- set datadog key: `etcdctl set /operations/datadog/ddapikey MY_KEY`
- set skydns config: `etcdctl set '{"domain":"example.local."}'`
- set etcd-key `etcdctl set /operations/etcd/1 '{"host":"HOST_IP","port":4001}'`