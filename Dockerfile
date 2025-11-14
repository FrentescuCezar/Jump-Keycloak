FROM quay.io/keycloak/keycloak:25.0.6

COPY realm /opt/keycloak/data/import

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized", "--import-realm", "--hostname-strict=false"]