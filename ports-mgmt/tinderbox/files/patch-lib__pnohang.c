--- ./lib/pnohang.c.orig	2013-11-26 08:39:10.000000000 +0900
+++ ./lib/pnohang.c	2014-03-11 15:36:46.000000000 +0900
@@ -52,7 +52,7 @@
 	printf("message is %s\n", message);
 	printf("arguments are %s", args);*/
 
-	if ((ofd = open(outfile, O_CREAT|O_TRUNC|O_WRONLY, 0600)) == -1)
+	if ((ofd = open(outfile, O_CREAT|O_TRUNC|O_WRONLY, 0640)) == -1)
 		err(1, "open");
 
 	if (dup2(ofd, STDOUT_FILENO) == -1)
