# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

PORTNAME=	pukiwiki
PORTVERSION=	1.4.7
DISTVERSIONSUFFIX=	_notb_utf8
PORTREVISION=	4
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_JP}
MASTER_SITE_SUBDIR=	pukiwiki/12957

PATCH_SITES=	http://program.sagasite.info/wiki/
PATCHFILES=	index.php\?plugin=attach\&pcmd=open\&refer=PukiWiki\&file=${DISTNAME}-PHP5.4_debug.zip

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	A Wiki-Engine which is based on the YukiWiki specification

LICENSE=	GPLv2

USE_UNZIP=	yes
USE_PHP=	mbstring
WANT_PHP_WEB=	yes

NO_BUILD=	yes

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

PUKIWIKI_PATCHES=	patch-plugin__ls2.inc.php \
			patch-skin__pukiwiki.skin.php \
			patch-skin__pukiwiki.css.php

do-patch:
	@cd ${WRKSRC} && ${UNZIP_CMD} -o -j -d lib ${DISTDIR}/${PATCHFILES}
.for p in ${PUKIWIKI_PATCHES}
	${PATCH} ${PATCH_ARGS} < ${PATCHDIR}/${p}
.endfor

post-patch:
	@${FIND} ${WRKSRC} -name \*.orig -exec ${RM} \{} \;

do-install:
	@${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${PREFIX}/${PUKIWIKIDIR}
.for d in ${PUKIWIKI_WRITEABLES}
	@${CHOWN} -R ${WWWOWN}:${WWWGRP} ${PREFIX}/${PUKIWIKIDIR}/${d}
.endfor

post-install:
.for d in ${PUKIWIKI_WRITEABLES}
	@${ECHO_CMD} '@exec ${CHOWN} -R ${WWWOWN}:${WWWGRP} %D/${PUKIWIKIDIR}/${d}' \
		>> ${TMPPLIST}
.endfor

.include <bsd.port.mk>
