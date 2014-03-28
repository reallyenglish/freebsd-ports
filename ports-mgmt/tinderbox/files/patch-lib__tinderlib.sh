--- ./lib/tinderlib.sh.orig	2013-11-26 08:39:10.000000000 +0900
+++ ./lib/tinderlib.sh	2014-03-11 15:36:46.000000000 +0900
@@ -23,7 +23,7 @@
 # OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 # SUCH DAMAGE.
 #
-# $MCom: portstools/tinderbox/lib/tinderlib.sh,v 1.87 2013/11/23 19:45:45 marcus Exp $
+# $MCom: portstools/tinderbox/lib/tinderlib.sh,v 1.89 2014/03/10 03:13:24 marcus Exp $
 #
 
 tinderLocJail () {
@@ -689,7 +689,12 @@
     error=0
     missing=""
 
-    use_pkgng=$(make -f /usr/ports/Mk/bsd.port.mk -VWITH_PKGNG)
+    tfile=$(mktemp -q make_conf.XXXXX)
+    if [ $? -ne 0 ]; then
+	echo "ERROR: Failed to generate temp file for dependency checking"
+	exit 1
+    fi
+    use_pkgng=$(make -f ${tfile} -VWITH_PKGNG)
 
     for r in ${reqs} ; do
         if [ -n "${use_pkgng}" ]; then 
@@ -837,7 +842,7 @@
 	missing=$(checkPreReqs ${DB_OPT_PREREQS})
 
 	if [ $? = 1 ]; then
-	    tinderEcho "WARN: The following option dependencies are missing.  These are required to use the Tinderbox web front-end."
+	    tinderEcho "WARN: The following optional dependencies are missing.  These are required to use the Tinderbox web front-end."
 	    tinderEcho "WARN:     ${missing}"
 	fi
     fi
