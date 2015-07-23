--- ./nvm.sh.orig	2015-05-30 03:11:40.000000000 +0900
+++ ./nvm.sh	2015-07-15 17:02:27.000000000 +0900
@@ -1063,6 +1063,12 @@
     nvm_checksum "$tmptarball" $sum && \
     command tar -xzf "$tmptarball" -C "$tmpdir" && \
     cd "$tmpdir/node-$VERSION" && \
+    if [ -d "$NVM_DIR"/patches/"$VERSION" ]; then
+      for patchfile in "$NVM_DIR"/patches/"$VERSION"/*.patch
+      do
+        patch -p0 < $patchfile
+      done
+    fi && \
     ./configure --prefix="$VERSION_PATH" $ADDITIONAL_PARAMETERS && \
     $make $MAKE_CXX && \
     command rm -f "$VERSION_PATH" 2>/dev/null && \
@@ -1083,8 +1089,10 @@
         nvm_download -L https://npmjs.org/install.sh -o - | clean=yes sh
       fi
     fi
+    rm -fr $tmpdir
   else
     echo "nvm: install $VERSION failed!" >&2
+    rm -fr $tmpdir
     return 1
   fi
 
