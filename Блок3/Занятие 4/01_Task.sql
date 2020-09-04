USE Chep_LabstudyNew

CREATE TABLE Documents
(
    Id INT IDENTITY PRIMARY KEY,
	dcamt float NULL,
	dsamt float NULL,
	ddate datetime NOT NULL,
	onum float NOT NULL
);

ALTER TABLE Documents ADD dnum integer not null;
