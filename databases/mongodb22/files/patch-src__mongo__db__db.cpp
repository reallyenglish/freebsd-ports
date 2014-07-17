--- ./src/mongo/db/db.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/db.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -348,7 +348,7 @@
         boost::filesystem::path path( dbpath );
         for ( boost::filesystem::directory_iterator i( path );
                 i != boost::filesystem::directory_iterator(); ++i ) {
-            string fileName = boost::filesystem::path(*i).leaf();
+            string fileName = boost::filesystem::path(*i).leaf().string();
             if ( boost::filesystem::is_directory( *i ) &&
                     fileName.length() && fileName[ 0 ] == '$' )
                 boost::filesystem::remove_all( *i );
@@ -748,11 +748,11 @@
     dbExecCommand = argv[0];
 
     srand(curTimeMicros());
-#if( BOOST_VERSION >= 104500 )
-    boost::filesystem::path::default_name_check( boost::filesystem2::no_check );
-#else
-    boost::filesystem::path::default_name_check( boost::filesystem::no_check );
-#endif
+// #if( BOOST_VERSION >= 104500 )
+//     boost::filesystem::path::default_name_check( boost::filesystem2::no_check );
+// #else
+//     boost::filesystem::path::default_name_check( boost::filesystem::no_check );
+// #endif
 
     {
         unsigned x = 0x12345678;
@@ -1083,7 +1083,7 @@
         if (params.count("shutdown")){
             bool failed = false;
 
-            string name = ( boost::filesystem::path( dbpath ) / "mongod.lock" ).native_file_string();
+            string name = ( boost::filesystem::path( dbpath ) / "mongod.lock" ).string();
             if ( !boost::filesystem::exists( name ) || boost::filesystem::file_size( name ) == 0 )
                 failed = true;
 
