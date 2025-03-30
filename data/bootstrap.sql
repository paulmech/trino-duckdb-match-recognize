CREATE OR REPLACE TABLE fuelwatch AS
    SELECT * FROM read_csv(getenv('DOWNLOAD_PATH') || '/FuelWatchRetail*.csv');
