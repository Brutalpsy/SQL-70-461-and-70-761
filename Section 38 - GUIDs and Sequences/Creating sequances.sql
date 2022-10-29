BEGIN TRANSACTION
CREATE SEQUENCE newSeq AS INT
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
CYCLE -- once it reaches the max, it will go back to min value and start again
CREATE SEQUENCE secondSeq AS INT -- can go without all those optional things
SELECT * FROM sys.sequences
ROLLBACK TRANSACTION