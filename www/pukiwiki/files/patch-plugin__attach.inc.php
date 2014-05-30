--- ./plugin/attach.inc.php.orig	2014-05-30 17:36:14.000000000 +0900
+++ ./plugin/attach.inc.php	2014-05-30 17:36:36.000000000 +0900
@@ -17,7 +17,7 @@
 ini_set('upload_max_filesize', '2M');
 
 // Max file size for upload on script of PukiWikiX_FILESIZE
-define('PLUGIN_ATTACH_MAX_FILESIZE', (1024 * 1024)); // default: 1MB
+define('PLUGIN_ATTACH_MAX_FILESIZE', (1024 * 1024)*5); // default: 5MB
 
 // 管理者だけが添付ファイルをアップロードできるようにする
 define('PLUGIN_ATTACH_UPLOAD_ADMIN_ONLY', TRUE); // FALSE or TRUE
