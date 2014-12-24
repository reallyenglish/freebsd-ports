# $FreeBSD$

PORTNAME=	varnish
PORTVERSION=	4.0.2
#PORTREVISION=	3
CATEGORIES=	www
MASTER_SITES=	http://repo.varnish-cache.org/source/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Varnish high-performance HTTP accelerator

LICENSE=	BSD2CLAUSE

LIB_DEPENDS=	libpcre.so:${PORTSDIR}/devel/pcre

CONFLICTS=	varnish-2.*

USES=		autoreconf gmake libtool readline pkgconfig python:build
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=${PREFIX} --enable-tests
CONFIGURE_ENV=	RST2MAN=true
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

USE_RC_SUBR=	varnishd varnishlog varnishncsa
SUB_FILES=	pkg-message
.if defined(NO_INET6) || defined(WITHOUT_INET6)
BAD_TESTS+=	r00832
EXTRA_PATCHES+=	${FILESDIR}/no-inet6.patch
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|\$$(libdir)/pkgconfig|\$$(prefix)/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.am
.if defined(BAD_TESTS)
	${RM} -f ${BAD_TESTS:C|.+|${WRKSRC}/bin/varnishtest/tests/\0.vtc|}
.endif

regression-test check test: build
	${MAKE_CMD} TESTS_PARALLELISM=1 -C ${WRKSRC} check

post-build:
	#
	# It is highly recommended, that you verify the build's
	# correctness by performing:
	#
	#	make check
	#
	# now...
	#

post-install:
	${INSTALL} -d ${STAGEDIR}${ETCDIR}
	${MV} ${STAGEDIR}${PORTDOCS}/${DOCSDIR}/example.vcl ${STAGEDIR}${ETCDIR}/example.vcl.sample
	${MV} ${STAGEDIR}${PORTDOCS}/${DOCSDIR}/builtin.vcl ${STAGEDIR}${ETCDIR}/builtin.vcl.sample
	${RM} -r ${STAGEDIR}${DOCSDIR}

.include <bsd.port.pre.mk>

.if ${ARCH} == "arm"
BROKEN=		Does not configure on arm
.endif

.include <bsd.port.post.mk>
