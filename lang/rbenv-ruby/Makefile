# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

.if defined(RUBY_PATCHLEVEL) && !empty(RUBY_PATCHLEVEL)
PORTNAME=	rbenv-ruby${RUBY_VERSION:S/.//g}p${RUBY_PATCHLEVEL}
PORTVERSION=	${RUBY_VERSION}.${RUBY_PATCHLEVEL}
.else
PORTNAME=	rbenv-ruby${RUBY_VERSION:S/.//g}
PORTVERSION=	${RUBY_VERSION}
.endif
PORTREVISION=	3
CATEGORIES=	lang
MASTER_SITES?=	${MASTER_SITE_RUBY:S/$/:ruby/} \
	${RUBYGEM_MASTER_SITES:S/$/:rubygem/}
DISTFILES?=	ruby-${MY_RUBY_VERSION_WITH_PATCHLEVEL}${EXTRACT_SUFX}:ruby \
	rubygems-${RUBYGEM_VERSION}.tgz:rubygem

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT?=	Object-oriented interpreted scripting language

BUILD_DEPENDS=	curl:${PORTSDIR}/ftp/curl \
		autoconf:${PORTSDIR}/devel/autoconf
RUN_DEPENDS=	ruby-build:${PORTSDIR}/devel/ruby-build

LATEST_LINK=	${PKGNAME}
RUBYGEM_MASTER_SITES=	${MASTER_SITE_RUBYGEMS:S/\/gems\//\/rubygems\//}

RUBY_VERSION?=	1.8.7
RUBY_PATCHLEVEL?=	357
RUBYGEM_VERSION?=	1.6.2
DISTINFO_FILE=		${.CURDIR}/distinfo

MY_RUBY_TARGET_ARCH=	${ARCH:S/i386/x86/:S/amd64/x86_64/}
MY_RUBY_VER=	${RUBY_VERSION:C/.[0-9]+$//}

.if defined(RUBY_PATCHLEVEL) && !empty(RUBY_PATCHLEVEL)
MY_RUBY_VERSION_WITH_PATCHLEVEL=	${RUBY_VERSION}-p${RUBY_PATCHLEVEL}
.else
MY_RUBY_VERSION_WITH_PATCHLEVEL=	${RUBY_VERSION}
.endif

# to my surprise, ruby has "ruby lib version" that is not as same as RUBY_VERSION or RUBY_VER
.if ${MY_RUBY_VER} == 1.8
MY_RUBY_LIB_VERSION=	1.8

# 1.8 does not like cc
USE_GCC=	4.6
.elif ${MY_RUBY_VER} == 1.9
MY_RUBY_LIB_VERSION=	1.9.1
.elif ${MY_RUBY_VER} == 2.0
MY_RUBY_LIB_VERSION=	2.0.0
.elif ${MY_RUBY_VER} == 2.1
MY_RUBY_LIB_VERSION=	2.1.0
.else
MY_RUBY_LIB_VERSION=	${MY_RUBY_VER}.0
.endif

# qa-check in poudrier exits with fatal error when USES does not contain
# libtool and '*.la' file exists
USES=	libtool tar:bzip2
PLIST_SUB+=	RUBY_VERSION=${RUBY_VERSION} RUBY_PATCHLEVEL=${RUBY_PATCHLEVEL} MY_RUBY_TARGET_ARCH=${MY_RUBY_TARGET_ARCH}

RBCONFIG?=	rbenv_root/versions/${MY_RUBY_VERSION_WITH_PATCHLEVEL}/lib/ruby/${MY_RUBY_LIB_VERSION}/${MY_RUBY_TARGET_ARCH}-freebsd${OSREL}/rbconfig.rb

do-build:
	${MKDIR} ${WRKSRC}
	${CP} ${FILESDIR}/install.sh ${WRKSRC}/install.sh
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|' -e 's|%%DISTDIR%%|${DISTDIR}|' \
		-e 's|%%WRKDIR%%|${WRKDIR}|' -e 's|%%CC%%|${CC}|' \
		-e 's|%%CFLAGS%%|${CFLAGS}|' ${WRKSRC}/install.sh

do-install:
	# copy an extra patche if exists, which is picked up by install.sh.
	# - configure.in of ruby, even ruby 2.1.x, needs to be patched because
	#   SONAME in shared libs must be defined to create a package with recent
	#   pkg(8). pkg(8) 1.3.8_3 bails out with failed assert when DT_SONAME is
	#   defined but empty.
	${CP} ${FILESDIR}/extra-patches-${MY_RUBY_VERSION_WITH_PATCHLEVEL} ${WRKDIR}/extra-patches || ${TRUE}
	${WRKSRC}/install.sh ${MY_RUBY_VERSION_WITH_PATCHLEVEL}
	${STRIP_CMD} `${FIND} ${PREFIX}/rbenv_root/versions/${MY_RUBY_VERSION_WITH_PATCHLEVEL}/lib/ruby/${MY_RUBY_LIB_VERSION}/${MY_RUBY_TARGET_ARCH}-freebsd${OSREL} -type f -name '*.so'`
	${STRIP_CMD} ${PREFIX}/rbenv_root/versions/${MY_RUBY_VERSION_WITH_PATCHLEVEL}/bin/ruby
	# make portlint happy; ungzippd man page is fatal error
	${GZIP_CMD} ${PREFIX}/rbenv_root/versions/${MY_RUBY_VERSION_WITH_PATCHLEVEL}/share/man/man*/*
	# ruby-build does not respect ${PREFIX}. support ${STAGEDIR} as if it does.
	${TAR} -cf - -C ${PREFIX} rbenv_root | ${TAR} -xf - -C ${STAGEDIR}${PREFIX}
	${RM} -r ${PREFIX}/rbenv_root

post-install:
	${REINPLACE_CMD}  -e 's|/opt/gcc|cc|' ${STAGEDIR}${PREFIX}/${RBCONFIG}
	${RM} ${PREFIX}/${RBCONFIG}.bak
	${SETENV} PKG_PREFIX=${PREFIX} \
	${PKGINSTALL} ${PKGNAME} POST-INSTALL
	# have to do this once again because "rbenv rehash" creates files under
	# ${PREFIX}
	${TAR} -cf - -C ${PREFIX} rbenv_root | ${TAR} -xf - -C ${STAGEDIR}${PREFIX}
	${RM} -r ${PREFIX}/rbenv_root

.include <bsd.port.mk>
