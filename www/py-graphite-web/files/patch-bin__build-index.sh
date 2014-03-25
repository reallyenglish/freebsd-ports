--- ./bin/build-index.sh.orig	2014-03-01 14:14:49.000000000 +0900
+++ ./bin/build-index.sh	2014-03-18 15:29:02.000000000 +0900
@@ -1,3 +1,3 @@
-#!/bin/bash
-export PYTHONPATH="/opt/graphite/webapp/:$PYTHONPATH"
+#!/bin/sh
+export PYTHONPATH="%%GRAPHITE_WEBAPP_ROOT%%:$PYTHONPATH"
 ./build-index
