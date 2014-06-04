--- ./public_html/pastebin.php.orig	2013-10-10 00:29:58.000000000 +0900
+++ ./public_html/pastebin.php	2014-06-04 12:05:35.000000000 +0900
@@ -194,7 +194,8 @@
 		#we want to drop a note to apache so that we log the ID with the post
 		#request, makes it much easier to identify who posted a given id from
  		#apache logs
-		apache_note('pasteid', "{$_SERVER['HTTP_HOST']}/{$id}");
+		if (function_exists("apache_note"))
+			apache_note('pasteid', "{$_SERVER['HTTP_HOST']}/{$id}");
 
 		$pastebin->redirectToPost($id);
 		exit;
