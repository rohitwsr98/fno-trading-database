CREATE TABLE exchanges (
  exchange_id SERIAL PRIMARY KEY,
  exchange_code VARCHAR(10) UNIQUE NOT NULL,
  exchange_name VARCHAR(50)
);

CREATE TABLE instruments (
  instrument_id SERIAL PRIMARY KEY,
  symbol VARCHAR(50) NOT NULL,
  instrument_type VARCHAR(20) NOT NULL
);

CREATE TABLE expiries (
  expiry_id SERIAL PRIMARY KEY,
  expiry_dt DATE NOT NULL,
  strike_pr NUMERIC,
  option_typ VARCHAR(2)
);

CREATE TABLE trades (
  trade_id BIGSERIAL PRIMARY KEY,
  instrument_id INT REFERENCES instruments(instrument_id),
  exchange_id INT REFERENCES exchanges(exchange_id),
  expiry_id INT REFERENCES expiries(expiry_id),
  trade_date DATE,
  open NUMERIC,
  high NUMERIC,
  low NUMERIC,
  close NUMERIC,
  settle_pr NUMERIC,
  volume BIGINT,
  open_int BIGINT,
  created_at TIMESTAMP
);
