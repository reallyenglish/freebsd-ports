--- plugins/commands/destroy/command.rb.orig	2017-11-02 22:07:17 UTC
+++ plugins/commands/destroy/command.rb
@@ -60,6 +60,10 @@ module VagrantPlugins
         # Nothing was declined
         return 0 if declined == 0
 
+        # Everything was declined, and all states are `not_created`
+        return 0 if declined == machines.length &&
+                    declined == init_states.values.count(:not_created)
+
         # Everything was declined, state was not changed
         return 1 if declined == machines.length
 
