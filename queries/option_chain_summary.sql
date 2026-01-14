SELECT
    ex.expiry_dt,
    ex.strike_pr,
    ex.option_typ,
    SUM(t.volume) AS total_volume
FROM trades t
JOIN expiries ex
  ON t.expiry_id = ex.expiry_id
GROUP BY
    ex.expiry_dt,
    ex.strike_pr,
    ex.option_typ
ORDER BY
    ex.expiry_dt,
    ex.strike_pr,
    ex.option_typ;

-- Sample Output:
-- expiry_dt   | strike_pr | option_typ | total_volume
-- ------------+-----------+------------+--------------
-- 2024-01-25  | 21500     | CE         | 845320
-- 2024-01-25  | 21500     | PE         | 912450
