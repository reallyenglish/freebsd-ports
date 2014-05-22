# Created by: Mitsuru Y <mitsuruy@reallyenglish.com>
# $FreeBSD$

PORTNAME=	pastebin
PORTVERSION=	0.62
CATEGORIES=	www

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	The original pastebin

LICENSE=	AGPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	lordelph
GH_TAGNAME=	${GH_COMMIT}
GH_COMMIT=	9ffade4

USE_PHP=	yes

NO_BUILD=	yes

PORTDOCS=	*
DOCS=		INSTALL README.md CHANGES UPGRADE

.include <bsd.port.options.mk>

post-extract:
	@cd ${WRKDIR} && ${FIND} . -name .gitignore -delete

do-install:
	@${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} lib ${WWWDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} public_html ${WWWDIR}
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for f in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif
	@${MKDIR} ${WWWDIR}/posts
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${WWWDIR}/posts

.include <bsd.port.mk>
