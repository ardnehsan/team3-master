sql_query = <<-SQLQUERY
DROP TABLE IF EXISTS fandango;

CREATE TABLE fandango (
  id      BIGSERIAL PRIMARY KEY,
  films   VARCHAR(255)  NOT NULL,
  stars   DECIMAL(2,1)  NOT NULL,
  rating  DECIMAL(2,1)  NOT NULL,
  votes   INT        NOT NULL
);

COPY fandango ("films", "stars", "rating", "votes")
  FROM '#{Rails.root}/fandango.csv'
  DELIMITER ','
  CSV HEADER;

SQLQUERY


ActiveRecord::Base.connection.execute(sql_query)

sql_query = "select * from fandango"

records = ActiveRecord::Base.connection.execute(sql_query)

puts "Created #{records.count} records"
