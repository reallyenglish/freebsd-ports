--- ./src/mongo/scripting/engine_spidermonkey.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/scripting/engine_spidermonkey.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -25,7 +25,7 @@
 #include <boost/date_time/posix_time/posix_time.hpp>
 #endif
 
-#include <third_party/js-1.7/jsdate.h>
+#include <jsdate.h>
 
 #include "mongo/util/mongoutils/str.h"
 
