# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	An object-oriented interpreted scripting language
DISTFILES?=	ruby-${RUBY_VERSION}-p${RUBY_PATCHLEVEL}${EXTRACT_SUFX}:ruby \
	rubygems-${RUBYGEM_VERSION}.tgz:rubygem \
	yaml-0.1.4.tar.gz:pyyaml
MASTER_SITES?=	ftp://ftp.ruby-lang.org/pub/ruby/1.9/:ruby \
	http://pyyaml.org/download/libyaml/:pyyaml

PLIST=		${.CURDIR}/pkg-plist

MASTERDIR=	${.CURDIR}/../rbenv-ruby

RUBY_VERSION=	1.8.7
RUBY_PATCHLEVEL=	357
RUBYGEM_VERSION=	1.6.2

PLIST_SUB+=	RUBY_PATCHLEVEL=${RUBY_PATCHLEVEL}

RBCONFIG=	rbenv_root/versions/${RUBY_VERSION}-p${RUBY_PATCHLEVEL}/lib/ruby/1.8/x86_64-freebsd${OSREL}/rbconfig.rb

.include "${MASTERDIR}/Makefile"
