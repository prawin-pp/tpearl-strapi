START TRANSACTION;

INSERT INTO
  payment_channels (
    id,
    "name",
    gross_profit,
    created_at,
    updated_at,
    published_at
  )
VALUES
  (
    1,
    'CASH',
    0,
    NOW(),
    NOW(),
    NOW()
  ),
  (
    2,
    'PROMPTPAY',
    0,
    NOW(),
    NOW(),
    NOW()
  ),
  (
    3,
    'GRAB',
    32.1,
    NOW(),
    NOW(),
    NOW()
  ),
  (
    4,
    'LINEMAN',
    32.1,
    NOW(),
    NOW(),
    NOW()
  ),
  (
    5,
    'ROBINHOOD',
    0,
    NOW(),
    NOW(),
    NOW()
  ) ON CONFLICT (id) DO
UPDATE
SET
  "name" = EXCLUDED."name",
  "gross_profit" = EXCLUDED."gross_profit";

ALTER SEQUENCE payment_channels_id_seq RESTART 6;

END TRANSACTION;
