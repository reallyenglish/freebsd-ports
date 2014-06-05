# $FreeBSD$

PORTNAME=	fluent-plugin-elasticsearch
PORTVERSION=	0.3.0
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	ElasticSearch output plugin for Fluent event collector

RUN_DEPENDS=	rubygem-fluentd>=0:${PORTSDIR}/sysutils/rubygem-fluentd \
		rubygem-patron>=0:${PORTSDIR}/www/rubygem-patron \
		rubygem-elasticsearch>=0:${PORTSDIR}/textproc/rubygem-elasticsearch

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
