START TRANSACTION;

INSERT INTO
  product_addons (
    id,
    "name",
    cost,
    created_at,
    updated_at,
    published_at
  )
VALUES
  (1, 'ไข่มุก', 0, NOW(), NOW(), NOW()),
  (2, 'เยลลี่ฟรุตสลัด', 0, NOW(), NOW(), NOW()),
  (3, 'บุกบราวน์ชูการ์', 0, NOW(), NOW(), NOW()),
  (4, 'ฮันนี่เจลลี่', 0, NOW(), NOW(), NOW()),
  (5, 'ปั่น', 0, NOW(), NOW(), NOW()) ON CONFLICT (id) DO
UPDATE
SET
  "name" = EXCLUDED."name",
  "cost" = EXCLUDED."cost";

ALTER SEQUENCE product_addons_id_seq RESTART 6;

END TRANSACTION;
