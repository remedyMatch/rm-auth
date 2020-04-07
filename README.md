# Auth-Service

Als Auth-Service dient Keycloak. Keycloak ist eine Open Source Identity und Access Management Lösung.

##  Benötigte installierte Werkzeuge/Tools/Frameworks

* Docker
* docker-compose

### Starten des Service

* `docker-compose up` im Stammverzeichnis ausführen.
* http://localhost:8090/auth/ aufrufen.
* Login als Admin möglich. Credentials sind in den Umgebungsvariablen in der Datei `docker-compose.yml` definiert.

### Anmerkungen

Der Realm _rmio_ wird beim Start aus der Datei `./conf/rmio_realm.json` importiert. Dieser enthält bereits folgende Settings:

* Client _spring-cloud-gateway-client_ ist angelegt. (Valid Redirect URIs: _*_, Access Token Lifespan: _1 Days_)
* Group _test_ ist angelegt.
* User _demo_ ist angelegt. Das Passwort ist _remedy_. Der User ist Member der Group _test_
* Für den Client _spring-cloud-gateway-client_ wird ein Mapper mit Namen GroupMapper (Mapper Type: _Group Membership_, Token Claim Name: _groups_) angelegt.

### Export Realm

Folgendes Statement exportiert den Realm _rmio_ in die Datei `./conf/rmio_realm.json`. Das Statement muss bei laufendem Service abgesetzt werden.

`docker exec -it rm-auth_keycloak_1 /opt/jboss/keycloak/bin/standalone.sh -Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=export -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.realmName=rmio -Dkeycloak.migration.usersExportStrategy=REALM_FILE -Dkeycloak.migration.file=/tmp/keycloak-conf/rmio_realm.jso`
