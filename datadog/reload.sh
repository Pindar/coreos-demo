#!/bin/bash

kill -SIGHUP `cat /supervisord.pid`
