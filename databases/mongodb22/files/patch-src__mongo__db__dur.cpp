--- ./src/mongo/db/dur.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/dur.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -779,7 +779,7 @@
 
             bool samePartition = true;
             try {
-                const string dbpathDir = boost::filesystem::path(dbpath).native_directory_string();
+                const string dbpathDir = boost::filesystem::path(dbpath).string();
                 samePartition = onSamePartition(getJournalDir().string(), dbpathDir);
             }
             catch(...) {
