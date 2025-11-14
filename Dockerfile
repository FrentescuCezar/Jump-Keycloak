# Keycloak base image
FROM quay.io/keycloak/keycloak:25.0.6

# Copy realm export so it is picked up by --import-realm
COPY realm /opt/keycloak/data/import

# Keep the Postgres driver 
ENV KC_DB=postgres
RUN /opt/keycloak/bin/kc.sh build --db=postgres

EXPOSE 8080
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized", "--import-realm", "--hostname-strict=false"]