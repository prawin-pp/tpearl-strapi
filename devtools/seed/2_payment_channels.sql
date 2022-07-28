START TRANSACTION;

INSERT INTO
  payment_channels (
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
    'CASH',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    2,
    'PROMPTPAY',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    3,
    'GRAB',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    4,
    'LINEMAN',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  ),
  (
    5,
    'ROBINHOOD',
    NOW(),
    NOW(),
    NOW(),
    1,
    1
  );

ALTER SEQUENCE payment_channels_id_seq RESTART 60;

END TRANSACTION;
