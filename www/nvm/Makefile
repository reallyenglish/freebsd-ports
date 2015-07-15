# $FreeBSD$

PORTNAME=	nvm
PORTVERSION=	0.25.4
CATEGORIES=	www
MASTER_SITES=	GH
DISTNAME=	${GH_ACCOUNT}-${GH_PROJECT}-${PORTVERSION}-${GH_COMMIT}

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	Node Version Manager

LICENSE=	MIT

RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash \
		curl:${PORTSDIR}/ftp/curl

USE_GITHUB=	yes
GH_ACCOUNT=	creationix
GH_COMMIT=	d78722b
GH_TAGNAME=	${GH_COMMIT}

NVM_DIR?=	nvm

PLIST_SUB+=	NVMDIR=${NVM_DIR}

NO_BUILD=	yes

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} "s|/bin/bash|${PREFIX}/bin/bash|" ${WRKSRC}/nvm-exec

do-install:
	@${MKDIR} ${PREFIX}/${NVM_DIR}
	@${MKDIR} ${PREFIX}/${NVM_DIR}/patches
	${INSTALL_DATA} ${WRKSRC}/nvm.sh ${PREFIX}/${NVM_DIR}
	${INSTALL_SCRIPT} ${WRKSRC}/nvm-exec ${PREFIX}/${NVM_DIR}
	for v in `${LS} -d ${FILESDIR}/v*`; do \
		${MKDIR} ${PREFIX}/${NVM_DIR}/patches/`${BASENAME} $$v`; \
		for i in `${LS} $$v/*.patch`; do \
			${INSTALL_DATA} $$i ${PREFIX}/${NVM_DIR}/patches/`${BASENAME} $$v`/`${BASENAME} $$i`;	\
		done; \
	done

.include <bsd.port.post.mk>
