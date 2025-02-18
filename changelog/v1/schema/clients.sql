-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE clients
(
    id           BIGINT                 NOT NULL AUTO_INCREMENT,
    name         VARCHAR(50)            NOT NULL,
    reporting    BOOLEAN  DEFAULT FALSE NOT NULL,
    registered   DATETIME DEFAULT NOW() NOT NULL,
    unregistered DATETIME,
    CONSTRAINT clients_pk PRIMARY KEY (id)
) ENGINE = InnoDB
  CHARACTER SET 'utf8'
  COLLATE 'utf8_unicode_ci';
