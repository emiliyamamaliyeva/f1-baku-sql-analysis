# F1 Baku SQL Analysis

A learning project analyzing Formula 1 data using PostgreSQL, with a focus on the Azerbaijan Grand Prix (Baku).

## Project Goal
Design a relational database based on historical Formula 1 data and write SQL queries to analyze race results, with a particular focus on the Baku Grand Prix.

## Data Source
[Formula 1 World Championship Dataset (2000–2026)](https://www.kaggle.com/datasets/jtrotman/formula-1-race-data) — Kaggle.
Data through 2024 was collected from ergast.com (public domain); from 2025 onward it is updated via the jolpi.ca API.

## Tech Stack
- PostgreSQL 17
- pgAdmin

## Database Structure
The database consists of 5 related tables:
- `circuits` — race tracks
- `drivers` — drivers
- `constructors` — teams
- `races` — races (references `circuits`)
- `results` — race results (references `races`, `drivers`, `constructors`)

Full schema: [schema.sql](schema.sql)

## Repository Structure
```
f1-baku-sql-analysis/
├── README.md
├── schema.sql              -- создание всех таблиц
├── data/                   -- исходные CSV с Kaggle
└── queries/                -- аналитические SQL-запросы
    └── 01_winners_baku.sql
```
## Queries and Findings

### 1. Azerbaijan Grand Prix winners by year
[queries/01_winners_baku.sql](queries/01_winners_baku.sql)

*Findings will be added here once the query is run.*

---

*Project in progress — queries are added as they're completed.*
