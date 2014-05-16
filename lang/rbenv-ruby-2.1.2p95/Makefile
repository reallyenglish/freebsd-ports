# Created by: Ochko L <mitsuruy@reallyenglish.com>
# $FreeBSD$

MAINTAINER=	ochkol@reallyenglish.com
COMMENT=	An object-oriented interpreted scripting language

PLIST=		${.CURDIR}/pkg-plist

LIB_DEPENDS=	yaml-0.2:${PORTSDIR}/textproc/libyaml \
		ffi:${PORTSDIR}/devel/libffi \
		execinfo.1:${PORTSDIR}/devel/libexecinfo

MASTERDIR=	${.CURDIR}/../rbenv-ruby

BUILD_DEPENDS=	curl:${PORTSDIR}/ftp/curl
RUN_DEPENDS=	ruby-build:${PORTSDIR}/devel/ruby-build

LATEST_LINK=	${PKGNAME}

RUBY_VERSION=	2.1.2
RUBY_PATCHLEVEL=	95
RUBYGEM_VERSION=	2.2.2
RUBY_BASE_VERSION=	2.1.0
RBENV_VERSION=	2.2.2

DISTINFO_FILE=		${.CURDIR}/distinfo

PORTNAME=	rbenv-ruby
PORTVERSION=	${RUBY_VERSION}.${RUBY_PATCHLEVEL}
CATEGORIES=	lang

DISTFILES?=	ruby-${RUBY_VERSION}${EXTRACT_SUFX}:ruby \
	rubygems-${RUBYGEM_VERSION}.tgz:rubygem
MASTER_SITES?=	${MASTER_SITE_RUBY:S/$/:ruby/} \
	${RUBYGEM_MASTER_SITES:S/$/:rubygem/}

RUBYGEM_MASTER_SITES= ${MASTER_SITE_RUBYGEMS:S/\/gems\//\/rubygems\//}

PLIST_SUB+=	RUBY_BASE_VERSION=${RUBY_BASE_VERSION} \
		RBENV_VERSION=${RUBY_VERSION}

RBCONFIG=	rbenv_root/versions/${RUBY_VERSION}/lib/ruby/${RUBY_BASE_VERSION}/x86_64-freebsd${OSREL}/rbconfig.rb

do-build:
	${MKDIR} ${WRKSRC}
	${CP} ${FILESDIR}/install.sh ${WRKSRC}/install.sh
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|' -e 's|%%DISTDIR%%|${DISTDIR}|' ${WRKSRC}/install.sh

do-install:
	${FIND} ${WRKSRC}
	${WRKSRC}/install.sh ${RUBY_VERSION}

post-install:
	${REINPLACE_CMD}  -e 's|/opt/gcc|cc|' ${PREFIX}/${RBCONFIG}
	${RM} ${PREFIX}/${RBCONFIG}.bak
	@${SETENV} PKG_PREFIX=${PREFIX} \
	${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.mk>
