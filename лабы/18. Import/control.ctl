LOAD DATA 
INFILE 'C:\Users\Administrator\Documents\import_data.txt'
DISCARDFILE 'C:\Users\Administrator\Documents\import_data.dis'
INTO TABLE LB18
FIELDS TERMINATED BY ","
(
id "round(:id, 2)",
text "upper(:text)",
date_value date "DD.MM.YYYY"
)