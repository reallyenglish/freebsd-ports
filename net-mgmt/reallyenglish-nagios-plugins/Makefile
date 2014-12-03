# $FreeBSD$

PORTNAME=	reallyenglish-nagios-plugins
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	net-mgmt
MASTER_SITES=	http://journal.reallyenglish.com/

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Nagios plugins at reallyenglish

RUN_DEPENDS+=	${LOCALBASE}/libexec/nagios/utils.sh:${PORTSDIR}/net-mgmt/nagios-plugins \
	p5-Nagios-Plugin>=0:${PORTSDIR}/net-mgmt/p5-Nagios-Plugin \
	megarc:${PORTSDIR}/sysutils/megarc \
	amrstat:${PORTSDIR}/sysutils/amrstat \
	cciss_vol_status:${PORTSDIR}/sysutils/cciss_vol_status

NO_BUILD=	Yes
MAKE_ARGS=	DESTDIR=${PREFIX}

USES=	tar:tgz

.include <bsd.port.pre.mk>

# XXX this should be fixed in the upstream
pre-install:
	${INSTALL} -d ${PREFIX}/libexec/nagios

.include <bsd.port.post.mk>
