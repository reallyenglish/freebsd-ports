# Created by: Mirko Zinn <mail@derzinn.de>
# $FreeBSD$

PORTNAME=	mongodb
PORTVERSION=	2.2.2
PORTREVISION=	2
CATEGORIES=	databases net
MASTER_SITES=	http://downloads.mongodb.org/src/
DISTNAME=	${PORTNAME}-src-r${PORTVERSION}

MAINTAINER=	mail@derzinn.de
COMMENT=	A NOSQL distributed document-oriented database

LIB_DEPENDS= libboost_system.so:${PORTSDIR}/devel/boost-libs \
		libexecinfo.so:${PORTSDIR}/devel/libexecinfo \
		libnspr4.so:${PORTSDIR}/devel/nspr \
		libpcre.so:${PORTSDIR}/devel/pcre \
		libsnappy.so:${PORTSDIR}/archivers/snappy
ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	"not yet ported to anything other than i386 and amd64"

OPTIONS_DEFINE=	V8
V8_DESC=	Use v8 instead of spider monkey for javascript

CONFLICTS?=	${PORTNAME}-2.[46].*
USES+=	scons compiler:gcc-c++11-lib
MAKE_ARGS+=	--prefix=${PREFIX} --cxx=${CXX} --cpp=${CPP} --use-system-pcre --use-system-snappy --ssl
MAKE_ENV+=	CXXFLAGS="${CXXFLAGS}" LDFLAGS="${LDFLAGS}"
# --use-system-pcre --use-system-snappy --use-system-boost
NO_STAGE=	yes
#MAKE_JOBS_UNSAFE=yes

USERS=	mongodb
GROUPS=	mongodb

USE_RC_SUBR=	mongod

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MV8}
MAKE_ARGS+=	--usev8
LIB_DEPENDS+=	libv8.so:${PORTSDIR}/lang/v8
.else
MAKE_ARGS+=	--usesm --use-system-sm
LIB_DEPENDS+=	libjs.so:${PORTSDIR}/lang/spidermonkey17
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|\["-O3"\]|"${CFLAGS}"|' \
		${WRKSRC}/SConstruct

pre-build:
	rm -r ${WRKSRC}/src/third_party/pcre-8.30
	rm -r ${WRKSRC}/src/third_party/snappy

post-install:
	@if [ ! -f ${PREFIX}/etc/mongodb.conf ]; then \
		${TOUCH} ${PREFIX}/etc/mongodb.conf ; \
	fi

.include <bsd.port.mk>
