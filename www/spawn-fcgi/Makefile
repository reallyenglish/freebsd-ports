# New ports collection makefile for:		spawn-fcgi
# Date created:					17 Mar 2009
# Whom:						genserg@hotmail.com
#
# $FreeBSD$
#

PORTNAME=	spawn-fcgi
PORTVERSION=	1.6.4
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/

MAINTAINER=	rsimmons0@gmail.com
COMMENT=	Spawns fastcgi applications

GNU_CONFIGURE=	yes
USE_RC_SUBR=	spawn-fcgi

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		spawn-fcgi.1

PLIST_FILES=	bin/spawn-fcgi

.include <bsd.port.pre.mk>

SUB_LIST+=	REQUIRE="DAEMON"

.include <bsd.port.post.mk>
