# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	CPAN-Meta-Requirements
PORTVERSION=	2.126
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Set of version requirements for a CPAN distribution

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

USE_PERL5=	configure
USES=		perl5

OPTIONS_DEFINE=	TEST
# XXX do not depend on p5-CPAN-Meta, as it cause recursion loop in tinderbox.
# CPAN::Meta is optional for testing.
TEST_DESC=	Install p5-CPAN-Meta for make test (WARNING: creates recursion loop)

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MTEST}
.if ${PERL_LEVEL} < 501800
TEST_DEPENDS+=	p5-CPAN-Meta>=2.120900:${PORTSDIR}/devel/p5-CPAN-Meta
.endif
.endif

.include <bsd.port.mk>
