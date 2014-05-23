# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

PORTNAME=	pukiwiki
PORTVERSION=	1.4.7
DISTVERSIONSUFFIX=	_notb_utf8
PORTREVISION=	1
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
PUKIWIKI_WRITEABLES=	attach backup cache counter diff trackback wiki

do-install:
	@${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${PREFIX}/${PUKIWIKIDIR}
.for d in ${PUKIWIKI_WRITEABLES}
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PUKIWIKIDIR}/${d}
.endfor

post-install:
.for d in ${PUKIWIKI_WRITEABLES}
	@${ECHO_CMD} '@exec ${CHOWN} ${WWWOWN}:${WWWGRP} %D/${PUKIWIKIDIR}/${d}' \
		>> ${TMPPLIST}
.endfor

.include <bsd.port.mk>
