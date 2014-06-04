--- ./public_html/layout.php.orig	2014-06-03 16:42:32.000000000 +0900
+++ ./public_html/layout.php	2014-06-04 12:05:35.000000000 +0900
@@ -141,37 +141,6 @@
 ?>
 </ul>
 
-<?php if (!isset($_GET['search'])) { ?>
-
-<h1>Search Pastebin</h1>
-
-<form action="http://pastebin.com/search" id="cse-search-box">
-  <div>
-    <input type="hidden" name="cx" value="partner-pub-3281640380846080:rwgn88wz7bt" />
-    <input type="hidden" name="cof" value="FORID:10" />
-    <input type="hidden" name="ie" value="ISO-8859-1" />
-    <input type="text" name="q" size="14" />
-    <input type="submit" name="sa" value="Search Pastebin" />
-  </div>
-</form>
-<script type="text/javascript" src="http://www.google.com/cse/brand?form=cse-search-box&amp;lang=en"></script>
-
-<?php } ?>
-
-<h1>News</h1>
-
-<!--
-<p><a href="http://blog.dixo.net/2010/02/09/want-to-buy-pastebin-com/">Want to buy pastebin.com?</a> Own a
-little bit of Internet history and develop it further!</p>
--->
-
-<?php
-
-echo "<p>";
-echo t('For news and feedback see my <a title="View pastebin related posts on my blog" href="http://blog.dixo.net/category/pastebin/">blog</a>.');
-echo "</p>";
-
-?>
 <!--
 <h1>Translations?</h1>
 
@@ -184,16 +153,6 @@
 -->
 
 <?php
-if ($subdomain=='')
-{
-	echo '<h1>'.t('Free subdomains').'</h1><p>';
-	
-	echo t('Want your own xyz.pastebin.com sub-domain for your community? '.
-		'Just type the address into your browser address bar.');
-	
-	echo " <a href=\"{$CONF['this_script']}?help=1\">".t('See help for details').
-		'</a></p>';
-}
 
 echo '<h1>'.t('About').'</h1><p>';
 
@@ -251,7 +210,7 @@
 {
 ?>
 <script type="text/javascript"><!--
-google_ad_client = "pub-3281640380846080";
+google_ad_client = "<?php echo $CONF['google_ad_client'] ?>";
 google_ad_width = 728;
 google_ad_height = 90;
 google_ad_format = "728x90_as";
