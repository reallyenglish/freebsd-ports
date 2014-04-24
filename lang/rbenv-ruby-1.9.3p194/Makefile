# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	An object-oriented interpreted scripting language
DISTFILES?=	ruby-${RUBY_VERSION}-p${RUBY_PATCHLEVEL}${EXTRACT_SUFX}:ruby \
	yaml-0.1.4.tar.gz:pyyaml
MASTER_SITES?=	ftp://ftp.ruby-lang.org/pub/ruby/1.9/:ruby \
	http://pyyaml.org/download/libyaml/:pyyaml

PLIST=		${.CURDIR}/pkg-plist

LIB_DEPENDS=	yaml-0.2:${PORTSDIR}/textproc/libyaml

PLIST=		${.CURDIR}/pkg-plist

MASTERDIR=	${.CURDIR}/../rbenv-ruby

RUBY_VERSION=	1.9.3
RUBY_PATCHLEVEL=	194

RBCONFIG=	rbenv_root/versions/1.9.3-p194/lib/ruby/1.9.1/x86_64-freebsd${OSREL}/rbconfig.rb

.include "${MASTERDIR}/Makefile"
