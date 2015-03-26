#!/bin/bash
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
make
