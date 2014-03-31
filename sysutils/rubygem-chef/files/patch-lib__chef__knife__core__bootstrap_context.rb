--- ./lib/chef/knife/core/bootstrap_context.rb.orig	2014-03-31 13:03:58.000000000 +0900
+++ ./lib/chef/knife/core/bootstrap_context.rb	2014-03-31 13:04:35.000000000 +0900
@@ -83,7 +83,7 @@
           end
 
           if encrypted_data_bag_secret
-            client_rb << %Q{encrypted_data_bag_secret "/etc/chef/encrypted_data_bag_secret"\n}
+            client_rb << %Q{encrypted_data_bag_secret "%%PREFIX%%/etc/chef/encrypted_data_bag_secret"\n}
           end
 
           client_rb
@@ -92,7 +92,7 @@
         def start_chef
           # If the user doesn't have a client path configure, let bash use the PATH for what it was designed for
           client_path = @chef_config[:chef_client_path] || 'chef-client'
-          s = "#{client_path} -j /etc/chef/first-boot.json"
+          s = "#{client_path} -j %%PREFIX%%/etc/chef/first-boot.json"
           s << " -E #{bootstrap_environment}" if chef_version.to_f != 0.9 # only use the -E option on Chef 0.10+
           s
         end
