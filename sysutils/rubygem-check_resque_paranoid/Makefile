# Created by: Lkhagva Ochirkhuyag <ochkoo@gmail.com>
# $FreeBSD$

PORTNAME=	check_resque_paranoid
PORTVERSION=	1.0.4
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	ochkoo@gmail.com
COMMENT=	Nagios plugin for checking Resque

RUN_DEPENDS=	rubygem-redis>=3.0.2:${PORTSDIR}/databases/rubygem-redis \
  rubygem-nagiosplugin>=1.3.0:${PORTSDIR}/sysutils/rubygem-nagiosplugin

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes
PLIST_FILES=	bin/check_resque

.include <bsd.port.pre.mk>


.include <bsd.port.post.mk>
