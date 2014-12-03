# Created by: Ochko L <mitsuruy@reallyenglish.com>
# $FreeBSD$

MAINTAINER=	ochkol@reallyenglish.com
COMMENT=	An object-oriented interpreted scripting language

PLIST=		${.CURDIR}/pkg-plist

LIB_DEPENDS=	libyaml.so:${PORTSDIR}/textproc/libyaml \
		libffi.so:${PORTSDIR}/devel/libffi \
		libexecinfo.so:${PORTSDIR}/devel/libexecinfo

MASTERDIR=	${.CURDIR}/../rbenv-ruby


RUBY_VERSION=	2.1.5
RUBYGEM_VERSION=	2.2.2

PLIST_SUB+=	RUBY_PATCHLEVEL=${RUBY_PATCHLEVEL} \
		RUBY_VERSION=${RUBY_VERSION}
.include "${MASTERDIR}/Makefile"
