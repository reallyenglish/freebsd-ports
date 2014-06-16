# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

PORTNAME=	self-service-password
PORTVERSION=	0.8
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://tools.ltb-project.org/attachments/download/497/
DISTNAME=	ltb-project-${PORTNAME}-${PORTVERSION}

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	PHP application to change password in an LDAP directory

LICENSE=	GPLv2

WRKSRC=		${WRKDIR}/${DISTNAME}

USE_PHP=	hash ldap mcrypt filter

NO_BUILD=	yes

do-install:
	@${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${WWWDIR}

.include <bsd.port.mk>
