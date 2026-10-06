ARG FROM_IMAGE=ghcr.io/hatchet-dev/hatchet/hatchet-engine:v0.53.15
FROM $FROM_IMAGE

EXPOSE 7077 8733

# needed since this is how we stop/start those images during devop (profile selection does not work as expected)
LABEL dw_rag="true"

include(hatchet_env.m4)

HEALTHCHECK --interval=10s --timeout=10s --retries=10 --start-period=10s CMD ["wget", "--spider", "-q", "http://localhost:8733/ready"]

ENTRYPOINT ["/bin/sh", "-c", "\"$@\" 2>&1 | tee -a /mnt/log/rag/hatchet_engine.log", "--"]
CMD ["/hatchet/hatchet-engine", "--config", "/hatchet/config"]
