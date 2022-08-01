START TRANSACTION;

INSERT INTO
  categories (
    id,
    "name",
    created_at,
    updated_at,
    published_at,
    created_by_id,
    updated_by_id
  )
VALUES
  (
    1,
    'ชานม (Milk Tea)',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    2,
    'ชาใส (Green Tea)',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    3,
    'โซดา ซู่ซ่า (Sparkling Soda)',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    4,
    'นมหมีปั่น',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    5,
    'นมหมีเย็น',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    6,
    'มิลล์เชค (Milk Shake Premium)',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  );

ALTER SEQUENCE categories_id_seq RESTART 7;

END TRANSACTION;
