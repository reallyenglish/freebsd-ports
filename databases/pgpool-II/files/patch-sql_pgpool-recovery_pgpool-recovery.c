--- sql/pgpool-recovery/pgpool-recovery.c.orig	2012-02-13 07:43:14 UTC
+++ sql/pgpool-recovery/pgpool-recovery.c
@@ -4,7 +4,7 @@
  *
  * pgpool-recovery: exec online recovery script from SELECT statement.
  *
- * Copyright (c) 2003-2010	PgPool Global Development Group
+ * Copyright (c) 2003-2013	PgPool Global Development Group
  *
  * Permission to use, copy, modify, and distribute this software and
  * its documentation for any purpose and without fee is hereby
@@ -29,6 +29,9 @@
 #include "catalog/namespace.h"
 #include "utils/syscache.h"
 #include "utils/builtins.h"		/* PostgreSQL 8.4 needs this for textout */
+#if defined(PG_VERSION_NUM) && (PG_VERSION_NUM >= 90300)
+#include "access/htup_details.h"		/* PostgreSQL 9.3 or later needs this */
+#endif
 
 #define REMOTE_START_FILE "pgpool_remote_start"
 
@@ -198,7 +201,14 @@ get_function_oid(const char *funcname, c
 		oid_v = buildoidvector(NULL, 0);
 	}
 
+#if !defined(PG_VERSION_NUM) || (PG_VERSION_NUM < 90300)
 	nspid = LookupExplicitNamespace(nspname);
+#else
+	/* LookupExplicitNamespace() of PostgreSQL 9.3 or later, has third
+	 * argument "missing_ok" which suppresses ERROR exception, but
+	 * returns invlaid_oid. See include/catalog/namespace.h */
+	nspid = LookupExplicitNamespace(nspname, false);
+#endif
 	elog(DEBUG1, "get_function_oid: oid of \"%s\": %d", nspname, nspid);
 
 	tup = SearchSysCache(PROCNAMEARGSNSP,
