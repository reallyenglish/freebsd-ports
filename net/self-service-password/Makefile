# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

PORTNAME=	self-service-password
PORTVERSION=	0.8
CATEGORIES=	net
MASTER_SITES=	http://tools.ltb-project.org/attachments/download/497/
DISTNAME=	ltb-project-${PORTNAME}-${PORTVERSION}

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	PHP application to change password in an LDAP directory

LICENSE=	GPLv2

WRKSRC=		${WRKDIR}/${DISTNAME}

USE_PHP=	hash ldap mcrypt

NO_BUILD=	yes
PLIST_SUB+=	WWWOWN=${WWWOWN} WWWGRP=${WWWGRP}

do-install:
	@${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${WWWDIR}
#	@cd ${WRKSRC} && ${COPYTREE_SHARE} lib ${WWWDIR}
#	@cd ${WRKSRC} && ${COPYTREE_SHARE} public_html ${WWWDIR}
#	@${MKDIR} ${WWWDIR}/posts
#	@${CHOWN} ${WWWOWN}:${WWWGRP} ${WWWDIR}/posts

.include <bsd.port.mk>
