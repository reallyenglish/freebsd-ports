--- Makefile.PL.orig	2014-01-17 13:30:00.000000000 +0900
+++ Makefile.PL	2014-01-17 13:32:34.000000000 +0900
@@ -61,9 +61,9 @@
         'version'             => '0',
     },
     NO_META        => 1,
-    VERSION_FROM   => 'check_postgres.pl',
-    EXE_FILES      => ['check_postgres.pl'],
-    MAN1PODS       => { 'check_postgres.pl' => 'blib/man1/check_postgres.1p'},
+    VERSION_FROM   => 'check_postgres',
+    EXE_FILES      => ['check_postgres'],
+    MAN1PODS       => { 'check_postgres' => 'blib/man1/check_postgres.1p'},
     NEEDS_LINKING  => 0,
     NORECURS       => 1,
     PM             => {},
@@ -84,7 +84,7 @@
 critic: all critic-program critic-tests

 critic-program:
-	perlcritic --severity=$(SEVERITY) -profile perlcriticrc check_postgres.pl
+	perlcritic --severity=$(SEVERITY) -profile perlcriticrc check_postgres

 critic-tests:
 	perlcritic --severity=$(SEVERITY) -profile perlcriticrc t/*.t
@@ -96,11 +96,11 @@
     my $string = shift->SUPER::clean(@_);
     $string =~ s{\t}{\tperl t/99_cleanup\.t\n\t};
     $string .= qq{\nsignature_asc : \n};
-    $string .= qq{\t@ gpg --yes -ba check_postgres.pl\n};
+    $string .= qq{\t@ gpg --yes -ba check_postgres\n};
     $string .= qq{\t@ gpg --verify check_postgres.pl.asc\n};
     $string .= qq{\n\nhtml : \n\t};
     $string .= <<'EOM';
-	pod2html check_postgres.pl > check_postgres.pl.html
+	pod2html check_postgres > check_postgres.pl.html
 	@ perl -pi -e "s/<link.*?>//" check_postgres.pl.html
 	@ perl -pi -e "s~ git clone.*~ git clone git://bucardo.org/check_postgres.git</pre>~" check_postgres.pl.html
 	@ perl -pi -e "s~<title>\S+(.+)~<title>check_postgres.pl\\1~" check_postgres.pl.html
--- MANIFEST.orig	2014-01-17 13:36:33.000000000 +0900
+++ MANIFEST	2014-01-17 13:36:41.000000000 +0900
@@ -1,4 +1,4 @@
-check_postgres.pl
+check_postgres
 check_postgres.pl.asc
 check_postgres.pl.html
 README
