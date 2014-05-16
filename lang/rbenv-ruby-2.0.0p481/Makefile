# Created by: Ochko L <mitsuruy@reallyenglish.com>
# $FreeBSD$

MAINTAINER=	ochkol@reallyenglish.com
COMMENT=	An object-oriented interpreted scripting language

PLIST=		${.CURDIR}/pkg-plist

LIB_DEPENDS=	yaml-0.2:${PORTSDIR}/textproc/libyaml \
		ffi:${PORTSDIR}/devel/libffi \
		execinfo.1:${PORTSDIR}/devel/libexecinfo

MASTERDIR=	${.CURDIR}/../rbenv-ruby

RUBY_VERSION=	2.0.0
RUBY_PATCHLEVEL=	481
RUBYGEM_VERSION=	2.2.2

PLIST_SUB+=	RUBY_PATCHLEVEL=${RUBY_PATCHLEVEL} \
		RUBY_VERSION=${RUBY_VERSION}

RBCONFIG=	rbenv_root/versions/${RUBY_VERSION}-p${RUBY_PATCHLEVEL}/lib/ruby/2.0.0/x86_64-freebsd${OSREL}/rbconfig.rb

.include "${MASTERDIR}/Makefile"
