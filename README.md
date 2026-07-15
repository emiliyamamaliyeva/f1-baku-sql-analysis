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
├── schema.sql              -- creates all tables
├── data/                   -- raw CSV files from Kaggle
└── queries/                -- analytical SQL queries
    ├── 01_winners_baku.sql
    ├── 02_constructors_points_baku.sql
    ├── 03_grid_vs_finish_baku.sql
    └── 04_podiums_baku.sql
```

## Queries and Findings

### 1. Azerbaijan Grand Prix winners by year
[queries/01_winners_baku.sql](queries/01_winners_baku.sql)

| Year | Winner |
|------|--------|
| 2017 | Daniel Ricciardo |
| 2018 | Lewis Hamilton |
| 2019 | Valtteri Bottas |
| 2021 | Sergio Pérez |
| 2022 | Max Verstappen |
| 2023 | Sergio Pérez |
| 2024 | Oscar Piastri |
| 2025 | Max Verstappen |

**Finding:** No driver has won at Baku twice in a row — 8 different winners across 8 races, making it one of the least predictable circuits on the calendar. (Note: 2016 is excluded since the race was branded the "European Grand Prix" that year, and 2020 was cancelled due to COVID-19.)

### 2. Total constructor points at the Azerbaijan Grand Prix
[queries/02_constructors_points_baku.sql](queries/02_constructors_points_baku.sql)

| Constructor | Total Points |
|-------------|--------------|
| Red Bull | 192 |
| Mercedes | 183 |
| Ferrari | 133 |

**Finding:** Red Bull leads the all-time constructor points table at Baku, narrowly ahead of Mercedes — despite Mercedes having more individual race wins in the circuit's early years (2017–2018).

### 3. Grid vs finishing position at the Azerbaijan Grand Prix
[queries/03_grid_vs_finish_baku.sql](queries/03_grid_vs_finish_baku.sql)

| Driver | Year | Grid | Finish | Positions Gained |
|--------|------|------|--------|-------------------|
| Lando Norris | 2024 | 15 | 4 | +11 |
| Fernando Alonso | 2017 | 19 | 9 | +10 |
| Daniel Ricciardo | 2017 | 10 | 1 | +9 |

| Driver | Year | Grid | Finish | Positions Lost |
|--------|------|------|--------|-----------------|
| Charles Leclerc | 2022 | 1 | 19 | -18 |
| Robert Kubica | 2019 | 0 | 16 | -16 |
| Pierre Gasly | 2019 | 0 | 17 | -17 |

**Finding:** Baku produces some of the largest position swings on the calendar in both directions — a mix of big passing opportunities on the long main straight and a high crash/safety-car rate on its narrow street-circuit walls. Charles Leclerc's 2022 race stands out: he started on pole and finished 19th after a power unit failure.

### 4. Podium finishes per driver at the Azerbaijan Grand Prix
[queries/04_podiums_baku.sql](queries/04_podiums_baku.sql)

| Driver | Podiums |
|--------|---------|
| Sergio Pérez | 4 |
| George Russell | 3 |
| Max Verstappen | 3 |
| Valtteri Bottas | 2 |
| Charles Leclerc | 2 |
| Lewis Hamilton | 2 |
| Sebastian Vettel | 2 |

**Finding:** Sergio Pérez has the most podiums of any driver at Baku (4), well ahead of the field — earning him a reputation among fans as one of the strongest performers on this specific street circuit.

