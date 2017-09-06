/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     05/07/2017 12:15:53                          */
/*==============================================================*/

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA 
(
   ID_CATEGORIA         INTEGER              not null,
   NOMBRE_CATEGORIA     VARCHAR2(40),
   DESCRIPCION          VARCHAR2(200),
   constraint PK_CATEGORIA primary key (ID_CATEGORIA)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_CLIENTE           INTEGER              not null,
   CI_CLIENTE           VARCHAR2(11),
   NOMBRE_CLIENTE       VARCHAR2(40),
   APELLIDO_CLIENTE     VARCHAR2(40),
   TELEFONO_CLIENTE     VARCHAR2(10),
   CIUDAD_CLIENTE       VARCHAR2(20),
   DIRECCION_CLIENTE    VARCHAR2(40),
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: DETALLE_PEDIDO                                        */
/*==============================================================*/
create table DETALLE_PEDIDO 
(
   ID_PRODUCTO          INTEGER,
   ID_PEDIDO            INTEGER,
   CANTIDAD             INTEGER,
   PRECIO_SUBTOTAL      FLOAT,
   DESCUENTO            FLOAT,
   PRECIO_TOTAL         FLOAT
);

/*==============================================================*/
/* Index: FK_DETALLE_PEDIDO_PRODUCTO_FK                         */
/*==============================================================*/
create index FK_DETALLE_PEDIDO_PRODUCTO_FK on DETALLE_PEDIDO (
   ID_PRODUCTO ASC
);

/*==============================================================*/
/* Index: FK_DETALLE_PEDIDO_PEDIDO_FK                           */
/*==============================================================*/
create index FK_DETALLE_PEDIDO_PEDIDO_FK on DETALLE_PEDIDO (
   ID_PEDIDO ASC
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO 
(
   ID_PEDIDO            INTEGER              not null,
   ID_VENDEDOR          INTEGER,
   ID_CLIENTE           INTEGER,
   FECHA_REALIZACION    DATE,
   FECHA_ENVIO          DATE,
   FORMA_ENVIO          VARCHAR2(40),
   constraint PK_PEDIDO primary key (ID_PEDIDO)
);

/*==============================================================*/
/* Index: FK_PEDIDO_VENDEDOR_FK                                 */
/*==============================================================*/
create index FK_PEDIDO_VENDEDOR_FK on PEDIDO (
   ID_VENDEDOR ASC
);

/*==============================================================*/
/* Index: FK_PEDIDO_CLIENTE_FK                                  */
/*==============================================================*/
create index FK_PEDIDO_CLIENTE_FK on PEDIDO (
   ID_CLIENTE ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   ID_PRODUCTO          INTEGER              not null,
   ID_PROVEEDOR         INTEGER,
   ID_CATEGORIA         INTEGER,
   NOMBRE_PRODUCTO      VARCHAR2(70),
   PRECIO_UNITARIO      FLOAT,
   UNIDADES_EXISTENTES  INTEGER,
   FECHA_VENCIMIENTO    VARCHAR2(10),
   DESCRIPCION          VARCHAR2(200),
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Index: FK_PRODUCTO_PROVEEDOR_FK                              */
/*==============================================================*/
create index FK_PRODUCTO_PROVEEDOR_FK on PRODUCTO (
   ID_PROVEEDOR ASC
);

/*==============================================================*/
/* Index: FK_PRODUCTO_CATEGORIA_FK                              */
/*==============================================================*/
create index FK_PRODUCTO_CATEGORIA_FK on PRODUCTO (
   ID_CATEGORIA ASC
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR 
(
   ID_PROVEEDOR         INTEGER              not null,
   NOMBRE_EMPRESA       VARCHAR2(40),
   PAIS_EMPRESA         VARCHAR2(20),
   CIUDAD_EMPRESA       VARCHAR2(20),
   DIRECCION_EMPRESA    VARCHAR2(40),
   NOMBRE_CONTACTO      VARCHAR2(40),
   APELLIDO_CONTACTO    VARCHAR2(40),
   TELEFONO_CONTACTO    VARCHAR2(10),
   CARGO_CONTACTO       VARCHAR2(20),
   constraint PK_PROVEEDOR primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR 
(
   ID_VENDEDOR          INTEGER              not null,
   CI_VENDEDOR          VARCHAR2(11),
   NOMBRE_VENDEDOR      VARCHAR2(40),
   APELLIDO_VENDEDOR    VARCHAR2(40),
   FECHA_NACIMIENTO     DATE,
   SEXO_VENDEDOR        VARCHAR2(1),
   CIUDAD_VENDEDOR      VARCHAR2(20),
   DIRECCION_VENDEDOR   VARCHAR2(40),
   CORREO_VENDEDOR      VARCHAR2(70),
   TELEFONO_VENDEDOR    VARCHAR2(10),
   SUELDO_VENDEDOR      FLOAT,
   FECHA_CONTRATO       DATE,
   TIPO_CONTRATO        VARCHAR2(20),
   FOTO_VENDEDOR        BLOB,
   constraint PK_VENDEDOR primary key (ID_VENDEDOR)
);

alter table DETALLE_PEDIDO
   add constraint FK_DETALLE__FK_DETALL_PEDIDO foreign key (ID_PEDIDO)
      references PEDIDO (ID_PEDIDO);

alter table DETALLE_PEDIDO
   add constraint FK_DETALLE__FK_DETALL_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO);

alter table PEDIDO
   add constraint FK_PEDIDO_FK_PEDIDO_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table PEDIDO
   add constraint FK_PEDIDO_FK_PEDIDO_VENDEDOR foreign key (ID_VENDEDOR)
      references VENDEDOR (ID_VENDEDOR);

alter table PRODUCTO
   add constraint FK_PRODUCTO_FK_PRODUC_CATEGORI foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA);

alter table PRODUCTO
   add constraint FK_PRODUCTO_FK_PRODUC_PROVEEDO foreign key (ID_PROVEEDOR)
      references PROVEEDOR (ID_PROVEEDOR);

