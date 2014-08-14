--- ./lib/chef/provider/service/freebsd.rb.orig	2014-08-14 17:19:01.000000000 +0900
+++ ./lib/chef/provider/service/freebsd.rb	2014-08-14 17:19:47.000000000 +0900
@@ -33,7 +33,9 @@
           @rcd_script_found = true
           @enabled_state_found = false
           # Determine if we're talking about /etc/rc.d or /usr/local/etc/rc.d
-          if ::File.exists?("/etc/rc.d/#{current_resource.service_name}")
+          if ::File.exists?(default_init_command)
+            @init_command = default_init_command
+          elsif ::File.exists?("/etc/rc.d/#{current_resource.service_name}")
             @init_command = "/etc/rc.d/#{current_resource.service_name}"
           elsif ::File.exists?("/usr/local/etc/rc.d/#{current_resource.service_name}")
             @init_command = "/usr/local/etc/rc.d/#{current_resource.service_name}"
