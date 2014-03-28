--- ./lib/tc_command.sh.orig	2013-11-26 08:39:10.000000000 +0900
+++ ./lib/tc_command.sh	2014-03-11 15:36:46.000000000 +0900
@@ -24,7 +24,7 @@
 # OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 # SUCH DAMAGE.
 #
-# $MCom: portstools/tinderbox/lib/tc_command.sh,v 1.179 2013/10/19 20:13:08 crees Exp $
+# $MCom: portstools/tinderbox/lib/tc_command.sh,v 1.189 2014/03/02 13:51:40 marcus Exp $
 #
 
 export _defaultUpdateHost="svn.FreeBSD.org"
@@ -107,8 +107,11 @@
 		fetchRc=0
 		tested=0
 		while [ 1 -eq 1 ]; do
-		    ${fetchCmd} -s ${fetchUrl}/${fetchSets%% *}${fetchSufx} >/dev/null 2>&1
+		    result=$(${fetchCmd} -s ${fetchUrl}/${fetchSets%% *}${fetchSufx} 2>/dev/null)
 		    fetchRc=$?
+		    if [ x"${result}" = x"Unknown" ]; then
+			fetchRc=1
+		    fi
 		    if [ ${fetchRc} -ne 0 ]; then
 			fetchUrl="${updateProtocol}://${4}/pub/FreeBSD/releases/${updateArch}/${updateArch}/${5}"
 		    else
@@ -428,9 +431,9 @@
 #---------------------------------------------------------------------------
 
 Upgrade () {
-    VERSION="4.0.0"
+    VERSION="4.0.1"
     TINDERBOX_URL="http://tinderbox.marcuscom.com/"
-    DB_MIGRATION_PATH="3.3 ${VERSION}"
+    DB_MIGRATION_PATH="3.3 4.0.0 ${VERSION}"
 
     bkup_file=""
 
@@ -1284,11 +1287,12 @@
 	return 1
     fi
 
+    tc=$(tinderLoc scripts tc)
     portstree=$(${tc} getPortsTreeForBuild -b ${build})
     sleepName=$(echo ${portDir} | sed -e 'y/\//_/')
     buildPortFullDir=${buildRoot}/usr/ports/${portDir}
     portsTreeDir=$(tinderLoc portstree ${portstree})
-    portFullDir=${portsTreeDir}/${portDir}
+    portFullDir=${portsTreeDir}/ports/${portDir}
 
     if [ ! -d ${portFullDir} ]; then
 	echo "enterBuild: Build environment does not exist yet, sleeping."
@@ -1312,7 +1316,7 @@
 	sleep 15
     done
 
-    echo 
+    [ -t 0 ] && echo 
     cp $(tinderLoc scripts lib/enterbuild) ${buildRoot}/root
     chroot ${buildRoot} /root/enterbuild ${portDir}
     rm -f ${buildRoot}/tmp/.sleep_${sleepName}
@@ -1338,6 +1342,7 @@
 makeBuild () {
     # set up defaults
     buildName=""
+    trim=""
 
     # argument handling
     while getopts b: arg >/dev/null 2>&1
@@ -1391,7 +1396,9 @@
 	    read MD_UNIT </tmp/tinderbuild_md.${build}
 
 	    if [ "${MD_FSTYPE}" = "ufs" ]; then
-		newfs -m 0 -o time /dev/${MD_UNIT}
+		# Use TRIM for md if it is available
+		newfs 2>&1 | grep -q -- '-t enable TRIM' && trim=-t
+		newfs -m 0 -o time ${trim} /dev/${MD_UNIT}
 		mount /dev/${MD_UNIT} ${BUILD_DIR}
 	    else
 		zpool create ${MD_UNIT} /dev/${MD_UNIT}
@@ -1563,7 +1570,7 @@
 		if [ "${MD_FSTYPE}" = "ufs" ]; then
 		    umount -f /dev/${MD_UNIT}
 		else
-		    zpool destroy ${MD_UNIT}
+		    zpool destroy -f ${MD_UNIT}
 		fi
 		mdconfig -d -u ${MD_UNIT}
 	    fi
@@ -1590,7 +1597,7 @@
     rm -f "/tmp/tb_pipe0.${build}_${date}"
     rm -f "/tmp/tb_pipe1.${build}_${date}"
     rm -f "/tmp/tb_pipe2.${build}_${date}"
-    echo 
+    [ -t 0 ] && echo 
 
     exit $1
 }
@@ -1756,7 +1763,7 @@
     esac
     echo "$(env LANG=C date -u -j -r ${duration} | awk '{print $4}')"
 
-    echo $(echo $(ls -1 ${pkgDir}/All | wc -l) - 1 | bc) "packages built"
+    echo $(echo $(ls -1 ${pkgDir}/All | wc -l) - 1 | bc) "package(s) built"
     echo $(echo $(du -sh ${pkgDir} | awk '{print $1}')) " of packages"
 }
 
