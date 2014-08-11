# $FreeBSD$
#
# handle dependency on libexecinfo
#
# Feature:	execinfo
# Usage:	USES=execinfo
#
# Take no arguments

.if !defined(_INCLUDE_USES_EXECINFO_MK)
_INCLUDE_USES_EXECINFO_MK=	yes

.if !exists(/usr/lib/libexecinfo.so)
.if ${OSVERSION} >= 1000000
LIB_DEPENDS+=	libexecinfo.so:${PORTSDIR}/devel/libexecinfo
.else
LIB_DEPENDS+=	execinfo:${PORTSDIR}/devel/libexecinfo
.endif
.endif

.endif
