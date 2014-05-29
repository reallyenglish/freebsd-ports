--- ./plugin/ls2.inc.php.orig	2006-10-22 05:40:26.000000000 +0900
+++ ./plugin/ls2.inc.php	2014-05-29 16:35:20.000000000 +0900
@@ -66,7 +66,7 @@
 	}
 	if ($prefix == '') $prefix = strip_bracket($vars['page']) . '/';
 
-	array_walk($args, 'plugin_ls2_check_arg', & $params);
+	array_walk($args, 'plugin_ls2_check_arg', $params);
 
 	$title = (! empty($params['_args'])) ? join(',', $params['_args']) :   // Manual
 		str_replace('$1', htmlspecialchars($prefix), $_ls2_msg_title); // Auto
@@ -196,7 +196,7 @@
 }
 
 // オプションを解析する
-function plugin_ls2_check_arg($value, $key, & $params)
+function plugin_ls2_check_arg($value, $key, $params)
 {
 	if ($value == '') {
 		$params['_done'] = TRUE;
