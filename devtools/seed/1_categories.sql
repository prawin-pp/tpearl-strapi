START TRANSACTION;

INSERT INTO
    categories (
        id,
        "name",
        created_at,
        updated_at,
        published_at
    )
VALUES
    (1, 'ชานม', NOW(), NOW(), NOW()),
    (2, 'ชาเขียว', NOW(), NOW(), NOW()),
    (3, 'ชานมสด', NOW(), NOW(), NOW()),
    (4, 'โซดา', NOW(), NOW(), NOW()),
    (5, 'นมหมีเย็น', NOW(), NOW(), NOW()),
    (6, 'นมหมีปั่น', NOW(), NOW(), NOW()),
    (7, 'โปรโมชั่น', NOW(), NOW(), NOW()) ON CONFLICT (id) DO
UPDATE
SET
    "name" = EXCLUDED."name";

ALTER SEQUENCE categories_id_seq RESTART 8;

END TRANSACTION;
