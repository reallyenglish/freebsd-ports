--- ./src/mongo/tools/tool.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/tools/tool.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -21,7 +21,7 @@
 #include <fstream>
 #include <iostream>
 
-#include "pcrecpp.h"
+#include <pcrecpp.h>
 
 #include "mongo/db/namespace_details.h"
 #include "mongo/util/file_allocator.h"
