# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	grafana
PORTVERSION=	1.5.4
#PORTREVISION=	0
#PORTEPOCH=	0
CATEGORIES=	www sysutils

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Beautiful, easy to use and feature rich Graphite dashboard

USE_GITHUB=	Yes
GH_ACCOUNT=	grafana
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	v${PORTVERSION}
GH_COMMIT=	d8e2192

NO_BUILD=	Yes

do-install:
.if defined(STAGEDIR)
	${MKDIR} ${STAGEDIR}/${WWWDIR}
	( cd ${WRKDIR} && ${COPYTREE_SHARE} . ${STAGEDIR}/${WWWDIR} )
.else
	${MKDIR} ${WWWDIR}
	( cd ${WRKSRC} && ${COPYTREE_SHARE} . ${WWWDIR} )
.endif

.include <bsd.port.mk>
