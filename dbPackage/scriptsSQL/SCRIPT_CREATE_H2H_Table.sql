CREATE TABLE EXLTMSGHOST.HTH_COMPANIAS
(
  HTHCIA_SEQ_CDG            NUMBER              NOT NULL,
  HTHCIA_NMB_COMPANIA       VARCHAR2(20 BYTE),
  HTHCIA_EST_HABILITADA     NUMBER(1),
  HTHCIA_FLG_EXPIRADO       NUMBER(1)           NOT NULL,
  HTHCIA_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHCIA_FCH_CREACION       DATE                NOT NULL,
  HTHCIA_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_COMPANIAS IS 'Tabla que contiene las compañias';

COMMENT ON COLUMN EXLTMSGHOST.HTH_COMPANIAS.HTHCIA_SEQ_CDG IS 'Código secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_COMPANIAS.HTHCIA_NMB_COMPANIA IS 'NOMBRE DE LA COMPAÑIA';

COMMENT ON COLUMN EXLTMSGHOST.HTH_COMPANIAS.HTHCIA_EST_HABILITADA IS 'ESTADO DE LA COMPAÑIA ACTIVADA O DESACTIVADA (1,0)';

COMMENT ON COLUMN EXLTMSGHOST.HTH_COMPANIAS.HTHCIA_FLG_EXPIRADO IS 'Indica si el registro se encuentra expirado o activo. EXPIRADO=1; ACTIVO=0.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_COMPANIAS.HTHCIA_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_COMPANIAS.HTHCIA_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_COMPANIAS.HTHCIA_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE TABLE EXLTMSGHOST.HTH_EVENTOS
(
  HTHEVT_CDG_MENSAJE        VARCHAR2(3 BYTE)    NOT NULL,
  HTHEVT_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHEVT_FCH_CREACION       DATE                NOT NULL,
  HTHEVT_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_EVENTOS IS 'Tabla que contiene los tipos de evento de sistema como (BKD, RCS, AWB, DEP, etc.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS.HTHEVT_CDG_MENSAJE IS 'Código del evento';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS.HTHEVT_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS.HTHEVT_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS.HTHEVT_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE TABLE EXLTMSGHOST.HTH_EVENTOS_IN
(
  HTHEVI_SEQ_CDG          NUMBER                NOT NULL,
  HTHEVI_ERR_MANUAL       NUMBER(1)             NOT NULL,
  HTHEVI_ACC_MENSAJE      VARCHAR2(2 BYTE)      NOT NULL,
  HTHEVI_CNL_ACCION       VARCHAR2(20 BYTE)     NOT NULL,
  HTHEVI_CDG_PREFIJO      NUMBER(4),
  HTHEVI_NMR_DOCUMENTO    NUMBER(8),
  HTHEVI_NMR_HOUSE        VARCHAR2(10 BYTE),
  HTHEVI_DRC_REMITENTE    VARCHAR2(100 BYTE)    NOT NULL,
  HTHEVI_TPO_MENSAJE      VARCHAR2(10 BYTE)     NOT NULL,
  HTHEVI_PST_MENSAJE      VARCHAR2(3 BYTE),
  HTHEVI_GLS_MENSAJE      CLOB,
  HTHEVI_CDG_IATA         VARCHAR2(3 BYTE),
  HTHEVI_NMR_VUELO        NUMBER(4),
  HTHEVI_FCH_VUELO        DATE,
  HTHEVI_PST_ORIGEN       VARCHAR2(3 BYTE),
  HTHEVI_PST_DESTINO      VARCHAR2(3 BYTE),
  HTHEVI_FCH_TA           DATE                  NOT NULL,
  HTHEVI_FCH_TB           DATE                  NOT NULL,
  HTHEVI_EST_PROCESO      NUMBER(1)             NOT NULL,
  HTHEVI_FLG_MENSAJE_OUT  NUMBER(1)             NOT NULL,
  HTHEVI_PRD_COMERCIAL    VARCHAR2(3 BYTE),
  HTHEVI_FCH_CREACION     DATE                  NOT NULL,
  HTHEVI_DSC_ERROR        VARCHAR2(100 BYTE),
  HTHEVI_TPO_EVENTO       VARCHAR2(20 BYTE),
  HTHEVI_FCH_EJECUCION    TIMESTAMP(6),
  HTHEVI_FCH_INSERCION    TIMESTAMP(6)          DEFAULT SYSTIMESTAMP(6),
  HTHEVI_EST_EVENTO       VARCHAR2(1 BYTE)      DEFAULT 'V'
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
PARTITION BY RANGE (HTHEVI_FCH_CREACION) 
(  
  PARTITION PM201509 VALUES LESS THAN (TO_DATE(' 2015-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201510 VALUES LESS THAN (TO_DATE(' 2015-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201511 VALUES LESS THAN (TO_DATE(' 2015-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201512 VALUES LESS THAN (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201601 VALUES LESS THAN (TO_DATE(' 2016-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201602 VALUES LESS THAN (TO_DATE(' 2016-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201603 VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201604 VALUES LESS THAN (TO_DATE(' 2016-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201605 VALUES LESS THAN (TO_DATE(' 2016-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201606 VALUES LESS THAN (TO_DATE(' 2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201607 VALUES LESS THAN (TO_DATE(' 2016-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201608 VALUES LESS THAN (TO_DATE(' 2016-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PMMAX VALUES LESS THAN (MAXVALUE)
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVI_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               )
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_EVENTOS_IN IS 'Tabla que contiene los eventos generados por los sistemas legados (Hito de Negocio) y los mensajes enviados por la comunidad aerea (IN).';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_EST_EVENTO IS 'Estado del evento';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_SEQ_CDG IS 'ID secuecial de la tabla.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_ERR_MANUAL IS 'Los posibles valores son 1 en el caso que TA sea mayor a TB y 0 en caso contrario.

';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_ACC_MENSAJE IS 'Los posibles valores pueden ser IN, HN, RP o MM dependiendo del caso.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_CNL_ACCION IS 'Sistema de origen del mensaje.
Ej: cronos, NWH, etc.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_CDG_PREFIJO IS 'Prefijo de la guía.
Ej: 45';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_NMR_DOCUMENTO IS 'Número de la guía.
EJ: 1234567890';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_NMR_HOUSE IS 'Número de guía house.
EJ: 4300108624';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_DRC_REMITENTE IS 'Remitente del mensaje TTY o email.
Ej: mail@test.com';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_TPO_MENSAJE IS 'Tipo de mensaje los cuales pueden ser hito de negocio o iata.
Ej: HN(RECFIS), IATA(RCF)';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_PST_MENSAJE IS 'Posta del mensaje.
EJ: SCL';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_GLS_MENSAJE IS 'Mensaje a procesar, los cuales pueden estar en formato XML LAN, CIMP o CXML.
';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_CDG_IATA IS 'Denominador del vuelo.
Ej: LA';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_NMR_VUELO IS 'Número del vuelo.
Ej: LA500';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_FCH_VUELO IS 'Fecha del vuelo.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_PST_ORIGEN IS 'Posta origen del vuelo.
Ej: SCL';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_PST_DESTINO IS 'Posta destino del vuelo.
Ej: LIM';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_FCH_TA IS 'Fecha y hora en que ocurre el evento en el mundo real.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_FCH_TB IS 'Fecha y hora en que el evento ingreso a los sistemas de LAN Cargo.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_EST_PROCESO IS 'Indica el estado del procesamiento del evento. 
Exito:0 (cero)
Warning: Numeros positivos
Error: Numeros negativos
';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_FLG_MENSAJE_OUT IS 'Indica si el procesamiento del evento generó mensajes de salida (OUT). Los posibles valores son 1 en caso de generar mensajes OUT y 0 en caso contrario.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_PRD_COMERCIAL IS 'Producto comercial de la guía.
HTHEVI_PRD_COMERCIAL de la tabla HTH_EVENTOS_IN, se debe guardar la llave del producto comercial de la tabla SVPR(SERVICIOS_PREBOOKING) del owner EXBOOKING.
EJ: DG,DO,EA,PI,PJ,TB';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_FCH_CREACION IS 'Timestamp de inserción del registro.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_DSC_ERROR IS 'Contiene la descripcion del error.
EJ: Parse Cargo XML error';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN.HTHEVI_TPO_EVENTO IS 'Tipo de evento que se va a procesar.
EJ: RCS,FWB,etc';


CREATE TABLE EXLTMSGHOST.HTH_EVENTOS_IN_RELACION
(
  HTHEVI_SEQ_CDG_PADRE  NUMBER                  NOT NULL,
  HTHEVI_SEQ_CDG_HIJO   NUMBER                  NOT NULL,
  HTHREL_FCH_INSERCION  TIMESTAMP(6)            DEFAULT SYSTIMESTAMP(6),
  DMNO_ID               VARCHAR2(30 BYTE)       NOT NULL,
  CDDN_ID               VARCHAR2(30 BYTE)       NOT NULL
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
PARTITION BY RANGE (HTHREL_FCH_INSERCION) 
(  
  PARTITION PM201611 VALUES LESS THAN (TIMESTAMP' 2016-12-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201612 VALUES LESS THAN (TIMESTAMP' 2017-01-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201701 VALUES LESS THAN (TIMESTAMP' 2017-02-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201702 VALUES LESS THAN (TIMESTAMP' 2017-03-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201703 VALUES LESS THAN (TIMESTAMP' 2017-04-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201704 VALUES LESS THAN (TIMESTAMP' 2017-05-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201705 VALUES LESS THAN (TIMESTAMP' 2017-06-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201706 VALUES LESS THAN (TIMESTAMP' 2017-07-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201707 VALUES LESS THAN (TIMESTAMP' 2017-08-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201708 VALUES LESS THAN (TIMESTAMP' 2017-09-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201709 VALUES LESS THAN (TIMESTAMP' 2017-10-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201710 VALUES LESS THAN (TIMESTAMP' 2017-11-01 00:00:00')
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PMMAX VALUES LESS THAN (MAXVALUE)
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               )
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_EVENTOS_IN_RELACION IS 'Relaciona dos eventos de la tabla HTH_EVENTOS_IN entre si. Por ejemplo, relaciona eventos de cierre de trafico con sus respectivos mensajes DEP generados';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN_RELACION.HTHEVI_SEQ_CDG_PADRE IS 'Numero de Secuencia del evento Padre de la relacion, ubicado en la tabla HTH_EVENTOS_IN';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN_RELACION.HTHEVI_SEQ_CDG_HIJO IS 'Numero de Secuencia del evento Hijo de la relacion, ubicado en la tabla HTH_EVENTOS_IN';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN_RELACION.HTHREL_FCH_INSERCION IS 'Fecha auto generada de insercion de un registro en la tabla HTH_EVENTOS_IN_RELACION';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN_RELACION.DMNO_ID IS 'Identificador de la tabla DOMINIOS que define el tipo de relacion de eventos de la tabla HTH_EVENTOS_IN_RELACION. Por ejemplo, se puede definir esta relacion con el valor "HOST_TO_HOST"';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_IN_RELACION.CDDN_ID IS 'Identificador de la tabla CODIGO_DOMINIOS que define el tipo de relacion de eventos de la tabla HTH_EVENTOS_IN_RELACION. Por ejemplo, se puede definir la relacion CLSTFC-DEP con el valor "1"';


CREATE TABLE EXLTMSGHOST.HTH_EVENTOS_OUT
(
  HTHEVO_SEQ_CDG           NUMBER               NOT NULL,
  HTHEVI_SEQ_CDG           NUMBER,
  HTHEVO_CDG_PREFIJO       NUMBER(4),
  HTHEVO_TPO_PERFIL        VARCHAR2(30 BYTE),
  HTHEVO_NMR_DOCUMENTO     NUMBER(8),
  HTHEVO_NMR_HOUSE         VARCHAR2(10 BYTE),
  HTHEVO_NMB_DESTINATARIO  VARCHAR2(30 BYTE),
  HTHEVO_NMB_REMITENTE     VARCHAR2(30 BYTE)    NOT NULL,
  HTHEVO_CNL_SALIDA        VARCHAR2(20 BYTE)    NOT NULL,
  HTHEVO_DRC_SALIDA        VARCHAR2(100 BYTE),
  HTHEVO_EVT_ORIGEN        VARCHAR2(10 BYTE)    NOT NULL,
  HTHEVO_TPO_EVENTO        VARCHAR2(10 BYTE)    NOT NULL,
  HTHEVO_GLS_MENSAJE       CLOB,
  HTHEVO_CDG_IATA          VARCHAR2(3 BYTE),
  HTHEVO_PST_DESTINO       VARCHAR2(3 BYTE),
  HTHEVO_FCH_TC            DATE                 NOT NULL,
  HTHEVO_MSJ_HASH_CODE     NUMBER(10),
  HTHEVO_EST_PROCESO       NUMBER(1),
  HTHEVO_EST_RESPUESTA     NUMBER(1)            NOT NULL,
  HTHEVO_FCH_CREACION      DATE                 NOT NULL,
  HTHEVO_DSC_ERROR         VARCHAR2(100 BYTE),
  HTHEVO_FCH_EJECUCION     TIMESTAMP(6),
  HTHEVO_FCH_INSERCION     TIMESTAMP(6)         DEFAULT SYSTIMESTAMP(6)
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
PARTITION BY RANGE (HTHEVO_FCH_CREACION) 
(  
  PARTITION PM201509 VALUES LESS THAN (TO_DATE(' 2015-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201510 VALUES LESS THAN (TO_DATE(' 2015-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201511 VALUES LESS THAN (TO_DATE(' 2015-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201512 VALUES LESS THAN (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201601 VALUES LESS THAN (TO_DATE(' 2016-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201602 VALUES LESS THAN (TO_DATE(' 2016-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201603 VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201604 VALUES LESS THAN (TO_DATE(' 2016-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201605 VALUES LESS THAN (TO_DATE(' 2016-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201606 VALUES LESS THAN (TO_DATE(' 2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201607 VALUES LESS THAN (TO_DATE(' 2016-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201608 VALUES LESS THAN (TO_DATE(' 2016-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PMMAX VALUES LESS THAN (MAXVALUE)
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHEVO_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               )
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_EVENTOS_OUT IS 'Tabla que contiene los mensajes OUT generados a partir del procesamiento de un evento IN.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_SEQ_CDG IS 'ID secuecial de la tabla.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVI_SEQ_CDG IS 'ID secuecial de la tabla.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_CDG_PREFIJO IS 'Prefijo de la guía. Ej: 45';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_TPO_PERFIL IS 'Perfil del destinatario del mensaje. EJ: Agente, shipper, etc';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_NMR_DOCUMENTO IS 'Número de la guía. EJ: 1234567890';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_NMR_HOUSE IS 'Número de guía house.  EJ: 4300108624';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_NMB_DESTINATARIO IS 'Nombre del destinatario del mensaje.  Ej: panalpina';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_NMB_REMITENTE IS 'Remitente del mensaje de entrada que genera el mensaje OUT. Ej: LAN CARGO';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_CNL_SALIDA IS 'Canal de salida del mensaje. Ej: ETRACKING, ENVIO COMUNIDAD';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_DRC_SALIDA IS 'Dirección de salida a la cual se envia el mensaje TTY o MAIL. ej: mail@test.com';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_EVT_ORIGEN IS 'Tipo de evento IN que origino el mensaje OUT los cuales pueden ser hito de negocio o iata. Ej: HN(RECFIS), IATA(RCF)';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_TPO_EVENTO IS 'Tipo de evento del mensaje OUT.
';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_GLS_MENSAJE IS 'Mensaje OUT generado.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_CDG_IATA IS 'Denominador del vuelo.  Ej: LA';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_PST_DESTINO IS 'Posta destino del vuelo. Ej: SCL';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_FCH_TC IS 'Fecha y hora en que se realiza el envio/notificación del mensaje OUT';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_MSJ_HASH_CODE IS 'HashCode del objecto de dominio del mensaje generado y enviado.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_EST_PROCESO IS 'Indica el estado del procesamiento del mensaje OUT. Los posibles valores son 1 en caso de ser exitoso el envio y 0 en caso contrario.
Exito:0 (cero)
Warning: Numeros positivos
Error: Numeros negativos';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_EST_RESPUESTA IS 'Indica si hay un evento FNA asociado al mensaje OUT. Los posibles valores son 1 en caso de recibir un FNA y 0 en caso contrario.
0- nada
1- FMA
2- FNA';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_FCH_CREACION IS 'Timestamp de inserción del registro.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_OUT.HTHEVO_DSC_ERROR IS 'Contiene la descripcion del error.  EJ: Parse Cargo XML error';


CREATE TABLE EXLTMSGHOST.HTH_PERFILES
(
  HTHPFL_CDG_PERFIL         VARCHAR2(3 BYTE)    NOT NULL,
  HTHPFL_DSC_PERFIL         VARCHAR2(20 BYTE)   NOT NULL,
  HTHPFL_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHPFL_FCH_CREACION       DATE                NOT NULL,
  HTHPFL_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_PERFILES IS 'Tabla que contiene los tipos de perfiles';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES.HTHPFL_CDG_PERFIL IS 'Código del perfil';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES.HTHPFL_DSC_PERFIL IS 'Descripción del perfil.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES.HTHPFL_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES.HTHPFL_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES.HTHPFL_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE TABLE EXLTMSGHOST.HTH_PERFILES_COMPANIAS
(
  HTHCPE_SEQ_CDG            NUMBER              NOT NULL,
  HTHPFL_CDG_PERFIL         VARCHAR2(3 BYTE)    NOT NULL,
  HTHCIA_SEQ_CDG            NUMBER,
  HTHCPE_FLG_EXPIRADO       NUMBER(1)           NOT NULL,
  HTHCPE_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHCPE_FCH_CREACION       DATE                NOT NULL,
  HTHCPE_FCH_ACTUALIZACION  DATE,
  LNAR_CDG_IATA             VARCHAR2(3 BYTE),
  N_CLIENTE                 NUMBER(6),
  C_POSTA_CLIE              VARCHAR2(3 BYTE)
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_PERFILES_COMPANIAS IS 'Tabla que contiene los perfiles asociados a compañias';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.HTHCPE_SEQ_CDG IS 'Código secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.HTHPFL_CDG_PERFIL IS 'Código de perfil al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.HTHCIA_SEQ_CDG IS 'Código secuencia de compañia al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.HTHCPE_FLG_EXPIRADO IS 'Indica si el registro se encuentra expirado o activo. EXPIRADO=1; ACTIVO=0.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.HTHCPE_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.HTHCPE_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.HTHCPE_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.LNAR_CDG_IATA IS 'Código IATA de aerolínea';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.N_CLIENTE IS 'N° de cliente';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PERFILES_COMPANIAS.C_POSTA_CLIE IS 'Posta de cliente.';


CREATE TABLE EXLTMSGHOST.HTH_PROCESOS_SEC
(
  HTHPSE_SEQ_CDG             NUMBER             NOT NULL,
  HTHEVI_SEQ_CDG             NUMBER,
  HTHPSE_ACC_MENSAJE         VARCHAR2(5 BYTE)   NOT NULL,
  HTHPSE_CDG_PREFIJO         NUMBER(4),
  HTHPSE_NMR_DOCUMENTO       NUMBER(8),
  HTHPSE_NMR_HOUSE           VARCHAR2(10 BYTE),
  HTHPSE_TPO_EVENTO          VARCHAR2(10 BYTE)  NOT NULL,
  HTHPSE_DSC_ERROR           VARCHAR2(100 BYTE),
  HTHPSE_DSC_ERROR_DETALLES  VARCHAR2(4000 BYTE),
  HTHPSE_EST_PROCESO         NUMBER(1),
  HTHPSE_DSC_COMPONENTE      VARCHAR2(50 BYTE)  NOT NULL,
  HTHPSE_FCH_CREACION        DATE               NOT NULL,
  HTHPSE_DSC_PROCESO         VARCHAR2(20 BYTE),
  HTHPSE_CRR_SUB_PROCESO     NUMBER(4),
  HTHPSE_DSC_SUB_PROCESO     VARCHAR2(200 BYTE),
  HTHPSE_GLS_MENSAJE         CLOB,
  HTHPSE_NMB_SISTEMA_SALIDA  VARCHAR2(50 BYTE),
  HTHPSE_FCH_EJECUCION       TIMESTAMP(6),
  HTHPSE_FCH_INSERCION       TIMESTAMP(6)       DEFAULT SYSTIMESTAMP(6)
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
PARTITION BY RANGE (HTHPSE_FCH_CREACION) 
(  
  PARTITION PM201509 VALUES LESS THAN (TO_DATE(' 2015-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201510 VALUES LESS THAN (TO_DATE(' 2015-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201511 VALUES LESS THAN (TO_DATE(' 2015-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201512 VALUES LESS THAN (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201601 VALUES LESS THAN (TO_DATE(' 2016-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201602 VALUES LESS THAN (TO_DATE(' 2016-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201603 VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201604 VALUES LESS THAN (TO_DATE(' 2016-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201605 VALUES LESS THAN (TO_DATE(' 2016-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201606 VALUES LESS THAN (TO_DATE(' 2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201607 VALUES LESS THAN (TO_DATE(' 2016-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PM201608 VALUES LESS THAN (TO_DATE(' 2016-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION PMMAX VALUES LESS THAN (MAXVALUE)
    LOGGING
    NOCOMPRESS
    TABLESPACE EXLTMSGHOST_DAT
LOB (HTHPSE_GLS_MENSAJE) STORE AS 
        (   TABLESPACE  EXLTMSGHOST_DAT 
          ENABLE        STORAGE IN ROW
          CHUNK       8192
          PCTVERSION  0
          NOCACHE
          STORAGE    (
                      INITIAL          8M
                      NEXT             1M
                      MINEXTENTS       1
                      MAXEXTENTS       2147483645
                      PCTINCREASE      0
                      FREELISTS        1
                      FREELIST GROUPS  1
                      BUFFER_POOL      DEFAULT
                     )
        )
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                BUFFER_POOL      DEFAULT
               )
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_PROCESOS_SEC IS 'Tabla que contiene los procesos para la generación de eventos OUT.
tabla de procesamiento y comparacion de mensajes.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_SEQ_CDG IS 'ID secuecial de la tabla.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHEVI_SEQ_CDG IS 'ID secuecial de la tabla.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_ACC_MENSAJE IS 'Indica si el mensaje es IN, HN (hito de negocio) o H2H.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_CDG_PREFIJO IS 'Prefijo de la guía
EJ: 45';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_NMR_DOCUMENTO IS 'Número de la guía.
EJ: 1234567890';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_NMR_HOUSE IS 'Número de guía house.
EJ: 4300108624';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_TPO_EVENTO IS 'Tipo de evento, los cuales pueden ser hito de negocio o iata.
EJ: RCS,FWB,etc';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_DSC_ERROR IS 'Contiene la descripcion del error.
EJ: Parse Cargo XML error';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_DSC_ERROR_DETALLES IS 'Descripción del error ocurrido.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_EST_PROCESO IS 'Indica el estado de la regla aplicada. 
Exito:0 (cero)
Warning: Numeros positivos
Error: Numeros negativos
';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_DSC_COMPONENTE IS 'Usuario que inserta/actualiza registro.
EJ: ETRACKINGHTH, RCFPROCESSEVENT,';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_FCH_CREACION IS 'Timestamp de inserción del registro.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_DSC_PROCESO IS 'Descripcion de las etapas del proceso  EVETRO.
1- ENTRY
2- VALIDATE
3- ENRICH
4- TRANSFORM
5- ROUTE
6- OPERATE
';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_CRR_SUB_PROCESO IS 'Correlativo del sub paso dentro de la etapa de EVETRO y Canal de salida (si aplica).
ej; 1,2,3,4,5,6,etc';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_DSC_SUB_PROCESO IS 'Codigo del sub paso de la etapa de EVETRO.
1- ENTRY
2- VALIDATE
3- ENRICH
4- TRANSFORM
5- ROUTE
6- OPERATE';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_GLS_MENSAJE IS 'Glosa del mensaje de  entrada o salida de la etapa del proceso.
Este es siempre XML';

COMMENT ON COLUMN EXLTMSGHOST.HTH_PROCESOS_SEC.HTHPSE_NMB_SISTEMA_SALIDA IS 'Nombre del sistema de salida.  Sistema o plicacion que consume.';


CREATE TABLE EXLTMSGHOST.HTH_RUTAS_COMPANIAS
(
  HTHRTS_SEQ_CDG            NUMBER              NOT NULL,
  HTHCIA_SEQ_CDG            NUMBER,
  HTHEVT_CDG_MENSAJE        VARCHAR2(3 BYTE)    NOT NULL,
  HTHRTS_PST_ORIGEN         VARCHAR2(3 BYTE),
  HTHRTS_PST_DESTINO        VARCHAR2(3 BYTE),
  HTHRTS_FLG_EXPIRADO       NUMBER(1)           NOT NULL,
  HTHRTS_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHRTS_FCH_CREACION       DATE                NOT NULL,
  HTHRTS_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_RUTAS_COMPANIAS IS 'Tabla que contiene las rutas asociadas a compaÃ±ias';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHRTS_SEQ_CDG IS 'CÃ³digo secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHCIA_SEQ_CDG IS 'CÃ³digo secuencia de compaÃ±ia al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHEVT_CDG_MENSAJE IS 'CÃ³digo del evento';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHRTS_PST_ORIGEN IS 'POSTA ORIGEN DE LA RUTA';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHRTS_PST_DESTINO IS 'POSTA DESTINO DE LA RUTA';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHRTS_FLG_EXPIRADO IS 'Indica si el registro se encuentra expirado o activo. EXPIRADO=1; ACTIVO=0.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHRTS_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHRTS_FCH_CREACION IS 'Timestamp de inserciÃ³n del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_RUTAS_COMPANIAS.HTHRTS_FCH_ACTUALIZACION IS 'Timestamp de actualizaciÃ³n del registro';


CREATE TABLE EXLTMSGHOST.HTH_TIPOS_EVENTO
(
  HTHTEV_CDG_FLUJOMENSAJE   VARCHAR2(3 BYTE)    NOT NULL,
  HTHTEV_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHTEV_FCH_CREACION       DATE                NOT NULL,
  HTHTEV_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_TIPOS_EVENTO IS 'Tabla que contiene los tipos de evento como IN y OUT';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_EVENTO.HTHTEV_CDG_FLUJOMENSAJE IS 'Código del tipo de evento.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_EVENTO.HTHTEV_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_EVENTO.HTHTEV_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_EVENTO.HTHTEV_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE TABLE EXLTMSGHOST.HTH_TIPOS_MENSAJE
(
  HTHTMJ_CDG_TIPOMENSAJE    VARCHAR2(4 BYTE)    NOT NULL,
  HTHTMJ_DSC_TIPOMENSAJE    VARCHAR2(20 BYTE),
  HTHTMJ_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHTMJ_FCH_CREACION       DATE                NOT NULL,
  HTHTMJ_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_TIPOS_MENSAJE IS 'Tabla que contiene los tipos de mensajes como CARGO XML y CARGO IMP';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_MENSAJE.HTHTMJ_CDG_TIPOMENSAJE IS 'Código del tipo de mensaje.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_MENSAJE.HTHTMJ_DSC_TIPOMENSAJE IS 'Descripción del tipo de mensaje.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_MENSAJE.HTHTMJ_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_MENSAJE.HTHTMJ_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TIPOS_MENSAJE.HTHTMJ_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE TABLE EXLTMSGHOST.HTH_TRANSPORTES
(
  HTHTRT_CDG_TRANSPORTE     VARCHAR2(4 BYTE)    NOT NULL,
  HTHTRT_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHTRT_FCH_CREACION       DATE                NOT NULL,
  HTHTRT_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_TRANSPORTES IS 'Tabla que contiene los tipos de transportes como SMTP, TTY, WS (Webservices)';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TRANSPORTES.HTHTRT_CDG_TRANSPORTE IS 'Código del canal de transporte para enviar mensajes a los destinatarios.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TRANSPORTES.HTHTRT_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TRANSPORTES.HTHTRT_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TRANSPORTES.HTHTRT_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE UNIQUE INDEX HTHCIA_PK ON EXLTMSGHOST.HTH_COMPANIAS
(HTHCIA_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHEVT_PK ON EXLTMSGHOST.HTH_EVENTOS
(HTHEVT_CDG_MENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHEVI_AK_2 ON EXLTMSGHOST.HTH_EVENTOS_IN
(HTHEVI_CDG_PREFIJO, HTHEVI_NMR_DOCUMENTO, HTHEVI_FCH_CREACION)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHEVI_PK ON EXLTMSGHOST.HTH_EVENTOS_IN
(HTHEVI_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHEVI_AK_1 ON EXLTMSGHOST.HTH_EVENTOS_IN
(HTHEVI_FCH_CREACION)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHREL_PK ON EXLTMSGHOST.HTH_EVENTOS_IN_RELACION
(HTHEVI_SEQ_CDG_PADRE, HTHEVI_SEQ_CDG_HIJO)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHEVO_PK ON EXLTMSGHOST.HTH_EVENTOS_OUT
(HTHEVO_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHEVO_FK_HTHEVI_1 ON EXLTMSGHOST.HTH_EVENTOS_OUT
(HTHEVI_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHEVO_AK_1 ON EXLTMSGHOST.HTH_EVENTOS_OUT
(HTHEVO_MSJ_HASH_CODE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHEVO_AK_2 ON EXLTMSGHOST.HTH_EVENTOS_OUT
(HTHEVO_CDG_PREFIJO, HTHEVO_NMR_DOCUMENTO, HTHEVO_TPO_EVENTO, HTHEVO_NMB_DESTINATARIO, HTHEVO_EST_PROCESO)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHPFL_PK ON EXLTMSGHOST.HTH_PERFILES
(HTHPFL_CDG_PERFIL)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHCPE_PK ON EXLTMSGHOST.HTH_PERFILES_COMPANIAS
(HTHCPE_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHCPE_FK_HTHCIA_1 ON EXLTMSGHOST.HTH_PERFILES_COMPANIAS
(HTHCIA_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHCPE_FK_HTHPLF_2 ON EXLTMSGHOST.HTH_PERFILES_COMPANIAS
(HTHPFL_CDG_PERFIL)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHPSE_PK ON EXLTMSGHOST.HTH_PROCESOS_SEC
(HTHPSE_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHPSE_FK_HTHEVI_1 ON EXLTMSGHOST.HTH_PROCESOS_SEC
(HTHEVI_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHPSE_AK_1 ON EXLTMSGHOST.HTH_PROCESOS_SEC
(HTHPSE_CDG_PREFIJO, HTHPSE_NMR_DOCUMENTO, HTHPSE_TPO_EVENTO)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHRTS_PK ON EXLTMSGHOST.HTH_RUTAS_COMPANIAS
(HTHRTS_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHRTS_FK_HTHEVT_3 ON EXLTMSGHOST.HTH_RUTAS_COMPANIAS
(HTHEVT_CDG_MENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_DAT
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE INDEX HTHRTS_FK_HTHCIA_1 ON EXLTMSGHOST.HTH_RUTAS_COMPANIAS
(HTHCIA_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHTEV_PK ON EXLTMSGHOST.HTH_TIPOS_EVENTO
(HTHTEV_CDG_FLUJOMENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHTMJ_PK ON EXLTMSGHOST.HTH_TIPOS_MENSAJE
(HTHTMJ_CDG_TIPOMENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHTRT_PK ON EXLTMSGHOST.HTH_TRANSPORTES
(HTHTRT_CDG_TRANSPORTE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE PUBLIC SYNONYM HTHCIA FOR EXLTMSGHOST.HTH_COMPANIAS;


CREATE PUBLIC SYNONYM HTHEVT FOR EXLTMSGHOST.HTH_EVENTOS;


CREATE PUBLIC SYNONYM HTHEVI FOR EXLTMSGHOST.HTH_EVENTOS_IN;


CREATE PUBLIC SYNONYM HTHREL FOR EXLTMSGHOST.HTH_EVENTOS_IN_RELACION;


CREATE PUBLIC SYNONYM HTHEVO FOR EXLTMSGHOST.HTH_EVENTOS_OUT;


CREATE PUBLIC SYNONYM HTHPFL FOR EXLTMSGHOST.HTH_PERFILES;


CREATE PUBLIC SYNONYM HTHCPE FOR EXLTMSGHOST.HTH_PERFILES_COMPANIAS;


CREATE PUBLIC SYNONYM HTHPSE FOR EXLTMSGHOST.HTH_PROCESOS_SEC;


CREATE PUBLIC SYNONYM HTHRTS FOR EXLTMSGHOST.HTH_RUTAS_COMPANIAS;


CREATE PUBLIC SYNONYM HTHTEV FOR EXLTMSGHOST.HTH_TIPOS_EVENTO;


CREATE PUBLIC SYNONYM HTHTMJ FOR EXLTMSGHOST.HTH_TIPOS_MENSAJE;


CREATE PUBLIC SYNONYM HTHTRT FOR EXLTMSGHOST.HTH_TRANSPORTES;


CREATE TABLE EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS
(
  HTHCEV_SEQ_CDG            NUMBER              NOT NULL,
  HTHEVT_CDG_MENSAJE        VARCHAR2(3 BYTE)    NOT NULL,
  HTHCEV_FLG_EVENTO_IN      NUMBER(1),
  HTHCEV_FLG_EVENTO_OUT     NUMBER(1),
  HTHCEV_FLG_PUBLICAR       NUMBER(1),
  HTHCEV_FLG_EXPIRADO       NUMBER(1)           NOT NULL,
  HTHCEV_FLG_ORIGEN         NUMBER(1)           DEFAULT 0                     NOT NULL,
  HTHCEV_FLG_DESTINO        NUMBER(1)           DEFAULT 0                     NOT NULL,
  HTHCEV_CDG_USUARIO        VARCHAR2(20 BYTE),
  HTHCEV_FCH_CREACION       DATE,
  HTHCEV_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS IS 'Tabla que contiene la configuración global de los eventos';

COMMENT ON COLUMN EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS.HTHCEV_SEQ_CDG IS 'Código secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS.HTHEVT_CDG_MENSAJE IS 'Código del evento';

COMMENT ON COLUMN EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS.HTHCEV_FLG_EVENTO_IN IS 'Indica si se habilita el procesamiento del evento. Los posibles valores son 1 para habilitar y 0 en caso contrario.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS.HTHCEV_FLG_EVENTO_OUT IS 'Indica si se habilita el procesamiento del evento. Los posibles valores son 1 para habilitar y 0 en caso contrario.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS.HTHCEV_FLG_PUBLICAR IS 'Indica si se debe publicar el mensaje en la web. Los posibles valores son 1 para publicar y 0 en caso contrario';

COMMENT ON COLUMN EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS.HTHCEV_FLG_EXPIRADO IS 'Indica si el registro se encuentra expirado o activo. EXPIRADO=1; ACTIVO=0.';


CREATE TABLE EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS
(
  HTHDRC_SEQ_CDG            NUMBER              NOT NULL,
  HTHCIA_SEQ_CDG            NUMBER              NOT NULL,
  HTHTEV_CDG_FLUJOMENSAJE   VARCHAR2(3 BYTE)    NOT NULL,
  HTHTRT_CDG_TRANSPORTE     VARCHAR2(4 BYTE)    NOT NULL,
  HTHDRC_DSC                VARCHAR2(50 BYTE)   NOT NULL,
  HTHDRC_FLG_EXPIRADO       NUMBER(1)           NOT NULL,
  HTHDRC_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHDRC_FCH_CREACION       DATE                NOT NULL,
  HTHDRC_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS IS 'Tabla que contiene las direcciones asociadas a compañias';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHDRC_SEQ_CDG IS 'Código secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHCIA_SEQ_CDG IS 'Código secuencia de compañia al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHTEV_CDG_FLUJOMENSAJE IS 'Código del tipo evento al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHTRT_CDG_TRANSPORTE IS 'Código del transporte al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHDRC_DSC IS 'Descripción de la dirección, ejemplo para el caso de SMTP puede ser un correo electrónico "jperez@lan.com"';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHDRC_FLG_EXPIRADO IS 'Indica si el registro se encuentra expirado o activo. EXPIRADO=1; ACTIVO=0.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHDRC_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHDRC_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS.HTHDRC_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE TABLE EXLTMSGHOST.HTH_TEMPLATES
(
  HTHTPT_SEQ_CDG            NUMBER              NOT NULL,
  HTHEVT_CDG_MENSAJE        VARCHAR2(3 BYTE)    NOT NULL,
  HTHTMJ_CDG_TIPOMENSAJE    VARCHAR2(4 BYTE)    NOT NULL,
  HTHTPT_TPO_VERSION        VARCHAR2(10 BYTE)   NOT NULL,
  HTHTPT_NMR_VERSION        VARCHAR2(10 BYTE)   NOT NULL,
  HTHTPT_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHTPT_FCH_CREACION       DATE                NOT NULL,
  HTHTPT_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_TEMPLATES IS 'Tabla que contiene los templates o formato de mensaje estándar IATA com FSU (versión 14)';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHTPT_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHTPT_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHTPT_SEQ_CDG IS 'Código secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHEVT_CDG_MENSAJE IS 'Código del evento';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHTMJ_CDG_TIPOMENSAJE IS 'Código del tipo de mensaje.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHTPT_TPO_VERSION IS 'Contiene los tipos de template para los mensajes. Ejm. FSU, RCS, XFSU, etc...';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHTPT_NMR_VERSION IS 'Numero de la version.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_TEMPLATES.HTHTPT_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';


CREATE UNIQUE INDEX HTHCEV_PK ON EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS
(HTHCEV_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHCEV_FK_HTHEVT_1 ON EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS
(HTHEVT_CDG_MENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHDRC_PK ON EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS
(HTHDRC_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHDRC_FK_HTHTEV_3 ON EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS
(HTHTEV_CDG_FLUJOMENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHDRC_FK_HTHTRT_2 ON EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS
(HTHTRT_CDG_TRANSPORTE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHDRC_FK_HTHCIA_1 ON EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS
(HTHCIA_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE UNIQUE INDEX HTHTPT_PK ON EXLTMSGHOST.HTH_TEMPLATES
(HTHTPT_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHTPT_FK_HTHTMJ_1 ON EXLTMSGHOST.HTH_TEMPLATES
(HTHTMJ_CDG_TIPOMENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHTPT_FK_HTHEVT_2 ON EXLTMSGHOST.HTH_TEMPLATES
(HTHEVT_CDG_MENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE PUBLIC SYNONYM HTHCEV FOR EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS;


CREATE PUBLIC SYNONYM HTHDRC FOR EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS;


CREATE PUBLIC SYNONYM HTHTPT FOR EXLTMSGHOST.HTH_TEMPLATES;


CREATE TABLE EXLTMSGHOST.HTH_EVENTOS_COMPANIAS
(
  HTHECA_SEQ_CDG            NUMBER              NOT NULL,
  HTHEVT_CDG_MENSAJE        VARCHAR2(3 BYTE)    NOT NULL,
  HTHCIA_SEQ_CDG            NUMBER              NOT NULL,
  HTHTEV_CDG_FLUJOMENSAJE   VARCHAR2(3 BYTE)    NOT NULL,
  HTHTPT_SEQ_CDG            NUMBER,
  HTHECA_FLG_VALIDAR        NUMBER(1)           NOT NULL,
  HTHECA_FLG_LEGADO         NUMBER(1)           NOT NULL,
  HTHECA_FLG_EXPIRADO       NUMBER(1)           NOT NULL,
  HTHECA_CDG_USUARIO        VARCHAR2(20 BYTE)   NOT NULL,
  HTHECA_FCH_CREACION       DATE                NOT NULL,
  HTHECA_FCH_ACTUALIZACION  DATE
)
TABLESPACE EXLTMSGHOST_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE EXLTMSGHOST.HTH_EVENTOS_COMPANIAS IS 'Tabla que contiene los eventos asociados a compañias';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHECA_SEQ_CDG IS 'Código secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHEVT_CDG_MENSAJE IS 'Código de evento al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHCIA_SEQ_CDG IS 'Código secuencia de compañia al cual se asosia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHTEV_CDG_FLUJOMENSAJE IS 'Código del tipo de evento al cual se asocia.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHTPT_SEQ_CDG IS 'Código secuencial del registro de la tabla';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHECA_FLG_VALIDAR IS 'Indica si el evento de la compañia será validado o no en el proceso. A VALIDAR=1; de lo contrario 0.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHECA_FLG_LEGADO IS 'Indica si se debe actualizar sistemas legados. Los posibles valores son 1 para publicar y 0 en caso contrario.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHECA_FLG_EXPIRADO IS 'Indica si el registro se encuentra expirado o activo. EXPIRADO=1; ACTIVO=0.';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHECA_CDG_USUARIO IS 'Usuario que inserta/actualiza registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHECA_FCH_CREACION IS 'Timestamp de inserción del registro';

COMMENT ON COLUMN EXLTMSGHOST.HTH_EVENTOS_COMPANIAS.HTHECA_FCH_ACTUALIZACION IS 'Timestamp de actualización del registro';


CREATE UNIQUE INDEX HTHECA_PK ON EXLTMSGHOST.HTH_EVENTOS_COMPANIAS
(HTHECA_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHECA_FK_HTHTPT_4 ON EXLTMSGHOST.HTH_EVENTOS_COMPANIAS
(HTHTPT_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHECA_FK_HTHCIA_1 ON EXLTMSGHOST.HTH_EVENTOS_COMPANIAS
(HTHCIA_SEQ_CDG)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHECA_FK_HTHEVT_2 ON EXLTMSGHOST.HTH_EVENTOS_COMPANIAS
(HTHEVT_CDG_MENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE INDEX HTHECA_FK_HTHTEV_3 ON EXLTMSGHOST.HTH_EVENTOS_COMPANIAS
(HTHTEV_CDG_FLUJOMENSAJE)
LOGGING
TABLESPACE EXLTMSGHOST_IDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE;


CREATE PUBLIC SYNONYM HTHECA FOR EXLTMSGHOST.HTH_EVENTOS_COMPANIAS;


ALTER TABLE EXLTMSGHOST.HTH_COMPANIAS ADD (
  CONSTRAINT HTHCIA_PK
 PRIMARY KEY
 (HTHCIA_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS ADD (
  CONSTRAINT HTHEVT_PK
 PRIMARY KEY
 (HTHEVT_CDG_MENSAJE)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_IN ADD (
  CONSTRAINT HTHEVI_PK
 PRIMARY KEY
 (HTHEVI_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_IN_RELACION ADD (
  CONSTRAINT HTHREL_PK
 PRIMARY KEY
 (HTHEVI_SEQ_CDG_PADRE, HTHEVI_SEQ_CDG_HIJO)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_OUT ADD (
  CONSTRAINT HTHEVO_PK
 PRIMARY KEY
 (HTHEVO_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_PERFILES ADD (
  CONSTRAINT HTHPFL_PK
 PRIMARY KEY
 (HTHPFL_CDG_PERFIL)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_PERFILES_COMPANIAS ADD (
  CONSTRAINT HTHCPE_PK
 PRIMARY KEY
 (HTHCPE_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_PROCESOS_SEC ADD (
  CONSTRAINT HTHPSE_PK
 PRIMARY KEY
 (HTHPSE_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_RUTAS_COMPANIAS ADD (
  CONSTRAINT HTHRTS_PK
 PRIMARY KEY
 (HTHRTS_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_TIPOS_EVENTO ADD (
  CONSTRAINT HTHTEV_PK
 PRIMARY KEY
 (HTHTEV_CDG_FLUJOMENSAJE)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_TIPOS_MENSAJE ADD (
  CONSTRAINT HTHTMJ_PK
 PRIMARY KEY
 (HTHTMJ_CDG_TIPOMENSAJE)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_TRANSPORTES ADD (
  CONSTRAINT HTHTRT_PK
 PRIMARY KEY
 (HTHTRT_CDG_TRANSPORTE)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS ADD (
  CONSTRAINT HTHCEV_PK
 PRIMARY KEY
 (HTHCEV_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS ADD (
  CONSTRAINT HTHDRC_PK
 PRIMARY KEY
 (HTHDRC_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_TEMPLATES ADD (
  CONSTRAINT HTHTPT_PK
 PRIMARY KEY
 (HTHTPT_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_COMPANIAS ADD (
  CONSTRAINT HTHECA_PK
 PRIMARY KEY
 (HTHECA_SEQ_CDG)
    USING INDEX 
    TABLESPACE EXLTMSGHOST_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_IN_RELACION ADD (
  CONSTRAINT HTHREL_FK_HTHEVI_1 
 FOREIGN KEY (HTHEVI_SEQ_CDG_PADRE) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS_IN (HTHEVI_SEQ_CDG));

ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_IN_RELACION ADD (
  CONSTRAINT HTHREL_FK_HTHEVI_2 
 FOREIGN KEY (HTHEVI_SEQ_CDG_HIJO) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS_IN (HTHEVI_SEQ_CDG));



--ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_IN_RELACION ADD (
--  CONSTRAINT HTHREL_FK_CDDN_1 
-- FOREIGN KEY (DMNO_ID, CDDN_ID) 
-- REFERENCES EXPRICING.CODIGO_DOMINIOS (DMNO_ID,CDDN_ID));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_OUT ADD (
  CONSTRAINT HTHEVO_FK_HTHEVI_1 
 FOREIGN KEY (HTHEVI_SEQ_CDG) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS_IN (HTHEVI_SEQ_CDG));


ALTER TABLE EXLTMSGHOST.HTH_PERFILES_COMPANIAS ADD (
  CONSTRAINT HTHCPE_FK_HTHCIA_1 
 FOREIGN KEY (HTHCIA_SEQ_CDG) 
 REFERENCES EXLTMSGHOST.HTH_COMPANIAS (HTHCIA_SEQ_CDG));

ALTER TABLE EXLTMSGHOST.HTH_PERFILES_COMPANIAS ADD (
  CONSTRAINT HTHCPE_FK_HTHPLF_2 
 FOREIGN KEY (HTHPFL_CDG_PERFIL) 
 REFERENCES EXLTMSGHOST.HTH_PERFILES (HTHPFL_CDG_PERFIL));


ALTER TABLE EXLTMSGHOST.HTH_PROCESOS_SEC ADD (
  CONSTRAINT HTHPSE_FK_HTHEVI_1 
 FOREIGN KEY (HTHEVI_SEQ_CDG) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS_IN (HTHEVI_SEQ_CDG));


ALTER TABLE EXLTMSGHOST.HTH_RUTAS_COMPANIAS ADD (
  CONSTRAINT HTHRTS_FK_HTHEVT_3 
 FOREIGN KEY (HTHEVT_CDG_MENSAJE) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS (HTHEVT_CDG_MENSAJE));

ALTER TABLE EXLTMSGHOST.HTH_RUTAS_COMPANIAS ADD (
  CONSTRAINT HTHRTS_FK_HTHCIA_1 
 FOREIGN KEY (HTHCIA_SEQ_CDG) 
 REFERENCES EXLTMSGHOST.HTH_COMPANIAS (HTHCIA_SEQ_CDG));


ALTER TABLE EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS ADD (
  CONSTRAINT HTHCEV_FK_HTHEVT_1 
 FOREIGN KEY (HTHEVT_CDG_MENSAJE) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS (HTHEVT_CDG_MENSAJE));


ALTER TABLE EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS ADD (
  CONSTRAINT HTHDRC_FK_HTHTRT_1 
 FOREIGN KEY (HTHTRT_CDG_TRANSPORTE) 
 REFERENCES EXLTMSGHOST.HTH_TRANSPORTES (HTHTRT_CDG_TRANSPORTE));

ALTER TABLE EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS ADD (
  CONSTRAINT HTHDRC_FK_HTHTEV_2 
 FOREIGN KEY (HTHTEV_CDG_FLUJOMENSAJE) 
 REFERENCES EXLTMSGHOST.HTH_TIPOS_EVENTO (HTHTEV_CDG_FLUJOMENSAJE));

ALTER TABLE EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS ADD (
  CONSTRAINT HTHDRC_FK_HTHCIA_3 
 FOREIGN KEY (HTHCIA_SEQ_CDG) 
 REFERENCES EXLTMSGHOST.HTH_COMPANIAS (HTHCIA_SEQ_CDG));


ALTER TABLE EXLTMSGHOST.HTH_TEMPLATES ADD (
  CONSTRAINT HTHTPT_FK_HTHTMJ_2 
 FOREIGN KEY (HTHTMJ_CDG_TIPOMENSAJE) 
 REFERENCES EXLTMSGHOST.HTH_TIPOS_MENSAJE (HTHTMJ_CDG_TIPOMENSAJE));

ALTER TABLE EXLTMSGHOST.HTH_TEMPLATES ADD (
  CONSTRAINT HTHTPT_FK_HTHEVT_1 
 FOREIGN KEY (HTHEVT_CDG_MENSAJE) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS (HTHEVT_CDG_MENSAJE));


ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_COMPANIAS ADD (
  CONSTRAINT HTHECA_FK_HTHTPT_4 
 FOREIGN KEY (HTHTPT_SEQ_CDG) 
 REFERENCES EXLTMSGHOST.HTH_TEMPLATES (HTHTPT_SEQ_CDG));

ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_COMPANIAS ADD (
  CONSTRAINT HTHECA_FK_HTHEVT_2 
 FOREIGN KEY (HTHEVT_CDG_MENSAJE) 
 REFERENCES EXLTMSGHOST.HTH_EVENTOS (HTHEVT_CDG_MENSAJE));

ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_COMPANIAS ADD (
  CONSTRAINT HTHECA_FK_HTHCIA_1 
 FOREIGN KEY (HTHCIA_SEQ_CDG) 
 REFERENCES EXLTMSGHOST.HTH_COMPANIAS (HTHCIA_SEQ_CDG));

ALTER TABLE EXLTMSGHOST.HTH_EVENTOS_COMPANIAS ADD (
  CONSTRAINT HTHECA_FK_HTHTEV_3 
 FOREIGN KEY (HTHTEV_CDG_FLUJOMENSAJE) 
 REFERENCES EXLTMSGHOST.HTH_TIPOS_EVENTO (HTHTEV_CDG_FLUJOMENSAJE));


 -- Se agrega nueva vista definida por TATA
CREATE TABLE EXLTMSGHOST.EXLTMSGHOST_DUAL (
       DUMMY                VARCHAR2(1) NULL
);
 
CREATE OR REPLACE VIEW EXLTMSGHOST.EXLTMSGHOST_VWDUAL AS
       SELECT EXLTMSGHOST.EXLTMSGHOST_DUAL.DUMMY
       FROM EXLTMSGHOST.EXLTMSGHOST_DUAL;

 
 
GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_COMPANIAS TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_EVENTOS TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_EVENTOS_IN TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_EVENTOS_IN_RELACION TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_EVENTOS_OUT TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_PERFILES TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_PERFILES_COMPANIAS TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_PROCESOS_SEC TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_RUTAS_COMPANIAS TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_TIPOS_EVENTO TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_TIPOS_MENSAJE TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_TRANSPORTES TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_CONFIGURACIONES_EVENTOS TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_DIRECCIONES_COMPANIAS TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_TEMPLATES TO SRVLTMSGHOST;

GRANT DELETE, INSERT, SELECT, UPDATE ON  EXLTMSGHOST.HTH_EVENTOS_COMPANIAS TO SRVLTMSGHOST;

GRANT SELECT, INSERT, UPDATE, DELETE ON EXLTMGHOSTFT.HTH_FILE TO SRVLTMSGHOST;

GRANT SELECT, INSERT, UPDATE, DELETE ON EXLTMGHOSTFT.HTH_TESTCASE TO SRVLTMSGHOST;

GRANT SELECT, INSERT, UPDATE, DELETE ON EXLTMGHOSTFT.HTH_VALIDATION TO SRVLTMSGHOST;


COMMIT;