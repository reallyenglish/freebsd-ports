--- ./lib/tc_command.pl.orig	2013-11-26 08:39:10.000000000 +0900
+++ ./lib/tc_command.pl	2014-03-11 15:36:46.000000000 +0900
@@ -24,7 +24,7 @@
 # OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 # SUCH DAMAGE.
 #
-# $MCom: portstools/tinderbox/lib/tc_command.pl,v 1.185 2013/10/07 16:36:54 crees Exp $
+# $MCom: portstools/tinderbox/lib/tc_command.pl,v 1.186 2014/03/03 02:16:02 marcus Exp $
 #
 
 my $pb;
@@ -606,7 +606,7 @@
         "tinderbuild" => {
                 help => "Generate packages from an installed Build",
                 usage =>
-                    "-b <build name> [-init] [-cleanpackages] [-updateports] [-skipmake] [-noclean] [-noduds] [-plistcheck] [-nullfs] [-cleandistfiles] [-fetch-original] [-onceonly] [portdir/portname [...]]",
+                    "-b <build name> [-init] [-cleanpackages] [-updateports] [-skipmake] [-noclean] [-noduds] [-plistcheck] [-nullfs] [-cleandistfiles] [-fetch-original] [-onceonly] [-notest] [portdir/portname [...]]",
                 optstr => 'b:',
         },
 
