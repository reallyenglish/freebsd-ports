# $FreeBSD$

PORTNAME=	ruby-build
PORTVERSION=	20150116
CATEGORIES=	devel ruby
MASTER_SITES=	GH

MAINTAINER=	fmb@onibox.net
COMMENT=	Compile and install different ruby versions

LICENSE=	RUBY-BUILD
LICENSE_NAME=	Sam Stephenson
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=${_LICENSE_PERMS_DEFAULT}

RUN_DEPENDS=	autoconf>0:${PORTSDIR}/devel/autoconf \
		curl:${PORTSDIR}/ftp/curl \
		gmake:${PORTSDIR}/devel/gmake

USE_GCC=	4.6

OPTIONS_DEFINE=	RBENV
RBENV_DESC=	Install rbenv for installation support
OPTIONS_DEFAULT=	RBENV

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MRBENV}
RUN_DEPENDS+=	rbenv:${PORTSDIR}/devel/rbenv
.endif

USE_GITHUB=	yes
GH_ACCOUNT=	sstephenson
GH_COMMIT=	e12b960
GH_TAGNAME=	v${PORTVERSION}

NO_BUILD=	yes

PLIST_FILES=	bin/ruby-build \
		libexec/rbenv-install \
		libexec/rbenv-uninstall
PORTDATA=	*

ADDITIONAL_DEFINITIONS=	1.9.3-p551 2.0.0-p598 2.1.5

post-patch:
.for F in ${ADDITIONAL_DEFINITIONS}
	${CP} ${FILESDIR}/${F} ${WRKSRC}/share/ruby-build/
.endfor

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/ruby-build ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/rbenv-install ${STAGEDIR}${PREFIX}/libexec
	${INSTALL_SCRIPT} ${WRKSRC}/bin/rbenv-uninstall ${STAGEDIR}${PREFIX}/libexec
	@${MKDIR} ${STAGEDIR}${DATADIR}
	( cd ${WRKSRC}/share/ruby-build && ${COPYTREE_BIN} \* ${STAGEDIR}${DATADIR} )

.include <bsd.port.mk>
