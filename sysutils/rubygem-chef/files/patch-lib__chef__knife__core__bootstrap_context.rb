--- ./lib/chef/knife/core/bootstrap_context.rb.orig	2014-04-17 16:53:49.000000000 +0900
+++ ./lib/chef/knife/core/bootstrap_context.rb	2014-04-17 16:55:38.000000000 +0900
@@ -82,7 +82,7 @@
           end
 
           if encrypted_data_bag_secret
-            client_rb << %Q{encrypted_data_bag_secret "/etc/chef/encrypted_data_bag_secret"\n}
+            client_rb << %Q{encrypted_data_bag_secret "%%PREFIX%%/etc/chef/encrypted_data_bag_secret"\n}
           end
 
           client_rb
@@ -91,7 +91,7 @@
         def start_chef
           # If the user doesn't have a client path configure, let bash use the PATH for what it was designed for
           client_path = @chef_config[:chef_client_path] || 'chef-client'
-          s = "#{client_path} -j /etc/chef/first-boot.json"
+          s = "#{client_path} -j %%PREFIX%%/etc/chef/first-boot.json"
           s << ' -l debug' if @config[:verbosity] and @config[:verbosity] >= 2
           s << " -E #{bootstrap_environment}" if chef_version.to_f != 0.9 # only use the -E option on Chef 0.10+
           s
