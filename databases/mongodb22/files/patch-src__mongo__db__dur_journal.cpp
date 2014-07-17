--- ./src/mongo/db/dur_journal.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/dur_journal.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -176,7 +176,7 @@
                 for ( boost::filesystem::directory_iterator i( getJournalDir() );
                         i != boost::filesystem::directory_iterator();
                         ++i ) {
-                    string fileName = boost::filesystem::path(*i).leaf();
+                    string fileName = boost::filesystem::path(*i).leaf().string();
                     if( anyFiles || str::startsWith(fileName, "j._") )
                         return true;
                 }
@@ -194,7 +194,7 @@
                 for ( boost::filesystem::directory_iterator i( getJournalDir() );
                         i != boost::filesystem::directory_iterator();
                         ++i ) {
-                    string fileName = boost::filesystem::path(*i).leaf();
+                    string fileName = boost::filesystem::path(*i).leaf().string();
                     if( str::startsWith(fileName, "j._") ) {
                         try {
                             removeOldJournalFile(*i);
