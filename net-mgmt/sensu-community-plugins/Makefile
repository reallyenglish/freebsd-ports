# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	sensu-community-plugins
PORTVERSION=	0.0.1
PORTREVISION=	1
CATEGORIES=	net-mgmt
MASTER_SITES=	GH

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Community plugins, extenions, and handlers for sensu

RUN_DEPENDS=	rubygem-sensu-plugin>=0:${PORTSDIR}/net-mgmt/rubygem-sensu-plugin
NO_BUILD=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	sensu
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${GH_COMMIT}
GH_COMMIT=	a8de22f

OPTIONS_DEFINE=	DOCS

SENSU_SCRIPT_DIR+=	libexec/sensu
PLIST_SUB+=	SENSU_SCRIPT_DIR=${SENSU_SCRIPT_DIR}
_SCRIPT_DIRS=	plugins handlers mutators extensions
PORTDOCS=	README.md

.include <bsd.port.options.mk>

do-install:
	${MKDIR} ${PREFIX}/${SENSU_SCRIPT_DIR}
.for D in ${_SCRIPT_DIRS}
	(cd ${WRKSRC} && ${COPYTREE_BIN} ${D} ${PREFIX}/${SENSU_SCRIPT_DIR})
.endfor

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
.for F in ${PORTDOCS}
	${INSTALL_MAN} ${WRKSRC}/${F} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
