# $FreeBSD$

PORTNAME=	fluent-plugin-redis
PORTVERSION=	0.2.0
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Redis output plugin for Fluent

LICENSE=	APACHE20

RUN_DEPENDS=	rubygem-fluentd>=0.10.0:${PORTSDIR}/sysutils/rubygem-fluentd \
		rubygem-redis>=2.2.2:${PORTSDIR}/databases/rubygem-redis

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
