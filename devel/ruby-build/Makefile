# $FreeBSD$

PORTNAME=	ruby-build
PORTVERSION=	20140509.1
CATEGORIES=	devel ruby
MASTER_SITES=	GH

MAINTAINER=	fmb@onibox.net
COMMENT=	Compile and install different ruby versions

LICENSE=	RUBY-BUILD
LICENSE_NAME=	Sam Stephenson
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=${_LICENSE_PERMS_DEFAULT}

RUN_DEPENDS=	autoconf:${PORTSDIR}/devel/autoconf \
		curl:${PORTSDIR}/ftp/curl

USE_GCC=	4.6
USES=	gmake

OPTIONS_DEFINE=	RBENV
RBENV_DESC=	Install rbenv for installation support
OPTIONS_DEFAULT=	RBENV

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MRBENV}
RUN_DEPENDS+=	rbenv:${PORTSDIR}/devel/rbenv
.endif

USE_GITHUB=	yes
GH_ACCOUNT=	sstephenson
GH_COMMIT=	9aece39
GH_TAGNAME=	v${PORTVERSION}

NO_BUILD=	yes

PLIST_FILES=	bin/ruby-build \
		libexec/rbenv-install \
		libexec/rbenv-uninstall
PORTDATA=	*

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/ruby-build ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/rbenv-install ${STAGEDIR}${PREFIX}/libexec
	${INSTALL_SCRIPT} ${WRKSRC}/bin/rbenv-uninstall ${STAGEDIR}${PREFIX}/libexec
	@${MKDIR} ${STAGEDIR}${DATADIR}
	( cd ${WRKSRC}/share/ruby-build && ${COPYTREE_BIN} \* ${STAGEDIR}${DATADIR} )

.include <bsd.port.mk>
