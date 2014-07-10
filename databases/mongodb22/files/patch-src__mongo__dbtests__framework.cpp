--- ./src/mongo/dbtests/framework.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/dbtests/framework.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -199,7 +199,7 @@
                 boost::filesystem::create_directory(p);
             }
 
-            string dbpathString = p.native_directory_string();
+            string dbpathString = p.string();
             dbpath = dbpathString.c_str();
 
             cmdLine.prealloc = false;
