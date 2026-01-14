SELECT i.symbol,
       e.exchange_code,
       MAX(t.open_int) - MIN(t.open_int) AS oi_change
FROM trades t
JOIN instruments i ON t.instrument_id = i.instrument_id
JOIN exchanges e ON t.exchange_id = e.exchange_id
GROUP BY i.symbol, e.exchange_code
ORDER BY oi_change DESC
LIMIT 10;
