# Created by: Muhammad Moinur Rahman <bofh@FreeBSD.org>
# $FreeBSD$

PORTNAME=	pgroonga
PORTVERSION=	2.0.5
CATEGORIES=	databases textproc
MASTER_SITES=	http://packages.groonga.org/source/pgroonga/

MAINTAINER=	bofh@FreeBSD.org
COMMENT=	Open-source fulltext search engine for PostGRESQL

LICENSE=	PostgreSQL

LIB_DEPENDS=	groonga:${PORTSDIR}/textproc/groonga

USES=		gmake pkgconfig
MAKE_ARGS+=	MAKE=gmake
USE_PGSQL=	yes
LLD_UNSAFE=	yes
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	MECAB
MECAB_DESC=	Use MeCab as a tokenizer

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MMECAB}
LIB_DEPENDS+=	mecab:${PORTSDIR}/japanese/mecab
RUN_DEPENDS+=	${LOCALBASE}/lib/mecab/dic/ipadic/matrix.bin:${PORTSDIR}/japanese/mecab-ipadic
.endif

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/postgresql/pgroonga.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/postgresql/pgroonga_check.so

.include <bsd.port.mk>