@@ -1844,6 +1851,7 @@
 	x-nolog)		pbargs="${pbargs} -nolog";;
 	x-nullfs)		pbargs="${pbargs} -nullfs"; nullfs="-n";;
 	x-plistcheck)		pbargs="${pbargs} -plistcheck";;
+        x-notest)               pbargs="${pbargs} -notest";;
 	x-onceonly)		onceonly=1;;
 
 	-*)			return 1;;
@@ -1965,6 +1973,11 @@
     fi
 
     tinderbuild_setup
+    execute_hook "preTinderbuild" "BUILD=${build} JAIL=${jail} PORTSTREE=${portstree} \"PORTS=${ports}\" PB=${pb}"
+    if [ $? -ne 0 ]; then
+	echo "tinderbuild: hook preTinderbuild failed.  Terminating."
+	tinderbuild_cleanup 1
+    fi
 
     # Create Makefile if required
     if [ ${skipmake} -eq 0 ]; then
@@ -1975,6 +1988,7 @@
 	(
 	    export PORTBUILD_ARGS="$(echo ${pbargs})"
 	    buildenvNoHost ${build}
+	    unset __MAKE_CONF
 	    HOST_WORKDIR=$(${tc} configGet | \
 		awk -F= '/^HOST_WORKDIR/ {print $2}')
 	    env PORTSDIR=/a/ports \
@@ -2000,8 +2014,14 @@
 	if [ ${error} -ne 0 ] ; then
 	    tinderbuild_setup
 	fi
+	if [ $? -ne 0 ]; then
+	    echo "tinderbuild: hook preTinderbuild failed.  Terminating."
+	    tinderbuild_cleanup 1
+	fi
 	tinderbuild_phase 1 ${jobs} ${pkgDir}
+	error=$?
     fi
+    execute_hook "postTinderbuild" "BUILD=${build} JAIL=${jail} PORTSTREE=${portstree} \"PORTS=${ports}\" PB=${pb} RC=${error}"
     tinderbuild_cleanup 0
 }
 
@@ -2015,7 +2035,7 @@
 	mkdir -p ${pb}/${dir}
     done
 
-    read -p "Enter a default cvsup host [${_defaultUpdateHost}]: " host
+    read -p "Enter a default update host [${_defaultUpdateHost}]: " host
     if [ -z "${host}" ]; then
 	host=${_defaultUpdateHost}
     fi
@@ -2090,6 +2110,7 @@
     fi
     if ! requestMount -t buildsrc -b ${build} -r -n; then
 	echo "addPortToBuild: cannot mount base source inside ${build}"
+	addPortToBuild_cleanup ${jail} ${portsTree} ${build}
 	exit 1
     fi
 
@@ -2111,15 +2132,18 @@
 	if ! requestMount -t buildoptions -b ${build} \
 		-s $(tinderLoc options ${build}) -n; then
 	    echo "addPortToBuild: cannot mount options inside ${build}"
+	    addPortToBuild_cleanup ${jail} ${portsTree} ${build}
 	    exit 1
 	fi
     fi
 
     export PORTSDIR=/a/ports
+    unset __MAKE_CONF
     export CHROOT=$(tinderLoc buildroot ${build})
 
     if [ -n "${portDir}" ] && [ ! -d ${CHROOT}/${PORTSDIR}/${portDir} ]; then
         echo "addPort: Unknown port ${portDir}"
+	addPortToBuild_cleanup ${jail} ${portsTree} ${build}
         exit 1
     fi
 
@@ -2219,7 +2243,14 @@
 
 	for build in ${allBuilds}
 	do
+	    execute_hook "preAddPort" "BUILD=${build} PORTDIR=${portDir} PB=${pb} OPTIONS=${options} NORECURSE=${norecurse} CLEANOPTIONS=${cleanOptions}"
+	    if [ $? -ne 0 ]; then
+		echo "addPort: hook preAddPort failed.  Continuing."
+		continue
+	    fi
 	    addPortToBuild ${build} ${portDir} "${norecurse}" ${options} ${cleanOptions}
+	    rc=$?
+	    execute_hook "postAddPort" "BUILD=${build} PORTDIR=${portDir} RC=${rc} TB=${tb}"
 	done
     else
 	if ! tcExists Builds ${build}; then
@@ -2227,7 +2258,14 @@
 	    return 1
 	fi
 
+	execute_hook "preAddPort" "BUILD=${build} PORTDIR=${portDir} PB=${pb} OPTIONS=${options} NORECURSE=${norecurse} CLEANOPTIONS=${cleanOptions}"
+	if [ $? -ne 0 ]; then
+	    echo "addPort: hook preAddPort failed.  Terminating."
+	    return 1
+	fi
 	addPortToBuild ${build} ${portDir} "${norecurse}" ${options} ${cleanOptions}
+	rc=$?
+	execute_hook "postAddPort" "BUILD=${build} PORTDIR=${portDir} RC=${rc} TB=${tb}"
     fi
 
     return 0
