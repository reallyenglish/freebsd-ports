--- sql/pgpool-walrecrunning/pgpool-walrecrunning.c.orig	2012-02-13 07:43:14 UTC
+++ sql/pgpool-walrecrunning/pgpool-walrecrunning.c
@@ -46,7 +46,15 @@ pgpool_walrecrunning(PG_FUNCTION_ARGS)
 	/* use volatile pointer to prevent code rearrangement */
 	volatile WalRcvData *walrcv = WalRcv;
 
+#if !defined(PG_VERSION_NUM) || (PG_VERSION_NUM < 90300)
 	if (walrcv->walRcvState == WALRCV_RUNNING)
+#else
+    /*
+     * enum WalRcvState of PostgreSQL 9.3 or later, has removed WALRCV_RUNNUNG
+     * state and added WALRCV_STREAMING to indicate walreceiver is streaming.
+     */
+	if (walrcv->walRcvState == WALRCV_STREAMING)
+#endif
 		PG_RETURN_BOOL(true);
 
 	PG_RETURN_BOOL(false);
