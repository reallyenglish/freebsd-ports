# $FreeBSD$

PORTNAME=	groonga
PORTVERSION=	8.0.3
CATEGORIES=	textproc
MASTER_SITES=	http://packages.groonga.org/source/groonga/

MAINTAINER=	bofh@FreeBSD.org
COMMENT=	Open-source fulltext search engine and column store

LICENSE=	LGPL21

LIB_DEPENDS=	pcre:${PORTSDIR}/devel/pcre
#BUILD_DEPENDS=	automake:${PORTSDIR}/devel/automake

USES=		gmake libedit pathfix pkgconfig

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-benchmark \
		--disable-document \
		--localstatedir=/var \
		--without-cutter \
		--without-inkscape \
		--without-kytea \
		--without-lemon \
		--with-log-path=/var/log/groonga.log \
		--with-munin-plugins
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
MAKE_ARGS+=	AUTOMAKE=echo

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=		MECAB SUGGEST RUBY
OPTIONS_DEFAULT=	MECAB SUGGEST RUBY
OPTIONS_SUB=		yes

MECAB_DESC=		Morphological analysis support via MeCab
SUGGEST_DESC=		Suggestions support

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MMECAB} || exists(${LOCALBASE}/lib/libmecab.so)
CONFIGURE_ARGS+=	--with-mecab
LIB_DEPENDS+=	mecab:${PORTSDIR}/japanese/mecab
PLIST_SUB+=	MECAB=""
.else
CONFIGURE_ARGS+=	--without-mecab
PLIST_SUB+=	MECAB="@comment "
.endif

.if ${PORT_OPTIONS:MSUGGEST}
CONFIGURE_ARGS+=	--with-libevent=${LOCALBASE} \
			--with-message-pack=${LOCALBASE} \
			--enable-zeromq
LIB_DEPENDS+=	event-1.4:${PORTSDIR}/devel/libevent \
		msgpack:${PORTSDIR}/devel/msgpack \
		zmq:${PORTSDIR}/devel/zmq
PLIST_SUB+=	SUGGEST=""
.else
CONFIGURE_ARGS+=	--without-libevent \
			--without-message-pack \
			--disable-zeromq
PLIST_SUB+=	SUGGEST="@comment "
.endif

.if ${PORT_OPTIONS:MRUBY}
CONFIGURE_ARGS+=	--enable-mruby
USE_RUBY=	yes
PLIST_SUB+=	RUBY=""
.else
PLIST_SUB+=	RUBY="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|lib/$${PACKAGE}/db/db|db/$${PACKAGE}/db| ; \
		 s|-lpthread|-pthread|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/NGX_PID_PATH/s|mkdir|${TRUE}| ; \
		 /NGX_HTTP_LOG_PATH/s|mkdir|${TRUE}| ; \
		 /NGX_ERROR_LOG_PATH/s|mkdir|${TRUE}|' \
		${WRKSRC}/vendor/nginx-1.14.0/auto/install

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/sbin/groonga-httpd
	@${MKDIR} ${STAGEDIR}/var/log/groonga/httpd
	@${MKDIR} ${STAGEDIR}/var/run/groonga

.include <bsd.port.post.mk>
