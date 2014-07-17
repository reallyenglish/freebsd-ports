--- ./src/mongo/db/matcher.h.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/matcher.h	2014-07-10 15:42:01.000000000 +0900
@@ -21,7 +21,7 @@
 #pragma once
 
 #include "jsobj.h"
-#include "pcrecpp.h"
+#include <pcrecpp.h>
 
 namespace mongo {
 
