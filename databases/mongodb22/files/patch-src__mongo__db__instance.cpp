--- ./src/mongo/db/instance.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/instance.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -826,13 +826,13 @@
                 i != boost::filesystem::directory_iterator(); ++i ) {
             if ( directoryperdb ) {
                 boost::filesystem::path p = *i;
-                string dbName = p.leaf();
+                string dbName = p.leaf().string();
                 p /= ( dbName + ".ns" );
                 if ( exists( p ) )
                     names.push_back( dbName );
             }
             else {
-                string fileName = boost::filesystem::path(*i).leaf();
+                string fileName = boost::filesystem::path(*i).leaf().string();
                 if ( fileName.length() > 3 && fileName.substr( fileName.length() - 3, 3 ) == ".ns" )
                     names.push_back( fileName.substr( 0, fileName.length() - 3 ) );
             }
@@ -1095,7 +1095,7 @@
     }
 
     void acquirePathLock(bool doingRepair) {
-        string name = ( boost::filesystem::path( dbpath ) / "mongod.lock" ).native_file_string();
+        string name = ( boost::filesystem::path( dbpath ) / "mongod.lock" ).string();
 
         bool oldFile = false;
 
