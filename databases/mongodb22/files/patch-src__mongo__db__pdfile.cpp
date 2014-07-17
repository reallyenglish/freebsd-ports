--- ./src/mongo/db/pdfile.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/pdfile.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -1736,7 +1736,7 @@
             virtual bool apply( const Path &p ) {
                 if ( !boost::filesystem::exists( p ) )
                     return false;
-                boostRenameWrapper( p, newPath_ / ( p.leaf() + ".bak" ) );
+                boostRenameWrapper( p, newPath_ / ( p.leaf().string() + ".bak" ) );
                 return true;
             }
             virtual const char * op() const {
@@ -1844,7 +1844,7 @@
             uniqueReservedPath( ( preserveClonedFilesOnFailure || backupOriginalFiles ) ?
                                 "backup" : "_tmp" );
         MONGO_ASSERT_ON_EXCEPTION( boost::filesystem::create_directory( reservedPath ) );
-        string reservedPathString = reservedPath.native_directory_string();
+        string reservedPathString = reservedPath.string();
 
         bool res;
         {
