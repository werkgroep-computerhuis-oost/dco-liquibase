-- liquibase formatted sql
-- changeset ronlievens:schema-1
CREATE VIEW ticket_status_overview AS
SELECT ts.*,
       i.first_name,
       i.infix,
       i.last_name
FROM ticket_status ts
         LEFT JOIN individuals i ON i.id = ts.volunteer_id;
