-- Creating external stage
CREATE OR REPLACE CUSTOMER_DB.SCD2.customer_ext_stage
    url='s3://dw-snowflake-db-fariane/stream_data/'
    credentials=(aws_key_id='' aws_secret_key='');
   

CREATE OR REPLACE FILE FORMAT CUSTOMER_DB.SCD2.CSV
TYPE = CSV,
FIELD_DELIMITER = ","
SKIP_HEADER = 1;

SHOW STAGES;
LIST @customer_ext_stage;


CREATE OR REPLACE PIPE customer_s3_pipe
  auto_ingest = true
  AS
  COPY INTO customer_raw
  FROM @customer_ext_stage
  FILE_FORMAT = CSV
  ;


show pipes;

select SYSTEM$PIPE_STATUS('customer_s3_pipe');

SELECT count(*) FROM customer_raw limit 10;

TRUNCATE  customer_raw;