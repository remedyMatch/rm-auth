FROM quay.io/keycloak/keycloak:9.0.2
ADD rmtheme/ /opt/jboss/keycloak/themes/rmtheme
ADD conf/rmio_realm.json /tmp/keycloak-conf/rmio_realm.json
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl --fail http://localhost:8080/auth || exit 1

