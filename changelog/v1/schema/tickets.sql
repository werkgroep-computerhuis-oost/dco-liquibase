-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE tickets
(
    id          BIGINT                 NOT NULL AUTO_INCREMENT,
    client_id   BIGINT,
    ticket_type  ENUM ('REPAIR', 'ISSUE') NOT NULL,
    equipment_id BIGINT,

    subject     VARCHAR(255),
    description TEXT,
    details     JSON,
    registered  DATETIME DEFAULT NOW() NOT NULL,
    unregistered DATETIME,

    CONSTRAINT tickets_pk PRIMARY KEY (id),
    CONSTRAINT tickets_fk_1 FOREIGN KEY (equipment_id) REFERENCES equipment (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT tickets_fk_2 FOREIGN KEY (client_id) REFERENCES clients (id) ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE = InnoDB
  CHARACTER SET 'utf8'
  COLLATE 'utf8_unicode_ci';
