SELECT
    e.exchange_code,
    i.symbol,
    ROUND(AVG(t.settle_pr), 2) AS avg_settle_price
FROM trades t
JOIN instruments i
  ON t.instrument_id = i.instrument_id
JOIN exchanges e
  ON t.exchange_id = e.exchange_id
WHERE
    (i.symbol = 'GOLD' AND e.exchange_code = 'MCX')
    OR
    (i.symbol = 'NIFTY' AND e.exchange_code = 'NSE')
GROUP BY
    e.exchange_code,
    i.symbol
ORDER BY
    e.exchange_code;

-- Sample Output:
-- exchange_code | symbol | avg_settle_price
-- --------------+--------+------------------
-- MCX           | GOLD   | 62145.75
-- NSE           | NIFTY  | 21834.60
