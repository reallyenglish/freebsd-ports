# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	npm
PORTVERSION=	2.12.1
CATEGORIES=	www
MASTER_SITES=	LOCAL/sunpoet

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Node package manager

LICENSE=	MIT

OPTIONS_DEFINE=	NODE NODE_DEVEL NODE012
OPTIONS_DEFAULT=NODE012
NODE_DESC=	Use www/node as backend
NODE_DEVEL_DESC=Use www/node-devel as backend
NODE012_DESC=	Use www/node012 as backend

MAKE_ARGS=	npm_config_prefix=${STAGEDIR}${PREFIX}
NO_ARCH=	yes
NO_BUILD=	yes
REINPLACE_ARGS=	-i ''
NO_BUILD=	yes
#NO_MANCOMPRESS=	yes
USE_PYTHON=	2.7
USE_XZ=		yes

CONFLICTS=	npm-1*

MAN1=		npm.1 npm-README.1 npm-access.1 npm-adduser.1 npm-bin.1 npm-bugs.1 \
		npm-build.1 npm-bundle.1 npm-cache.1 npm-completion.1 npm-config.1 \
		npm-dedupe.1 npm-deprecate.1 npm-dist-tag.1 npm-docs.1 npm-edit.1 \
		npm-explore.1 npm-help-search.1 npm-help.1 npm-init.1 \
		npm-install.1 npm-link.1 npm-logout.1 npm-ls.1 npm-outdated.1 \
		npm-owner.1 npm-pack.1 npm-prefix.1 npm-prune.1 npm-publish.1 \
		npm-rebuild.1 npm-repo.1 npm-restart.1 npm-rm.1 npm-root.1 \
		npm-run-script.1 npm-search.1 npm-shrinkwrap.1 npm-star.1 \
		npm-stars.1 npm-start.1 npm-stop.1 npm-tag.1 npm-test.1 \
		npm-uninstall.1 npm-unpublish.1 npm-update.1 npm-version.1 \
		npm-view.1 npm-whoami.1
MAN3=		npm.3 npm-bin.3 npm-bugs.3 npm-cache.3 npm-commands.3 npm-config.3 \
		npm-deprecate.3 npm-docs.3 npm-edit.3 npm-explore.3 \
		npm-help-search.3 npm-init.3 npm-install.3 npm-link.3 npm-load.3 \
		npm-ls.3 npm-outdated.3 npm-owner.3 npm-pack.3 npm-prefix.3 \
		npm-prune.3 npm-publish.3 npm-rebuild.3 npm-repo.3 npm-restart.3 \
		npm-root.3 npm-run-script.3 npm-search.3 npm-shrinkwrap.3 \
		npm-start.3 npm-stop.3 npm-tag.3 npm-test.3 npm-uninstall.3 \
		npm-unpublish.3 npm-update.3 npm-version.3 npm-view.3 npm-whoami.3
MAN5=		npm-folders.5 npm-global.5 npm-json.5 npmrc.5 package.json.5
MAN7=		npm-coding-style.7 npm-config.7 npm-developers.7 npm-disputes.7 \
		npm-faq.7 npm-index.7 npm-registry.7 npm-scope.7 npm-scripts.7 \
		removing-npm.7 semver.7

MANPREFIX=	${PREFIX}/lib/node_modules/npm

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MNODE_DEVEL}
RUN_DEPENDS+=	node-devel>=0.8.0:${PORTSDIR}/www/node-devel
.elsif ${PORT_OPTIONS:MNODE}
RUN_DEPENDS+=	node>=0.8.0:${PORTSDIR}/www/node
.elsif ${PORT_OPTIONS:MNODE012}
RUN_DEPENDS+=	node>=0.12.7:${PORTSDIR}/www/node012
.else
RUN_DEPENDS+=	node>=0.12.7:${PORTSDIR}/www/node012
.endif

.if ${ARCH} == "i386"
# Workaround for kernel bug 178881
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-bug-178881
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|node cli.js|& --cache ${WRKDIR}/.cache|' ${WRKSRC}/Makefile
	@${ECHO_CMD} 'MANPATH ${PREFIX}/lib/node_modules/npm/man' > ${WRKDIR}/npm.conf
	@${REINPLACE_CMD} -e 's|exec python|exec ${PYTHON_CMD}|' ${WRKSRC}/node_modules/node-gyp/gyp/gyp

post-install:
	${INSTALL_DATA} ${WRKDIR}/npm.conf ${STAGEDIR}${PREFIX}/etc/man.d/npm.conf

# maintainer section:
# require: bash, git, gmake, perl, node

