--- lib/chef/provider/package/freebsd/pkgng.rb.orig	2014-12-05 08:39:33 UTC
+++ lib/chef/provider/package/freebsd/pkgng.rb
@@ -52,7 +52,13 @@ class Chef
             @new_resource.source ? file_candidate_version : repo_candidate_version
           end
 
-
+          def upgrade_package(name, version)
+            if @current_resource.version
+              shell_out!("pkg install -y#{expand_options(@new_resource.options)} #{name}", :env => { 'LC_ALL' => nil }).status
+            else
+              install_package(name, version)
+            end
+          end
 
           private
 
