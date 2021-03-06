-- update the animals table by setting the species column to unspecified.
-- Then roll back the change.

BEGIN;
update animals set species = 'unspecified';
select * from animals;
ROLLBACK;
select * from animals;


-- Update the animals table by setting the species column to digimon for all animals 
-- that have a name ending in mon.
-- Update the animals table by setting the species column to pokemon for all animals 
-- that don't have species already set.

BEGIN;
update animals set species = 'digimon' where name like '%mon';
select * from animals;
update animals set species = 'pokemon' where species is NULL;
select * from animals;
COMMIT;
select * from animals;


-- delete all records in the animals table, then roll back the transaction.

BEGIN;
delete from animals;
select * from animals;
ROLLBACK;
select * from animals;

-- Delete all animals born after Jan 1st, 2022.
-- Create a savepoint for the transaction.
-- Update all animals' weight to be their weight multiplied by -1.
-- Rollback to the savepoint
-- Update all animals' weights that are negative to be their weight multiplied by -1.

BEGIN;
delete from animals where date_of_birth > '2022-1-1';
select * from animals;
SAVEPOINT delete_by_date;
update animals set weight_kg = weight_kg * -1;
select * from animals;
ROLLBACK TO delete_by_date;
select * from animals;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
select * from animals;
COMMIT;
select * from animals;