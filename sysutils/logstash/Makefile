# Created by: Daniel Solsona <daniel@ish.com.au>, Guido Falsi <madpilot@FreeBSD.org>
# $FreeBSD$

# TODO
# - DOCs
# - i do not like the way logstash.in starts/stops the daemon
# - TMP must NOT be world-writable
# 
PORTNAME=	logstash
PORTVERSION=	1.4.1
CATEGORIES=	sysutils java
MASTER_SITES=	https://download.elasticsearch.org/logstash/logstash/

MAINTAINER=	regis.despres@gmail.com
COMMENT=	Tool for managing events and logs

NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.7+

USE_RC_SUBR=	logstash
USERS=	${PORTNAME}
GROUPS=	${PORTNAME}

OPTIONS_DEFINE=	ZEROMQ
OPTIONS_DEFAULT=	ZEROMQ
ZEROMQ_DESC=	ZEROMQ input/output support

LOGSTASH_HOME?=	${PREFIX}/${PORTNAME}
LOGSTASH_HOME_REL?=	${LOGSTASH_HOME:S,^${PREFIX}/,,}
LOGSTASH_JAR?=	${DISTNAME}${EXTRACT_SUFX}
LOGSTASH_RUN?=	/var/run/${PORTNAME}
LOGSTASH_DATA_DIR?=	/var/db/${PORTNAME}

SUB_LIST=	LOGSTASH_DATA_DIR=${LOGSTASH_DATA_DIR} JAVA_HOME=${JAVA_HOME} \
		LOGSTASH_HOME=${LOGSTASH_HOME} LOGSTASH_JAR=${LOGSTASH_JAR}
PLIST_SUB+=	LOGSTASH_HOME=${LOGSTASH_HOME_REL} LOGSTASH_JAR=${LOGSTASH_JAR} \
		LOGSTASH_RUN=${LOGSTASH_RUN} \
		LOGSTASH_DATA_DIR=${LOGSTASH_DATA_DIR}

.include <bsd.port.options.mk>
.if ${PORT_OPTIONS:MZEROMQ}
RUN_DEPENDS+=	rubygem-ffi-rzmq>=0:${PORTSDIR}/devel/rubygem-ffi-rzmq
.endif

do-install:
	# create LOGSTASH_RUN dir in logstash.in
	${INSTALL} -d ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${FILESDIR}/logstash.conf.sample ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${FILESDIR}/elasticsearch.yml.sample ${STAGEDIR}${ETCDIR}

	${INSTALL} -d ${STAGEIDR}${LOGSTASH_HOME}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${LOGSTASH_HOME}/)
	${INSTALL} -d ${STAGEIDR}${LOGSTASH_HOME}/bin
	(cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${STAGEDIR}${LOGSTASH_HOME}/bin/)
	#(cd ${STAGEDIR}${PREFIX}/logstash && find * -type f | sort -r)
	#(cd ${STAGEDIR}${PREFIX}/logstash && find * -type d | sort -r)

	${INSTALL} -d ${STAGEDIR}/${LOGSTASH_DATA_DIR}

.include <bsd.port.mk>
