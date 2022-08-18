START TRANSACTION;

INSERT INTO
  payment_channels (
    id,
    "name",
    created_at,
    updated_at,
    published_at
  )
VALUES
  (
    1,
    'CASH',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    2,
    'PROMPTPAY',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    3,
    'GRAB',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    4,
    'LINEMAN',
    NOW(),
    NOW(),
    NOW()
  ),
  (
    5,
    'ROBINHOOD',
    NOW(),
    NOW(),
    NOW()
  ) ON CONFLICT (id) DO
UPDATE
SET
  "name" = EXCLUDED."name";

ALTER SEQUENCE payment_channels_id_seq RESTART 6;

END TRANSACTION;
