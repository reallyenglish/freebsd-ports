# Created by: Stefan Lambrev <cheffo@freebsd-bg.org>
# $FreeBSD$

PORTNAME=	telegraf
PORTVERSION=	0.12.1
PORTREVISION=	1
CATEGORIES=	net-mgmt

MAINTAINER=	girgen@FreeBSD.org
COMMENT=	Time-series data collection

LICENSE=	MIT

BUILD_DEPENDS=	go>=1.5.0:lang/go

ONLY_FOR_ARCHS=	amd64

USE_RC_SUBR=	telegraf

USE_GITHUB=	yes

GH_ACCOUNT=	influxdata:DEFAULT
GH_TUPLE=	Shopify:sarama:8aadb47:sarama \
		Sirupsen:logrus:219c8cb:logrus \
		amir:raidman:53c1b96:raidman \
		aws:aws-sdk-go:13a1206:aws_sdk_go \
		beorn7:perks:3ac7bf7:perks \
		cenkalti:backoff:4dc7767:backoff \
		couchbase:go-couchbase:cb66431:go_couchbase \
		couchbase:gomemcached:a5ea635:gomemcached \
		couchbase:goutils:5823a0c:goutils \
		dancannon:gorethink:e7cac92:gorethink \
		davecgh:go-spew:5215b55:go_spew \
		docker:engine-api:8924d69:engine_api \
		docker:go-connections:f549a93:go_connections \
		docker:go-units:5d2041e:go_units \
		eapache:go-resiliency:b86b1ec:go_resiliency \
		eapache:queue:ded5959:queue \
		eclipse:paho.mqtt.golang:0f7a459:paho_mqtt_golang \
		go-sql-driver:mysql:1fca743:mysql \
		golang:protobuf:552c7b9:protobuf \
		golang:snappy:427fb6f:snappy \
		gonuts:go-shellquote:e842a11:go_shellquote \
		gorilla:context:1ea2538:context \
		gorilla:mux:c9e326e:mux \
		hailocab:go-hostpool:e80d13c:go_hostpool \
		influxdata:config:b79f682:config \
		influxdata:influxdb:e3fef55:influxdb \
		influxdata:toml:af4df43:toml \
		klauspost:crc32:19b0b33:crc32 \
		lib:pq:e182dc4:pq \
		matttproud:golang_protobuf_extensions:d0c3fe8:golang_protobuf_extensions \
		miekg:dns:cce6c13:dns \
		mreiferson:go-snappystream:028eae7:go_snappystream \
		naoina:go-stringutil:6b638e9:go_stringutil \
		nats-io:nats:b13fc9d:nats \
		nats-io:nuid:4f84f5f:nuid \
		nsqio:go-nsq:0b80d6f:go_nsq \
		opencontainers:runc:89ab7f2:runc \
		prometheus:client_golang:18acf99:client_golang \
		prometheus:client_model:fa8ad6f:client_model \
		prometheus:common:e8eabff:common \
		prometheus:procfs:406e5b7:procfs \
		samuel:go-zookeeper:218e9c8:go_zookeeper \
		shirou:gopsutil:1f32ce1:gopsutil \
		soniah:gosnmp:b1b4f88:gosnmp \
		sparrc:gdm:2b0dfaa:gdm \
		streadway:amqp:b4f3cea:amqp \
		stretchr:testify:1f4a164:testify \
		wvanbergen:kafka:46f9a1c:kafka \
		wvanbergen:kazoo-go:0f76871:kazoo_go \
		zensqlmonitor:go-mssqldb:ffe5510:go_mssqldb \
		golang:crypto:5dc8cb4:crypto \
		golang:net:6acef71:net \
		golang:text:a71fd10:text \
		golang:tools:764c4cc:tools \
		dancannon:gorethink:7d1af5b:gorethink_v1 \
		fatih:pool:cba550e:pool_v2 \
		go-mgo:mgo:d90005c:mgo \
		go-yaml:yaml:a83829b:yaml

SUB_FILES=	telegraf
SUB_LIST+=	TELEGRAF_PIDDIR=${TELEGRAF_PIDDIR}
PLIST_SUB=	TELEGRAF_PIDDIR=${TELEGRAF_PIDDIR}

STRIP=		# stripping can break go binaries

