# fno-trading-database
# Futures & Options Trading Database (NSE, BSE, MCX)

## Overview
This project designs a scalable relational database for storing and analyzing
high-volume Futures & Options (F&O) trading data across Indian exchanges.

Dataset used:
NSE Future and Options Dataset (3 months, ~2.5M rows).

The schema is designed to support future ingestion from BSE (index options)
and MCX (commodity futures).

---

## Design Rationale

### Why Third Normal Form (3NF)
- Avoids data duplication during continuous ingestion
- Reduces update anomalies
- Improves consistency for symbols, expiries, and exchanges
- Suitable for OLTP + analytical hybrid workloads

### Why Star Schema Was Avoided
- Star schema duplicates dimension data
- Not ideal for high-frequency trade ingestion
- Expensive updates for expiry/strike-heavy option chains
- Better suited for BI layers, not raw trading data

---

## Schema Overview
- exchanges: Exchange master (NSE, BSE, MCX)
- instruments: Trading symbols and instrument types
- expiries: Expiry date, strike price, option type
- trades: Daily OHLC, volume, open interest

---

## Scalability & Performance
- Designed for 10M+ rows
- Indexed time-series columns
- Exchange-based partitioning
- Window functions for rolling analytics
- BRIN indexes suitable for timestamp-heavy queries

---

## Tech Stack
- PostgreSQL / DuckDB
- SQL
- Python (Pandas)
- Jupyter Notebook

---

## Usage
1. Create tables using ddl scripts
2. Load Kaggle CSV using ingestion notebook
3. Run analytical queries from queries folder
