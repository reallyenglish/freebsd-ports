# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	check_postgres
PORTVERSION=	2.21.0
CATEGORIES=	databases
MASTER_SITES=	http://bucardo.org/downloads/

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Script for checking postgresql

LICENSE=	BSD2CLAUSE

RUN_DEPENDS=	p5-TimeDate>=0:${PORTSDIR}/devel/p5-TimeDate

USES=		perl5
USE_PERL5=	configure

post-patch:
	${MV} ${WRKSRC}/check_postgres.pl ${WRKSRC}/check_postgres

.include <bsd.port.mk>
