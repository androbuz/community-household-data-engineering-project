# community-household-data-engineering-project

## Data Ingestion
B2 bucket named `rtv-lakehouse-raw` with folder structure:
- raw/unps/
- raw/faostat/
- raw/chirps/
- incoming/field_events/
- archive/

## Bronze schema strategy
For each source, I create one Bronze Delta tables (in `notebooks/01_bronze_ingestion.ipynb`), except the unps which has two tables:

- bronze_unps_1 saved at 'community_lakehouse.bronze.unps_1'
- bronze_unps_2a saved at 'community_lakehouse.bronze.unps_2q'
- bronze_faostat saved at 'community_lakehouse.bronze.faostat'
- bronze_chirps saved at 'community_lakehouse.bronze.chirps'

And Each Bronze table has ingestion metadata:
- _ingested_at (timestamp)
- _source_file (string)
- _source_system (string)

## Silver schema strategy
### UNPS (Uganda National Panel Survey)
The silver layer for UNPS is built in `02_silver_unps` notebook. It reads from `community_lakehouse.bronze.unps1` and performs type casting, data-quality validation, and row-level quarantine.

- Type casting: Five Yes/No columns (`hh_crp2`, `hh_crp1`, `hh_anm`, `hh_plty`, `urban`) are cast from double/long to integer.
- Validity check: Each casted column must contain only `0` or `1`. Rows meeting all five conditions are marked valid; the rest are quarantined.
- Quarantine: Invalid rows are written to `community_lakehouse.silver.unps1_quarantine` for manual review.
- Clean table: Valid rows are written to `community_lakehouse.silver.unps1`.
- Metadata: Both tables carry forward Bronze ingestion metadata (`_ingested_at`, `_source_file`, `_source_system`) and gain a new `_processed_at` timestamp.
- Duplicate check: A query groups by `t0_hhid` to detect duplicate household IDs in the silver table; no duplicates were found.
