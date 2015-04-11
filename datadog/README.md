# dynamic datadog agent

To be able to monitor dynamic services with datadog it is required to write the configuration files at runtime. Therefore a confd process is continuously running to watch for changes. As soon as a known service instance gets announced through registrator+skydns2 the configuration gets rewritten and the datadog service reloads.

