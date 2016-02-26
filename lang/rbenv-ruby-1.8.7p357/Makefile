# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	An object-oriented interpreted scripting language
DISTFILES?=	ruby-${RUBY_VERSION}-p${RUBY_PATCHLEVEL}${EXTRACT_SUFX}:ruby \
	rubygems-${RUBYGEM_VERSION}.tgz:rubygem \
	yaml-0.1.4.tar.gz:pyyaml
MASTER_SITES?=	http://ftp.ruby-lang.org/pub/ruby/:ruby \
	https://rubygems.org/rubygems/:rubygem \
	http://pyyaml.org/download/libyaml/:pyyaml

PLIST=		${.CURDIR}/pkg-plist

MASTERDIR=	${.CURDIR}/../rbenv-ruby

RUBY_VERSION=	1.8.7
RUBY_PATCHLEVEL=	357
RUBYGEM_VERSION=	1.6.2

PLIST_SUB+=	RUBY_PATCHLEVEL=${RUBY_PATCHLEVEL}

.include "${MASTERDIR}/Makefile"
