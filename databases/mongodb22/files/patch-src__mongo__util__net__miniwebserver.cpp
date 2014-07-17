--- ./src/mongo/util/net/miniwebserver.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/util/net/miniwebserver.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -19,7 +19,7 @@
 #include "miniwebserver.h"
 #include "../hex.h"
 
-#include "pcrecpp.h"
+#include <pcrecpp.h>
 
 namespace mongo {
 
