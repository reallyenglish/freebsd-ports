# Created by: Evan Sarmiento <esarmiento@wayfair.com>
# $FreeBSD$

PORTNAME=	graphite-web
PORTVERSION=	0.10.0
PORTEPOCH=	20140305
#PORTREVISION=	1
CATEGORIES=	www python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Enterprise scalable realtime graphing platform

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairo>=1.8.10:${PORTSDIR}/graphics/py-cairo \
		${PYTHON_PKGNAMEPREFIX}carbon>=0:${PORTSDIR}/databases/py-carbon \
		${PYTHON_PKGNAMEPREFIX}django>=1.4:${PORTSDIR}/www/py-django \
		${PYTHON_PKGNAMEPREFIX}django-tagging>=0.3.1:${PORTSDIR}/www/py-django-tagging \
		${PYTHON_PKGNAMEPREFIX}parsing>=0:${PORTSDIR}/devel/py-parsing

USE_PYTHON=	-2.7
USE_PYDISTUTILS=yes
PYDISTUTILS_INSTALLARGS=	-c -O1 # remove --prefix
PYDISTUTILS_EGGINFO=	graphite_web-${PORTVERSION}_alpha-py${PYTHON_VER}.egg-info	# include alpha
PYDISTUTILS_EGGINFODIR=	${GRAPHITE_WEBAPP_ROOT}

USE_GITHUB=	Yes
GH_ACCOUNT=	graphite-project
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${GH_COMMIT}
GH_COMMIT=	834020d

GRAPHITE_ROOT?=	${WWWDIR} 
GRAPHITE_WEBAPP_ROOT?=	${WWWDIR}/webapp
GRAPHITE_STORAGE?=	${WWWDIR}/storage
PLIST_SUB+=	WWWDIR_REL=${WWWDIR_REL}

post-patch:
	@${REINPLACE_CMD} -e 's|%%GRAPHITE_ROOT%%|${GRAPHITE_ROOT}|g' \
		-e 's|%%GRAPHITE_WEBAPP_ROOT%%|${GRAPHITE_WEBAPP_ROOT}|g' \
		-e 's|%%GRAPHITE_STORAGE%%|${GRAPHITE_STORAGE}|g' \
		${WRKSRC}/bin/build-index.sh \
		${WRKSRC}/conf/graphite.wsgi.example \
		${WRKSRC}/setup.cfg \
		${WRKSRC}/setup.py
	@${RM} ${WRKSRC}/bin/build-index.sh.orig
	@${RM} ${WRKSRC}/bin/build-index.sh.bak

post-install:
	${CHOWN} ${WWWOWN} ${GRAPHITE_STORAGE}
	${CHOWN} ${WWWOWN} ${GRAPHITE_STORAGE}/log/webapp
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
