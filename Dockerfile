FROM quay.io/keycloak/keycloak:25.0.6
COPY realm /opt/keycloak/data/import

ENV KC_DB=postgres
RUN /opt/keycloak/bin/kc.sh build --db=postgres

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized", "--import-realm", "--hostname-strict=false"]