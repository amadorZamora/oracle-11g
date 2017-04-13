# DB SERVER CREATION START
# destroy existing container
docker stop h2h-oracledb && docker rm h2h-oracledb

# create and start DB server
ORACLEDB_CONTAINER=$(docker run -d -P -p 1525:1521 --name h2h-oracledb -v /etc/localtime:/etc/localtime:ro  acnlatamcargo/oracledb11g-cleaninstall)

#install unzip
docker exec -u root ${ORACLEDB_CONTAINER} yum -y install unzip
sleep 30

#DB SCTRUCTURE CREATION



#Copia todos los archivos locales dentro de la carpeta tmp del contenedor
docker cp scriptsSQL ${ORACLEDB_CONTAINER}:/tmp/

docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/scriptsSQL/init-h2h-db.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/scriptsSQL/SCRIPT_FWK_TEST.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/scriptsSQL/SCRIPT_CREATE_EXTERNAL_TABLES.sql"


# create h2h table and structure without data
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/scriptsSQL/SCRIPT_CREATE_H2H_Table.sql"

#sequece creation
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/scriptsSQL/HTH_CREATE_SEQUENCE.sql"

#### updating SQL scripts 12DEC16
# populate data
docker exec h2h-oracledb unzip /tmp/scriptsSQL/h2h-data-dump.zip -d /tmp/
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/CIUDADES.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/CLIENTES.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/DOMINIOS.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/CODIGOS_DOMINIOS.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/DIFE_HORARIA.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/LINEAS_AEREAS.sql"
docker exec -u oracle h2h-oracledb bash -i -c "sqlplus SYSTEM/oracle < /tmp/scriptsSQL/UPDATE-FINAL.sql"

