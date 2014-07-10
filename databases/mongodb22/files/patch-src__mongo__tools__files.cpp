--- ./src/mongo/tools/files.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/tools/files.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -21,7 +21,7 @@
 #include "mongo/client/dbclientcursor.h"
 
 #include "tool.h"
-#include "pcrecpp.h"
+#include <pcrecpp.h>
 
 #include <fstream>
 #include <iostream>
