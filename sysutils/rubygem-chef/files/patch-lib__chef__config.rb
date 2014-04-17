--- ./lib/chef/config.rb.orig	2014-04-17 16:53:49.000000000 +0900
+++ ./lib/chef/config.rb	2014-04-17 16:53:53.000000000 +0900
@@ -391,7 +391,7 @@
     # `node_name` of the client.
     #
     # If chef-zero is enabled, this defaults to nil (no authentication).
-    default(:client_key) { chef_zero.enabled ? nil : platform_specific_path("/etc/chef/client.pem") }
+    default(:client_key) { chef_zero.enabled ? nil : platform_specific_path("%%PREFIX%%/etc/chef/client.pem") }
 
     # This secret is used to decrypt encrypted data bag items.
     default(:encrypted_data_bag_secret) do
