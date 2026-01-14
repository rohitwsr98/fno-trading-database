SELECT
    t.trade_date,
    ROUND(
        STDDEV(t.close) OVER (
            ORDER BY t.trade_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_7d_volatility
FROM trades t
JOIN instruments i
  ON t.instrument_id = i.instrument_id
WHERE i.symbol = 'NIFTY'
ORDER BY t.trade_date;

-- Sample Output:
-- trade_date  | rolling_7d_volatility
-- ------------+----------------------
-- 2024-01-08  | 112.45
-- 2024-01-09  | 118.72
-- 2024-01-10  | 121.09
