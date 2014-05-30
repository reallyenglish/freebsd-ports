--- ./plugin/ls2.inc.php.orig	2006-10-22 05:40:26.000000000 +0900
+++ ./plugin/ls2.inc.php	2014-05-30 16:22:12.000000000 +0900
@@ -66,7 +66,7 @@
 	}
 	if ($prefix == '') $prefix = strip_bracket($vars['page']) . '/';
 
-	array_walk($args, 'plugin_ls2_check_arg', & $params);
+	array_walk($args, 'plugin_ls2_check_arg', $params);
 
 	$title = (! empty($params['_args'])) ? join(',', $params['_args']) :   // Manual
 		str_replace('$1', htmlspecialchars($prefix), $_ls2_msg_title); // Auto
@@ -123,7 +123,8 @@
 	$r_page = rawurlencode($page);
 	$s_page = htmlspecialchars($page);
 	$title  = $s_page . ' ' . get_pg_passage($page, FALSE);
-	$href   = $script . '?cmd=read&amp;page=' . $r_page;
+//	$href   = $script . '?cmd=read&amp;page=' . $r_page;
+	$href   = $script . '?' . $r_page;
 
 	plugin_ls2_list_push($params, $level);
 	$ret = $include ? '<li>include ' : '<li>';
@@ -196,7 +197,7 @@
 }
 
 // オプションを解析する
-function plugin_ls2_check_arg($value, $key, & $params)
+function plugin_ls2_check_arg($value, $key, $params)
 {
 	if ($value == '') {
 		$params['_done'] = TRUE;
