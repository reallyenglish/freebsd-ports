--- ./setup.py.orig	2014-03-01 14:14:49.000000000 +0900
+++ ./setup.py	2014-03-06 11:58:13.000000000 +0900
@@ -16,7 +16,7 @@
 storage_dirs = []
 
 for subdir in ('whisper', 'ceres', 'rrd', 'log', 'log/webapp'):
-  storage_dirs.append( ('storage/%s' % subdir, []) )
+  storage_dirs.append( ('%%GRAPHITE_STORAGE%%/%s' % subdir, []) )
 
 webapp_content = defaultdict(list)
 
