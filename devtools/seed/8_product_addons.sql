START TRANSACTION;

INSERT INTO
  product_addons (
    id,
    "name",
    created_at,
    updated_at,
    published_at
  )
VALUES
  (1, 'ไข่มุก', NOW(), NOW(), NOW()),
  (2, 'เยลลี่ฟรุตสลัด', NOW(), NOW(), NOW()),
  (3, 'บุกบราวน์ชูการ์', NOW(), NOW(), NOW()),
  (4, 'ฮันนี่เจลลี่', NOW(), NOW(), NOW()),
  (5, 'ปั่น', NOW(), NOW(), NOW()) ON CONFLICT (id) DO
UPDATE
SET
  "name" = EXCLUDED."name";

ALTER SEQUENCE product_addons_id_seq RESTART 6;

END TRANSACTION;
