# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	erchef
PORTVERSION=	1.2.24
#PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	GH
PKGNAMEPREFIX=	erl-

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=

RUN_DEPENDS=	erl:${PORTSDIR}/lang/erlang \
	erl-chef_wm>=0:${PORTSDIR}/sysutils/erl-chef_wm \
	bash:${PORTSDIR}/shells/bash

IGNORE=	this is still work in progress

USE_GITHUB=	yes
GH_ACCOUNT=	opscode
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${PORTVERSION}
GH_COMMIT=	47e6744

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/erchef/rel/files/bootstrap-chef-server ${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/erchef/rel/files/erchef ${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/erchef/rel/files/ ${PREFIX}/bin/

.include <bsd.port.mk>
