# Ports collection makefile for:	rubygem-gollum-lib
# Date created:				14 May 2014
# Whom:					Mitsuru Y <mitsuruy@reallyenglish.com>
#
# $FreeBSD$

PORTNAME=	gollum-lib
PORTVERSION=	3.0.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	mitsuruy@reallyenglish.com
COMMENT=	A simple, Git-powered wiki

RUN_DEPENDS=	rubygem-gitlab-grit>=2.6.5:${PORTSDIR}/textproc/rubygem-gitlab-grit \
		rubygem-rouge>=1.3.3:${PORTSDIR}/devel/rubygem-rouge \
		rubygem-nokogiri>=1.6.1:${PORTSDIR}/textproc/rubygem-nokogiri \
		rubygem-stringex>=2.5.1:${PORTSDIR}/devel/rubygem-stringex \
		rubygem-sanitize>=2.1.0:${PORTSDIR}/textproc/rubygem-sanitize \
		rubygem-github-markup>=1.1.0:${PORTSDIR}/textproc/rubygem-github-markup

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
