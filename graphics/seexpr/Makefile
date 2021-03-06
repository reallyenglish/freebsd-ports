# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>
# $FreeBSD$

PORTNAME=	seexpr
DISTVERSION=	1.0.1.2015.08.29
PORTREVISION=	1
CATEGORIES=	graphics math

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	Embeddable expression evaluation language

LICENSE=	APACHE20

USE_GITHUB=	yes
GH_ACCOUNT=	wdas
GH_TAGNAME=	36ffb818b8

USES=		bison cmake compiler:c++0x pyqt:4 python
USE_PYQT=	gui_build
USE_QT4=	moc_build qmake_build rcc_build uic_build gui opengl

WRKSRC=		${WRKDIR}/SeExpr-${GH_TAGNAME_EXTRACT}

CXXFLAGS+=	-I${LOCALBASE}/include

.if ${MACHINE_CPU:Msse41}
CMAKE_ARGS+=	-DUSE_SSE41:BOOL=ON
.endif

.include <bsd.port.pre.mk>

# base flex(1) v2.5.4 is not sufficient
.if ${OSVERSION} < 1000033
BUILD_DEPENDS+=	${LOCALBASE}/bin/flex:textproc/flex
.endif

post-patch:
	@${REINPLACE_CMD} -e '/<alloca\.h>/d' ${WRKSRC}/src/SeExpr/SePlatform.h
	@${REINPLACE_CMD} -e 's, "dl",,' ${WRKSRC}/src/SeExpr/CMakeLists.txt
.if ${OSVERSION} < 1000033
	@${REINPLACE_CMD} -e '/COMMAND/s,flex,${LOCALBASE}/bin/&,' \
		${WRKSRC}/src/build/macros.cmake
.endif

.include <bsd.port.post.mk>