MS_DISTNAME=	${PORTNAME}-${MS_VERSION}
MS_PLIST=	${WRKDIR}/.ms-pkg-plist
MS_RELEASES=	${MS_WRKSRC}/releases
MS_VERSION=	`${CAT} ${MS_VERSIONFILE}`
MS_VERSIONFILE=	${MS_WRKSRC}/.version
MS_WRKSRC=	${WRKSRC}/tmp

GITHUB_PROJECT=	${PORTNAME}
GITHUB_RELEASES=https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}/releases/latest
GITHUB_TARBALL=	https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}/archive/${GITHUB_VERSION}.tar.gz
GITHUB_USER=	${PORTNAME}
GITHUB_VERSION=	v${MS_VERSION}

genplist: do-clean stage
	@${MAKE_CMD} makeplist > ${MS_PLIST}
	@${SED} -i '' '1 d; /^lib\/node_modules\/npm\/bin\/node-gyp-bin\/node-gyp$$/ s|^|@(,,755) |' ${MS_PLIST}
	@${INSTALL} -m 600 ${MS_PLIST} ${PLIST}

maketar: do-clean
	@${MKDIR} ${MS_WRKSRC}/
	@${FETCH_BINARY} ${FETCH_ARGS:C/A//} -o ${MS_RELEASES} ${GITHUB_RELEASES}
	@${GREP} -o '/${GITHUB_USER}/${GITHUB_PROJECT}/archive/[^"]*\.tar\.gz' ${MS_RELEASES} | ${HEAD} -1 | ${CUT} -d/ -f5 | ${SED} 's|^v||; s|\.tar\.gz$$||' > ${MS_VERSIONFILE}
	@${ECHO_MSG} "*** Updating from ${PORTVERSION} to ${MS_VERSION} ..."
	@${FETCH_BINARY} ${FETCH_ARGS:C/A//} -o ${MS_WRKSRC}/${MS_DISTNAME}.tar.gz ${GITHUB_TARBALL}
	@${MKDIR} ${MS_WRKSRC}/${MS_DISTNAME}/
	@${TAR} -xf ${MS_WRKSRC}/${MS_DISTNAME}.tar.gz -C ${MS_WRKSRC}/${MS_DISTNAME}/ --strip-components 1
	@${REINPLACE_CMD} -e 's|${MAKE}|${GMAKE}|g; /^install: / s| docclean||' ${MS_WRKSRC}/${MS_DISTNAME}/Makefile
	@${REINPLACE_CMD} -e 's| && ${MAKE} -j8 doc||' ${MS_WRKSRC}/${MS_DISTNAME}/package.json
	@${REINPLACE_CMD} -e 's|linkBins, linkMans|linkBins|; /manRoot/ s|, "share"||' ${MS_WRKSRC}/${MS_DISTNAME}/lib/build.js ${MS_WRKSRC}/${MS_DISTNAME}/lib/unbuild.js
	@${REINPLACE_CMD} -e '1 s|#!/bin/bash|#!${LOCALBASE}/bin/bash|; s|${MAKE}|${GMAKE}|g; s|perl -pi|perl -p|' ${MS_WRKSRC}/${MS_DISTNAME}/scripts/doc-build.sh
	@${GREP} -lr share/man ${MS_WRKSRC}/${MS_DISTNAME}/doc/ ${MS_WRKSRC}/${MS_DISTNAME}/scripts/ | ${XARGS} -I % ${REINPLACE_CMD} 's|share/man|man|g' %
	@cd ${MS_WRKSRC}/${MS_DISTNAME}/ && ${GMAKE} docclean markedclean all html/doc/misc/npm-index.html
	@${FIND} ${MS_WRKSRC}/${MS_DISTNAME}/ -type d -exec ${CHMOD} 755 '{}' \;
	@${FIND} ${MS_WRKSRC}/${MS_DISTNAME}/ -type f -exec ${CHMOD} 644 '{}' \;
	@${FIND} ${MS_WRKSRC}/${MS_DISTNAME}/ -type f -name '*.sh' -exec ${CHMOD} 755 '{}' \;
	@cd ${MS_WRKSRC}/ && ${TAR} -Jcf ${MS_DISTNAME}.tar.xz ${MS_DISTNAME}/
	@${REINPLACE_CMD} -e '/^PORTVERSION=/ s|${PORTVERSION}|'${MS_VERSION}'|; /^PORTREVISION=/d' ${.CURDIR}/Makefile
	@sudo ${INSTALL} -m 644 ${MS_WRKSRC}/${PORTNAME}-${MS_VERSION}.tar.xz ${DISTDIR}/
	@cd ${.CURDIR}/ && ${MAKE_CMD} makesum

.include <bsd.port.mk>
