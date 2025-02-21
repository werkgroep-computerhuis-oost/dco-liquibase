-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE TABLE equipment
(
    id            BIGINT                 NOT NULL AUTO_INCREMENT,
    category      ENUM ('DESKTOP', 'LAPTOP', 'TABLET', 'MOBILE', 'SIM', 'USB_STICK'),
    status        ENUM ('CUSTOMER_OWNED','INCOMING_GIFT','SUITABLE_FOR_GIFT','RESERVED','GIFT_ISSUED','DEMOLITION'),
    manufacturer  VARCHAR(255)           NOT NULL,
    model         VARCHAR(255),
    specification JSON                   NOT NULL,
    customer_id   BIGINT,
    client_id BIGINT,
    registered    DATETIME DEFAULT NOW() NOT NULL,
    unregistered  DATETIME,

    CONSTRAINT equipment_pk PRIMARY KEY (id),
    CONSTRAINT equipment_fk_1 FOREIGN KEY (customer_id) REFERENCES individuals (id) ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT equipment_fk_2 FOREIGN KEY (client_id) REFERENCES clients (id) ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE = InnoDB
  CHARACTER SET 'utf8'
  COLLATE 'utf8_unicode_ci';
CREATE INDEX equipment_i_1 ON equipment (customer_id);
