--- ./src/mongo/shell/shell_utils_launcher.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/shell/shell_utils_launcher.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -184,7 +184,7 @@
             }
 #endif
 
-            _argv.push_back( programPath.native_file_string() );
+            _argv.push_back( programPath.string() );
 
             _port = -1;
 
