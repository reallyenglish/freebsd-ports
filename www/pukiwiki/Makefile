# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

PORTNAME=	pukiwiki
PORTVERSION=	1.4.7
DISTVERSIONSUFFIX=	_notb_utf8
CATEGORIES=	www
MASTER_SITES=	http://www.pmwiki.org/pub/pmwiki/
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_JP}
MASTER_SITE_SUBDIR=	pukiwiki/12957

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	A Wiki-Engine which is based on the YukiWiki specification

LICENSE=	GPLv2

USE_PHP=	mbstring
WANT_PHP_WEB=	yes

NO_BUILD=	yes

FETCH_ARGS=	-pRr
PLIST_SUB+=	PUKIWIKIDIR=${PUKIWIKIDIR}
SUB_LIST+=	PUKIWIKIDIR=${PUKIWIKIDIR}

pre-fetch:
.if !defined(PUKIWIKIDIR)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Define PUKIWIKIDIR (now: ${PUKIWIKIDIR})"
	@${ECHO_MSG} "to override default: www/pukiwiki".
	@${ECHO_MSG} ""
.endif

PUKIWIKIDIR?=	www/pukiwiki

CPIOFLAGS=	--quiet -pdm -R ${WWWOWN}:${WWWGRP}

do-install:
	@${MKDIR} -m 755 ${PREFIX}/${PUKIWIKIDIR}
	@cd ${WRKSRC} && ${FIND} . | \
		${CPIO} ${CPIOFLAGS} ${PREFIX}/${PUKIWIKIDIR}
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PUKIWIKIDIR}

.include <bsd.port.mk>
