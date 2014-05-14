# Ports collection makefile for:	rubygem-gollum
# Date created:				14 May 2014
# Whom:					Mitsuru Y <mitsuruy@reallyenglish.com>
#
# $FreeBSD$

PORTNAME=	gollum
PORTVERSION=	3.0.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	A simple, Git-powered wiki

RUN_DEPENDS=	rubygem-gollum-lib>=3.0:${PORTSDIR}/www/rubygem-gollum-lib \
		rubygem-github-markdown>=0.6.5:${PORTSDIR}/textproc/rubygem-github-markdown \
		rubygem-sinatra>=1.4.4:${PORTSDIR}/www/rubygem-sinatra \
		rubygem-mustache>=0.99.5:${PORTSDIR}/www/rubygem-mustache \
		rubygem-useragent>=0.10.0:${PORTSDIR}/www/rubygem-useragent

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

PLIST_FILES=	bin/gollum

.include <bsd.port.mk>
