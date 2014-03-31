--- ./lib/chef/encrypted_data_bag_item.rb.orig	2014-03-31 13:02:00.000000000 +0900
+++ ./lib/chef/encrypted_data_bag_item.rb	2014-03-31 13:02:32.000000000 +0900
@@ -36,7 +36,7 @@
 # If the shared secret is not specified at initialization or load,
 # then the contents of the file referred to in
 # Chef::Config[:encrypted_data_bag_secret] will be used as the
-# secret.  The default path is /etc/chef/encrypted_data_bag_secret
+# secret.  The default path is %%PREFIX%%/etc/chef/encrypted_data_bag_secret
 #
 # EncryptedDataBagItem is intended to provide a means to avoid storing
 # data bag items in the clear on the Chef server.  This provides some
@@ -91,7 +91,7 @@
   def self.load_secret(path=nil)
     path ||= Chef::Config[:encrypted_data_bag_secret]
     if !path
-      raise ArgumentError, "No secret specified to load_secret and no secret found at #{Chef::Config.platform_specific_path('/etc/chef/encrypted_data_bag_secret')}"
+      raise ArgumentError, "No secret specified to load_secret and no secret found at #{Chef::Config.platform_specific_path('%%PREFIX%%/etc/chef/encrypted_data_bag_secret')}"
     end
     secret = case path
              when /^\w+:\/\//
