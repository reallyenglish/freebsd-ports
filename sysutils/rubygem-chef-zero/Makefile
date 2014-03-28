# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	chef-zero
PORTVERSION=	1.7.2
PORTREVISION=	1
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Self-contained Chef server for testing and solo setup purposes

# XXX when updating this port to 2.0.2 or later, make sure to remove moneta
# dependency and see devel/rubygem-moneta/Makefile
RUN_DEPENDS=	rubygem-mixlib-log>=1.3:${PORTSDIR}/devel/rubygem-mixlib-log \
		rubygem-hashie>=2.0:${PORTSDIR}/devel/rubygem-hashie \
		rubygem-json>=0:${PORTSDIR}/devel/rubygem-json \
		rubygem-moneta=0.6.0:${PORTSDIR}/devel/rubygem-moneta \
		rubygem-rack>=0:${PORTSDIR}/www/rubygem-rack

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

PLIST_FILES=	bin/chef-zero

.include <bsd.port.mk>
