ARG FROM_IMAGE=ghcr.io/hatchet-dev/hatchet/hatchet-migrate:v0.53.15
FROM $FROM_IMAGE

# needed since this is how we stop/start those images during devop (profile selection does not work as expected)
LABEL dw_rag="true"

include(hatchet_env.m4)
