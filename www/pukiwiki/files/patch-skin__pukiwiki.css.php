--- ./skin/pukiwiki.css.php.orig	2006-10-22 05:40:27.000000000 +0900
+++ ./skin/pukiwiki.css.php	2014-05-30 16:15:00.000000000 +0900
@@ -64,7 +64,8 @@
 <?php	if ($media == 'print') { ?>
 	text-decoration: underline;
 <?php	} else { ?>
-	color:#a63d21;
+    / * color:#a63d21; */
+    color:#270;
 	background-color:inherit;
 	text-decoration:none;
 <?php	} ?>
@@ -357,11 +358,11 @@
 <?php   if ($media == 'print') { ?>
 	display:none;
 <?php   } else { ?>
-	width:9em;
+	width:15em;
 	padding:0px;
 	margin:4px;
 	word-break:break-all;
-	font-size:90%;
+	font-size:100%;
 	overflow:hidden;
 <?php   } ?>
 }
@@ -546,7 +547,7 @@
 }
 
 /* counter.inc.php */
-div.counter { font-size:70%; }
+div.counter { font-size:90%; }
 
 /* diff.inc.php */
 span.diff_added {