post-patch:
	@${MKDIR} ${WRKSRC}/src/github.com/${GH_ACCOUNT}/${PORTNAME} \
	${WRKSRC}/src/github.com/Shopify \
	${WRKSRC}/src/github.com/Sirupsen \
	${WRKSRC}/src/github.com/amir \
	${WRKSRC}/src/github.com/aws \
	${WRKSRC}/src/github.com/beorn7 \
	${WRKSRC}/src/github.com/cenkalti \
	${WRKSRC}/src/github.com/couchbase \
	${WRKSRC}/src/github.com/dancannon \
	${WRKSRC}/src/github.com/davecgh \
	${WRKSRC}/src/github.com/docker \
	${WRKSRC}/src/github.com/eapache \
	${WRKSRC}/src/github.com/eclipse \
	${WRKSRC}/src/github.com/go-sql-driver \
	${WRKSRC}/src/github.com/golang \
	${WRKSRC}/src/github.com/gonuts \
	${WRKSRC}/src/github.com/gorilla \
	${WRKSRC}/src/github.com/hailocab \
	${WRKSRC}/src/github.com/influxdata \
	${WRKSRC}/src/github.com/klauspost \
	${WRKSRC}/src/github.com/lib \
	${WRKSRC}/src/github.com/matttproud \
	${WRKSRC}/src/github.com/miekg \
	${WRKSRC}/src/github.com/mreiferson \
	${WRKSRC}/src/github.com/naoina \
	${WRKSRC}/src/github.com/nats-io \
	${WRKSRC}/src/github.com/nsqio \
	${WRKSRC}/src/github.com/opencontainers \
	${WRKSRC}/src/github.com/prometheus \
	${WRKSRC}/src/github.com/samuel \
	${WRKSRC}/src/github.com/shirou \
	${WRKSRC}/src/github.com/soniah \
	${WRKSRC}/src/github.com/sparrc \
	${WRKSRC}/src/github.com/streadway \
	${WRKSRC}/src/github.com/stretchr \
	${WRKSRC}/src/github.com/wvanbergen \
	${WRKSRC}/src/github.com/zensqlmonitor \
	${WRKSRC}/src/golang.org/x \
	${WRKSRC}/src/gopkg.in/dancannon \
	${WRKSRC}/src/gopkg.in/fatih
	@cd ${WRKSRC} && ${MV} CHANGELOG.md CONTRIBUTING.md Godeps Godeps_windows \
	LICENSE Makefile README.md accumulator.go agent circle.yml cmd docs etc \
	input.go internal metric.go metric_test.go output.go plugins scripts testutil \
		${WRKSRC}/src/github.com/${GH_ACCOUNT}/${PORTNAME}
	@${MV} ${WRKSRC_sarama} ${WRKSRC}/src/github.com/Shopify/sarama ;\
	${MV} ${WRKSRC_logrus} ${WRKSRC}/src/github.com/Sirupsen/logrus ;\
	${MV} ${WRKSRC_raidman} ${WRKSRC}/src/github.com/amir/raidman ;\
	${MV} ${WRKSRC_aws_sdk_go} ${WRKSRC}/src/github.com/aws/aws-sdk-go ;\
	${MV} ${WRKSRC_perks} ${WRKSRC}/src/github.com/beorn7/perks ;\
	${MV} ${WRKSRC_backoff} ${WRKSRC}/src/github.com/cenkalti/backoff ;\
	${MV} ${WRKSRC_go_couchbase} ${WRKSRC}/src/github.com/couchbase/go-couchbase ;\
	${MV} ${WRKSRC_gomemcached} ${WRKSRC}/src/github.com/couchbase/gomemcached ;\
	${MV} ${WRKSRC_goutils} ${WRKSRC}/src/github.com/couchbase/goutils ;\
	${MV} ${WRKSRC_gorethink} ${WRKSRC}/src/github.com/dancannon/gorethink ;\
	${MV} ${WRKSRC_go_spew} ${WRKSRC}/src/github.com/davecgh/go-spew ;\
	${MV} ${WRKSRC_engine_api} ${WRKSRC}/src/github.com/docker/engine-api ;\
	${MV} ${WRKSRC_go_connections} ${WRKSRC}/src/github.com/docker/go-connections ;\
	${MV} ${WRKSRC_go_units} ${WRKSRC}/src/github.com/docker/go-units ;\
	${MV} ${WRKSRC_go_resiliency} ${WRKSRC}/src/github.com/eapache/go-resiliency ;\
	${MV} ${WRKSRC_queue} ${WRKSRC}/src/github.com/eapache/queue ;\
	${MV} ${WRKSRC_paho_mqtt_golang} ${WRKSRC}/src/github.com/eclipse/paho.mqtt.golang ;\
	${MV} ${WRKSRC_mysql} ${WRKSRC}/src/github.com/go-sql-driver/mysql ;\
	${MV} ${WRKSRC_protobuf} ${WRKSRC}/src/github.com/golang/protobuf ;\
	${MV} ${WRKSRC_snappy} ${WRKSRC}/src/github.com/golang/snappy ;\
	${MV} ${WRKSRC_go_shellquote} ${WRKSRC}/src/github.com/gonuts/go-shellquote ;\
	${MV} ${WRKSRC_context} ${WRKSRC}/src/github.com/gorilla/context ;\
	${MV} ${WRKSRC_mux} ${WRKSRC}/src/github.com/gorilla/mux ;\
	${MV} ${WRKSRC_go_hostpool} ${WRKSRC}/src/github.com/hailocab/go-hostpool ;\
	${MV} ${WRKSRC_config} ${WRKSRC}/src/github.com/influxdata/config ;\
	${MV} ${WRKSRC_influxdb} ${WRKSRC}/src/github.com/influxdata/influxdb ;\
	${MV} ${WRKSRC_toml} ${WRKSRC}/src/github.com/influxdata/toml ;\
	${MV} ${WRKSRC_crc32} ${WRKSRC}/src/github.com/klauspost/crc32 ;\
	${MV} ${WRKSRC_pq} ${WRKSRC}/src/github.com/lib/pq ;\
	${MV} ${WRKSRC_golang_protobuf_extensions} ${WRKSRC}/src/github.com/matttproud/golang_protobuf_extensions ;\
	${MV} ${WRKSRC_dns} ${WRKSRC}/src/github.com/miekg/dns ;\
	${MV} ${WRKSRC_go_snappystream} ${WRKSRC}/src/github.com/mreiferson/go-snappystream ;\
	${MV} ${WRKSRC_go_stringutil} ${WRKSRC}/src/github.com/naoina/go-stringutil ;\
	${MV} ${WRKSRC_nats} ${WRKSRC}/src/github.com/nats-io/nats ;\
	${MV} ${WRKSRC_nuid} ${WRKSRC}/src/github.com/nats-io/nuid ;\
	${MV} ${WRKSRC_go_nsq} ${WRKSRC}/src/github.com/nsqio/go-nsq ;\
	${MV} ${WRKSRC_runc} ${WRKSRC}/src/github.com/opencontainers/runc ;\
	${MV} ${WRKSRC_client_golang} ${WRKSRC}/src/github.com/prometheus/client_golang ;\
	${MV} ${WRKSRC_client_model} ${WRKSRC}/src/github.com/prometheus/client_model ;\
	${MV} ${WRKSRC_common} ${WRKSRC}/src/github.com/prometheus/common ;\
	${MV} ${WRKSRC_procfs} ${WRKSRC}/src/github.com/prometheus/procfs ;\
	${MV} ${WRKSRC_go_zookeeper} ${WRKSRC}/src/github.com/samuel/go-zookeeper ;\
	${MV} ${WRKSRC_gopsutil} ${WRKSRC}/src/github.com/shirou/gopsutil ;\
	${MV} ${WRKSRC_gosnmp} ${WRKSRC}/src/github.com/soniah/gosnmp ;\
	${MV} ${WRKSRC_gdm} ${WRKSRC}/src/github.com/sparrc/gdm ;\
	${MV} ${WRKSRC_amqp} ${WRKSRC}/src/github.com/streadway/amqp ;\
	${MV} ${WRKSRC_testify} ${WRKSRC}/src/github.com/stretchr/testify ;\
	${MV} ${WRKSRC_kafka} ${WRKSRC}/src/github.com/wvanbergen/kafka ;\
	${MV} ${WRKSRC_kazoo_go} ${WRKSRC}/src/github.com/wvanbergen/kazoo-go ;\
	${MV} ${WRKSRC_go_mssqldb} ${WRKSRC}/src/github.com/zensqlmonitor/go-mssqldb ;\
	${MV} ${WRKSRC_crypto} ${WRKSRC}/src/golang.org/x/crypto ;\
	${MV} ${WRKSRC_net} ${WRKSRC}/src/golang.org/x/net ;\
	${MV} ${WRKSRC_text} ${WRKSRC}/src/golang.org/x/text ;\
	${MV} ${WRKSRC_tools} ${WRKSRC}/src/golang.org/x/tools ;\
	${MV} ${WRKSRC_gorethink_v1} ${WRKSRC}/src/gopkg.in/dancannon/gorethink.v1 ;\
	${MV} ${WRKSRC_pool_v2} ${WRKSRC}/src/gopkg.in/fatih/pool.v2 ;\
	${MV} ${WRKSRC_mgo} ${WRKSRC}/src/gopkg.in/mgo.v2 ;\
	${MV} ${WRKSRC_yaml} ${WRKSRC}/src/gopkg.in/yaml.v2

do-build:
	@cd ${WRKSRC}/src/github.com/influxdata/${PORTNAME} && ${SETENV} GOPATH=${WRKSRC} go install ./...

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${INSTALL_DATA} \
		${WRKSRC}/src/github.com/${GH_ACCOUNT}/${GH_PROJECT}/etc/${PORTNAME}.conf  \
		${STAGEDIR}${PREFIX}/etc/${PORTNAME}.conf.sample

.include <bsd.port.mk>
