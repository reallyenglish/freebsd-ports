--- ./bin/build-index.sh.orig	2014-03-01 14:14:49.000000000 +0900
+++ ./bin/build-index.sh	2014-03-06 11:58:13.000000000 +0900
@@ -1,3 +1,3 @@
 #!/bin/bash
-export PYTHONPATH="/opt/graphite/webapp/:$PYTHONPATH"
+export PYTHONPATH="%%GRAPHITE_WEBAPP_ROOT%%:$PYTHONPATH"
 ./build-index
