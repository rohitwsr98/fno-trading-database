SELECT
    i.symbol,
    MAX(t.volume) AS max_volume_last_30_days
FROM trades t
JOIN instruments i
  ON t.instrument_id = i.instrument_id
WHERE
    t.trade_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY
    i.symbol
ORDER BY
    max_volume_last_30_days DESC;

-- Sample Output:
-- symbol      | max_volume_last_30_days
-- ------------+-------------------------
-- BANKNIFTY  | 182345600
-- NIFTY      | 165892300
-- GOLD       | 98456210
