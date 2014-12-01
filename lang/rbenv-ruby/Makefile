# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

PORTNAME=	rbenv-ruby
PORTVERSION=	${RUBY_VERSION}.${RUBY_PATCHLEVEL}
#PORTREVISION=	1
CATEGORIES=	lang
MASTER_SITES?=	${MASTER_SITE_RUBY:S/$/:ruby/} \
	${RUBYGEM_MASTER_SITES:S/$/:rubygem/}
DISTFILES?=	ruby-${RUBY_VERSION}-p${RUBY_PATCHLEVEL}${EXTRACT_SUFX}:ruby \
	rubygems-${RUBYGEM_VERSION}.tgz:rubygem

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT?=	Object-oriented interpreted scripting language

BUILD_DEPENDS=	curl:${PORTSDIR}/ftp/curl
RUN_DEPENDS=	ruby-build:${PORTSDIR}/devel/ruby-build

LATEST_LINK=	${PKGNAME}
RUBYGEM_MASTER_SITES=	${MASTER_SITE_RUBYGEMS:S/\/gems\//\/rubygems\//}

RUBY_VERSION?=	1.8.7
RUBY_PATCHLEVEL?=	357
RUBYGEM_VERSION?=	1.6.2
DISTINFO_FILE=		${.CURDIR}/distinfo

MY_RUBY_TARGET_ARCH=	${ARCH:S/i386/x86/:S/amd64/x86_64/}
MY_RUBY_VER=	${RUBY_VERSION:C/.[0-9]+$//}
RBCONFIG?=	rbenv_root/versions/${RUBY_VERSION}-p${RUBY_PATCHLEVEL}/lib/ruby/${MY_RUBY_VER}/${MY_RUBY_TARGET_ARCH}-freebsd${OSREL}/rbconfig.rb

do-build:
	${MKDIR} ${WRKSRC}
	${CP} ${FILESDIR}/install.sh ${WRKSRC}/install.sh
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|' -e 's|%%DISTDIR%%|${DISTDIR}|' -e 's|%%WRKDIR%%|${WRKDIR}|' ${WRKSRC}/install.sh

do-install:
	# copy an extra patche if exists, which is picked up by install.sh.
	# - configure.in of ruby, even ruby 2.1.x, needs to be patched because
	#   SONAME in shared libs must be defined to create a package with recent
	#   pkg(8). pkg(8) 1.3.8_3 bails out with failed assert when DT_SONAME is
	#   defined but empty.
	${CP} ${FILESDIR}/extra-patches-${RUBY_VERSION}-p${RUBY_PATCHLEVEL} ${WRKDIR}/extra-patches || ${TRUE}
	${WRKSRC}/install.sh ${RUBY_VERSION}-p${RUBY_PATCHLEVEL}
	${STRIP_CMD} ${PREFIX}/rbenv_root/versions/${RUBY_VERSION}-p${RUBY_PATCHLEVEL}/lib/ruby/${MY_RUBY_VER}/${MY_RUBY_TARGET_ARCH}-freebsd${OSREL}/*.so
	${STRIP_CMD} ${PREFIX}/rbenv_root/versions/${RUBY_VERSION}-p${RUBY_PATCHLEVEL}/lib/ruby/${MY_RUBY_VER}/${MY_RUBY_TARGET_ARCH}-freebsd${OSREL}/*/*.so
	${STRIP_CMD} ${PREFIX}/rbenv_root/versions/${RUBY_VERSION}-p${RUBY_PATCHLEVEL}/bin/ruby
	# make portlint happy; ungzippd man page is fatal error
	${GZIP_CMD} ${PREFIX}/rbenv_root/versions/${RUBY_VERSION}-p${RUBY_PATCHLEVEL}/share/man/man*/*
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
