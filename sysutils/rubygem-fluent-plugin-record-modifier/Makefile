# $FreeBSD$

PORTNAME=	fluent-plugin-record-modifier
PORTVERSION=	0.1.3
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Output filter plugin for modifying each event record

LICENSE=	MIT

RUN_DEPENDS=	rubygem-fluentd>=0.10.17:${PORTSDIR}/sysutils/rubygem-fluentd \
		rubygem-fluent-mixin-config-placeholders>=0.2.0:${PORTSDIR}/sysutils/rubygem-fluent-mixin-config-placeholders

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
