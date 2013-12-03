# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	sensu-plugin
PORTVERSION=	0.2.1
PORTREVISION=	1
CATEGORIES=	net-mgmt rubygems
MASTER_SITES=	RG

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Sensu Plugins

RUN_DEPENDS=	rubygem-json>=0:${PORTSDIR}/devel/rubygem-json \
		rubygem-mixlib-cli>=1.1.0:${PORTSDIR}/devel/rubygem-mixlib-cli

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

post-install:
	${PATCH} -p1 -d ${PREFIX}/${GEM_LIB_DIR} < ${PATCHDIR}/os-support.patch
	${FIND} ${PREFIX}/${GEM_LIB_DIR} -name "*.orig" -delete

.include <bsd.port.mk>
