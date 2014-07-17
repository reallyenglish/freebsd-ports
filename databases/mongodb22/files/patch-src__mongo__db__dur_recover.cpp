--- ./src/mongo/db/dur_recover.cpp.orig	2012-11-27 13:08:44.000000000 +0900
+++ ./src/mongo/db/dur_recover.cpp	2014-07-10 15:42:01.000000000 +0900
@@ -72,7 +72,7 @@
                     i != boost::filesystem::directory_iterator();
                     ++i ) {
                 boost::filesystem::path filepath = *i;
-                string fileName = boost::filesystem::path(*i).leaf();
+                string fileName = boost::filesystem::path(*i).leaf().string();
                 if( str::startsWith(fileName, "j._") ) {
                     unsigned u = str::toUnsigned( str::after(fileName, '_') );
                     if( m.count(u) ) {
@@ -85,7 +85,7 @@
                 if( i != m.begin() && m.count(i->first - 1) == 0 ) {
                     uasserted(13532,
                     str::stream() << "unexpected file in journal directory " << dir.string()
-                      << " : " << boost::filesystem::path(i->second).leaf() << " : can't find its preceeding file");
+                      << " : " << boost::filesystem::path(i->second).leaf().string() << " : can't find its preceeding file");
                 }
                 files.push_back(i->second);
             }
