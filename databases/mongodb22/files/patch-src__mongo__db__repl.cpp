--- ./src/mongo/db/repl.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/repl.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -46,7 +46,7 @@
 #include "replutil.h"
 #include "repl/connections.h"
 #include "ops/update.h"
-#include "pcrecpp.h"
+#include <pcrecpp.h>
 #include "mongo/db/instance.h"
 #include "mongo/db/queryutil.h"
 
