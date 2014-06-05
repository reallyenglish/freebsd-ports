# $FreeBSD$

PORTNAME=	elasticsearch
PORTVERSION=	1.0.2
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Ruby integrations for Elasticsearch

RUN_DEPENDS=	rubygem-elasticsearch-transport=1.0.2:${PORTSDIR}/textproc/rubygem-elasticsearch-transport \
		rubygem-elasticsearch-api=1.0.2:${PORTSDIR}/textproc/rubygem-elasticsearch-api

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
