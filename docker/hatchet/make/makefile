ifdef KW_DOCKER_LIB
    $(info KW_DOCKER_LIB defined manually)
else
    BUILDER_SUBPATH=/tmp/kontextwork_docker_lib
    KW_DOCKER_LIB := $(shell dirname $(shell x=`pwd`; while [ "$$x" != "/" ] ; do x=`dirname "$$x"`; find "$$x" -maxdepth 1 -name .DOCKER_BUILDER_ROOT; done))${BUILDER_SUBPATH}
endif

include $(KW_DOCKER_LIB)/shared/lib/make/dw_docker_general_tools

compile:
	docker build --network=host ${BUILD_EXTRA_ARGS} --rm -t kwcr.io/rag/r2r/hatchet-admin:build-latest-master ../ -f ../Dockerfile_admin
	docker build --network=host ${BUILD_EXTRA_ARGS} --rm -t kwcr.io/rag/r2r/hatchet-dashboard:build-latest-master ../ -f ../Dockerfile_dashboard
	docker build --network=host ${BUILD_EXTRA_ARGS} --rm -t kwcr.io/rag/r2r/hatchet-engine:build-latest-master ../ -f ../Dockerfile_engine
	docker build --network=host ${BUILD_EXTRA_ARGS} --rm -t kwcr.io/rag/r2r/hatchet-migrate:build-latest-master ../ -f ../Dockerfile_migrate

build: compile clean

build_docker_build_context: prepare