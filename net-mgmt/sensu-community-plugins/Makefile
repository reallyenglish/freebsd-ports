# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	sensu-community-plugins
PORTVERSION=	0.0.1
PORTREVISION=	3
CATEGORIES=	net-mgmt
MASTER_SITES=	GH

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Community plugins, extenions, and handlers for sensu

RUN_DEPENDS=	rubygem-sensu-plugin>=0:${PORTSDIR}/net-mgmt/rubygem-sensu-plugin \
	gem:${PORTSDIR}/devel/ruby-gems

NO_BUILD=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	reallyenglish
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	freebsd-support
GH_COMMIT=	b484c0b

OPTIONS_DEFINE=	DOCS

SENSU_LIBEXEC_DIR?=	libexec/sensu
SENSU_PLUGINS_DIR?=	${SENSU_LIBEXEC_DIR}/plugins
SENSU_ETC_DIR?=	etc/sensu
SENSU_EXTENSIONS_DIR?=	${SENSU_ETC_DIR}/extensions
SENSU_HANDLERS_DIR?=	${SENSU_ETC_DIR}/handlers
SENSU_MUTATORS_DIR?=	${SENSU_ETC_DIR}/mutators
PLIST_SUB+=	SENSU_PLUGINS_DIR=${SENSU_PLUGINS_DIR} SENSU_EXTENSIONS_DIR=${SENSU_EXTENSIONS_DIR} SENSU_HANDLERS_DIR=${SENSU_HANDLERS_DIR} SENSU_MUTATORS_DIR=${SENSU_MUTATORS_DIR} SENSU_LIBEXEC_DIR=${SENSU_LIBEXEC_DIR} SENSU_ETC_DIR=${SENSU_ETC_DIR}
_SCRIPT_DIRS=	plugins handlers mutators extensions
PORTDOCS=	README.md

.include <bsd.port.options.mk>

do-install:
	(cd ${WRKSRC}/handlers && find . -type f -name '*.json' -exec mv {} {}.example \;)
	${MKDIR} ${PREFIX}/${SENSU_ETC_DIR}
	${MKDIR} ${PREFIX}/${SENSU_PLUGINS_DIR}
	${MKDIR} ${PREFIX}/${SENSU_EXTENSIONS_DIR}
	${MKDIR} ${PREFIX}/${SENSU_HANDLERS_DIR}
	${MKDIR} ${PREFIX}/${SENSU_MUTATORS_DIR}
	(cd ${WRKSRC}/plugins && ${COPYTREE_BIN} . ${PREFIX}/${SENSU_PLUGINS_DIR})
	(cd ${WRKSRC}/extensions && ${COPYTREE_BIN} . ${PREFIX}/${SENSU_EXTENSIONS_DIR})
	(cd ${WRKSRC}/handlers && ${COPYTREE_BIN} . ${PREFIX}/${SENSU_HANDLERS_DIR})
	(cd ${WRKSRC}/mutators && ${COPYTREE_BIN} . ${PREFIX}/${SENSU_MUTATORS_DIR})

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
.for F in ${PORTDOCS}
	${INSTALL_MAN} ${WRKSRC}/${F} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
