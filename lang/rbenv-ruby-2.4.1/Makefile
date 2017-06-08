# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	An object-oriented interpreted scripting language

PLIST=		${.CURDIR}/pkg-plist

LIB_DEPENDS=	libyaml.so:${PORTSDIR}/textproc/libyaml \
		libffi.so:${PORTSDIR}/devel/libffi \
		libexecinfo.so:${PORTSDIR}/devel/libexecinfo

MASTERDIR=	${.CURDIR}/../rbenv-ruby


RUBY_VERSION=	2.4.1
RUBY_PATCHLEVEL=
RUBYGEM_VERSION=	2.6.11

PLIST_SUB+=	RUBY_PATCHLEVEL=${RUBY_PATCHLEVEL} \
		RUBY_VERSION=${RUBY_VERSION} \
		MY_RUBY_LIB_VERSION=${MY_RUBY_LIB_VERSION} \
		MY_RUBY_VER=${MY_RUBY_VER}

.include "${MASTERDIR}/Makefile"
