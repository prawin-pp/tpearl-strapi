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
  (4, 'ปั่น', NOW(), NOW(), NOW());

ALTER SEQUENCE product_addons_id_seq RESTART 5;

END TRANSACTION;
