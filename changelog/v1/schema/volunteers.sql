-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE volunteers
(
    person_id    BIGINT                 NOT NULL,
    registered   DATETIME DEFAULT NOW() NOT NULL,
    unregistered DATETIME,

    CONSTRAINT volunteers_pk PRIMARY KEY (person_id, registered),
    CONSTRAINT volunteers_fk_1 FOREIGN KEY (person_id) REFERENCES individuals (id) ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE = InnoDB
  CHARACTER SET 'utf8'
  COLLATE 'utf8_unicode_ci';
