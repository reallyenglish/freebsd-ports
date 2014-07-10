--- ./src/mongo/s/grid.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/s/grid.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -27,7 +27,7 @@
 
 #include "grid.h"
 #include "shard.h"
-#include "pcrecpp.h"
+#include <pcrecpp.h>
 
 namespace mongo {
 
