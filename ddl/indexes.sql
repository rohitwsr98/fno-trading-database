CREATE INDEX idx_trade_date ON trades(trade_date);
CREATE INDEX idx_exchange ON trades(exchange_id);
CREATE INDEX idx_symbol ON instruments(symbol);
CREATE INDEX idx_created_at_brin ON trades USING BRIN(created_at);
