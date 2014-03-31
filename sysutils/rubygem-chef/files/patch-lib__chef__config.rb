--- ./lib/chef/config.rb.orig	2014-03-31 12:59:29.000000000 +0900
+++ ./lib/chef/config.rb	2014-03-31 12:59:45.000000000 +0900
@@ -391,7 +391,7 @@
     # `node_name` of the client.
     #
     # If chef-zero is enabled, this defaults to nil (no authentication).
-    default(:client_key) { chef_zero.enabled ? nil : platform_specific_path("/etc/chef/client.pem") }
+    default(:client_key) { chef_zero.enabled ? nil : platform_specific_path("%%PREFIX%%/etc/chef/client.pem") }
 
     # This secret is used to decrypt encrypted data bag items.
     default(:encrypted_data_bag_secret) do
