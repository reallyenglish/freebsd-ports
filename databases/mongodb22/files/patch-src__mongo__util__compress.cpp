--- ./src/mongo/util/compress.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/util/compress.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -2,7 +2,7 @@
 
 #include "mongo/util/compress.h"
 
-#include "third_party/snappy/snappy.h"
+#include "snappy.h"
 
 namespace mongo {
 
