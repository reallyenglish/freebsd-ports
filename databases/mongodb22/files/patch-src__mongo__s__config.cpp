--- ./src/mongo/s/config.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/s/config.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -30,7 +30,7 @@
 #include "config.h"
 #include "grid.h"
 #include "server.h"
-#include "pcrecpp.h"
+#include <pcrecpp.h>
 
 namespace mongo {
 
