# Created by: renchap@cocoa-x.com
# $FreeBSD$

PORTNAME=	moneta
# XXX chef 11.10.4 does not require moneta anymore, but sysutils/chef-zero
# 1.7.0 still needs 0.6.0. when chef's gemspec depends on chef-zeor 2.0.2,
# which does not require moneta, this commit may be reverted.
# https://tickets.opscode.com/browse/CHEF-3721
PORTVERSION=	0.6.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	renchap@cocoa-x.com
COMMENT=	An unified interface to key/value stores

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
