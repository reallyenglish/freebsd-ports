--- plugins/guests/openbsd/cap/configure_networks.rb.orig	2017-05-15 23:15:21 UTC
+++ plugins/guests/openbsd/cap/configure_networks.rb
@@ -36,15 +36,8 @@ module VagrantPlugins
 
             machine.communicate.sudo("mv /tmp/vagrant-network-entry /etc/hostname.#{ifname}")
 
-            # remove old configurations
-            machine.communicate.sudo("sudo ifconfig #{ifname} inet delete", { error_check: false })
-            machine.communicate.sudo("pkill -f 'dhclient: #{ifname}'", { error_check: false })
-
-            if network[:type].to_sym == :static
-              machine.communicate.sudo("ifconfig #{ifname} inet #{network[:ip]} netmask #{network[:netmask]}")
-            elsif network[:type].to_sym == :dhcp
-              machine.communicate.sudo("dhclient #{ifname}")
-            end
+            # apply new configurations
+            machine.communicate.sudo("sh /etc/netstart #{ifname}")
           end
         end
       end
