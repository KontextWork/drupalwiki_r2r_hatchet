ARG FROM_IMAGE=ghcr.io/hatchet-dev/hatchet/hatchet-dashboard:v0.53.15
FROM $FROM_IMAGE

include(hatchet_env.m4)

# needed since this is how we stop/start those images during devop (profile selection does not work as expected)
LABEL dw_rag="true"

EXPOSE 80

ENTRYPOINT ["/bin/sh", "-c", "exec \"$@\" >> /mnt/log/rag/hatchet_dashboard.log 2>&1", "--"]
CMD ["sh", "./entrypoint.sh", "--config", "/hatchet/config"]
