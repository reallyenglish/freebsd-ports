# Created by: ndewing@experts-exchange.com
# $FreeBSD$

PORTNAME=	mixlib-shellout
PORTVERSION=	1.4.0
PORTREVISION=	2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	nickdewing@gmail.com
COMMENT=	Shell interface that also collects stdout and stderr

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

EXTRA_PATCHES+=	${FILESDIR}/extra-patch-MIXLIB-29-ruby${RUBY_VER}

.include <bsd.port.mk>
