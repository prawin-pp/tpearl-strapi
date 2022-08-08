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
  (
    1,
    'ชานม (Milk Tea)',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    2,
    'ชาเขียว (Green Tea)',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    3,
    'ชานมสด (Milk Shake)',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    4,
    'โซดา (Italian Soda)',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    5,
    'นมหมีเย็น (Iced Bear Milk)',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    6,
    'นมหมีปั่น (Smoothie Bear Milk)',
    NOW(),
    NOW(),
    NOW()
  );

ALTER SEQUENCE categories_id_seq RESTART 7;

END TRANSACTION;
