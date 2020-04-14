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

Der Realm _rmio_ wird beim Start aus der Datei `./conf/rmio_realm.json` importiert. 

Dieser enthält bereits folgende Settings:

#### Demo User

Es werden folgende Demo User angelegt:

* `test_bedarf` Passwort: `G3h31m` Test User um Bedarf zu testen

* `test_spender` Passwort: `G3h31m` Test User um Spenden zu testen

#### Gruppen

Es werden automatisch folgende Gruppen angelegt:

* `neu` für neu registrierte User
* `freigegeben` für user die freigegeben wurden. Diese werden in einem automatischen Prozess vom Java Backend verarbeitet
* `user` In dieser Gruppe befinden sich reguläre User
* `technical_user` Diese Gruppe enthält spezielle administrative User, die von anderen Systemen benutzt werden

#### Administrative User `technical_user`

* `rm_backend_user` Passwort: `rm_backend_user_password` technical user für java backend

* `rm_website_user` Passwort: `rm_website_user_password` technical user für die website

#### spring-cloud-gateway-client

Es wird der `spring-cloud-gateway-client` angelegt.

* Valid Redirect URIs: _*_
* Access Token Lifespan: _1 Days_
* Mapper GroupMapper (Mapper Type: _Group Membership_, Token Claim Name: _groups_)
* Mapper Username (Mapper Type: _User Property_, Token Claim Name: _upn_)


### Export Realm

Folgendes Statement exportiert den Realm _rmio_ in die Datei `./conf/rmio_realm.json`. Das Statement muss bei laufendem Service abgesetzt werden.

`docker exec -it rm-auth_keycloak_1 /opt/jboss/keycloak/bin/standalone.sh -Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=export -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.realmName=rmio -Dkeycloak.migration.usersExportStrategy=REALM_FILE -Dkeycloak.migration.file=/tmp/keycloak-conf/rmio_realm.jso`
