ARG FROM_IMAGE=ghcr.io/hatchet-dev/hatchet/hatchet-admin:v0.53.15
FROM $FROM_IMAGE

# needed since this is how we stop/start those images during devop (profile selection does not work as expected)
LABEL dw_rag="true"

include(hatchet_env.m4)

COPY scripts/setup-hatchet-token.sh /scripts/setup-hatchet-token.sh
RUN chmod 0755 /scripts/setup-hatchet-token.sh
