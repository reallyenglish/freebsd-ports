# $FreeBSD$

PORTNAME=	gitit
PORTVERSION=	0.10.3.1
PORTREVISION=	3
CATEGORIES=	www haskell

MAINTAINER=	haskell@FreeBSD.org
COMMENT=	Wiki using happstack, git or darcs, and pandoc

LICENSE=	GPLv2

USE_CABAL=	base64-bytestring>=0.1 blaze-html>=0.4 cgi ConfigFile>=1 \
		feed>=0.3.6 filestore>=0.6 ghc-paths happstack-server>=7.0 \
		highlighting-kate>=0.5.0.1 hslogger>=1 HStringTemplate>=0.6 \
		HTTP>=4000.0 json>=0.4 mtl network>=2.3 pandoc>=1.10.0.5 \
		pandoc-types>=1.10 parsec random recaptcha>=0.1 safe SHA>1 \
		syb tagsoup>=0.12 text url utf8-string>=0.3 xhtml xml>=1.3.5 \
		xss-sanitize>=0.3 zlib>=0.5
USE_RC_SUBR=	gitit

EXECUTABLE=	expireGititCache gitit

WWWDIR?=        ${PREFIX}/www/${PORTNAME}

GITIT_DIRS=	www/${PORTNAME}

post-install::
	@${MKDIR} ${WWWDIR}
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${WWWDIR}
.for plist_dir in ${GITIT_DIRS}
	@${ECHO_CMD} '@exec mkdir -p %D/${plist_dir}' >>${TMPPLIST}
	@${ECHO_CMD} '@exec chown ${WWWOWN}:${WWWGRP} %D/${plist_dir}' >>${TMPPLIST}
	@${ECHO_CMD} '@unexec rmdir %D/${plist_dir} 2>/dev/null || /usr/bin/true' >>${TMPPLIST}
.endfor

.include "${.CURDIR}/../../lang/ghc/bsd.cabal.mk"
.include <bsd.port.mk>
