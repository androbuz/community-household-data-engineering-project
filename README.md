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
