# Created by: Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
# $FreeBSD$

PORTNAME=	chef-pedant
PORTVERSION=	1.0.23
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	tomoyukis@reallyenglish.com
COMMENT=	Opscode Chef API Testing Framework

RUN_DEPENDS=	rubygem-rspec>=2.11.0:${PORTSDIR}/devel/rubygem-rspec \
		rubygem-activesupport>=3.2.8:${PORTSDIR}/devel/rubygem-activesupport \
		rubygem-mixlib-authentication>=1.3.0:${PORTSDIR}/devel/rubygem-mixlib-authentication \
		rubygem-mixlib-config>=1.1.2:${PORTSDIR}/devel/rubygem-mixlib-config \
		rubygem-mixlib-shellout>=1.1.0:${PORTSDIR}/devel/rubygem-mixlib-shellout \
		rubygem-rest-client>=1.6.7:${PORTSDIR}/www/rubygem-rest-client \
		rubygem-rspec_junit_formatter>=0.1.1:${PORTSDIR}/devel/rubygem-rspec_junit_formatter \
		rubygem-net-http-spy>=0.2.1:${PORTSDIR}/www/rubygem-net-http-spy \
		rubygem-erubis>=2.7.0:${PORTSDIR}/www/rubygem-erubis \
		rubygem-rspec-rerun>=0.1.1:${PORTSDIR}/devel/rubygem-rspec-rerun

MASTER_SITE_RUBYGEMS=	http://dist.reallyenglish.com/pub/gems/%SUBDIR%/

IGNORE=	this is still work in progress

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
