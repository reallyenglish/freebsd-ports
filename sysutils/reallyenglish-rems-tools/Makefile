# $FreeBSD$

PORTNAME=	reallyenglish-rems-tools
PORTVERSION=	0.14
#PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://dist.reallyenglish.com/${PORTNAME}/

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Local tools at reallyenglish, not available for public

RUN_DEPENDS=	${LOCALBASE}/sbin/send_nsca:${PORTSDIR}/net-mgmt/nsca-client

USE_PERL5=	Yes
MAKE_ARGS=	DESTDIR=${PREFIX}
USE_RC_SUBR=	varnisherrorlog
USES=tar:tgz

.include <bsd.port.mk>
