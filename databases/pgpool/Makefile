# Created by: Choe, Cheng-Dae <whitekid@gmail.com>
# $FreeBSD$

PORTNAME=	pgpool
PORTVERSION=	3.4.3
CATEGORIES=	databases
MASTER_SITES=	http://www.pgpool.net/mediawiki/images/
DISTNAME=	${PORTNAME}-II-${DISTVERSION}

MAINTAINER=	ports@toco-domains.de
COMMENT=	Connection pool server for PostgreSQL

LICENSE=	MIT

LIB_DEPENDS=	pq:${PORTSDIR}/databases/postgresql93-client
DATADIR=	${PREFIX}/share/${PORTNAME}-II

USES=		gmake
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

USE_RC_SUBR=	pgpool
CONFLICTS=	pgpool-II-*

PORTDOCS=	AUTHORS ChangeLog NEWS TODO

MAN8=		pgpool.8
OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/$f ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
