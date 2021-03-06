/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
select * from animals where name like '%mon';

-- List the name of all animals born between 2016 and 2019.
select name from animals where EXTRACT(YEAR FROM date_of_birth) between 2016 and 2019;

-- List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals where neutered and escape_attempts < 3;

-- List date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals where name in ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
select name, escape_attempts from animals where weight_kg > 10.5;

-- Find all animals that are neutered.
select * from animals where neutered;

-- Find all animals not named Gabumon.
select * from animals where name not in ('Gabumon');

-- Find all animals with a weight between 10.4kg and 17.3kg 
-- (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

-- Find number of animals
select count(*) from animals;

-- Find number of animals that have never tried to escape
select count(*) from animals where escape_attempts = 0;

-- Find the average weight of animals
select avg(weight_kg) from animals;

-- Find the most escaped_attempts if it was neutered of not in animals
select neutered from animals where escape_attempts in 
(select max(escape_attempts) from animals);

-- Find the min and max weight of every species in animals
select species, max(weight_kg), min(weight_kg) from animals group by species;

-- Find the average escape attempts for every species that was born between 1990 and 2000
select species, avg(escape_attempts) from animals where extract(year from date_of_birth) 
between 1990 and 2000 group by species;

-- List What animals belong to Melody Pond?
select A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, O.full_name as owner
from animals A join owners O on A.owner_id = O.id where O.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
select A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, S.name as species
from animals A join species S on A.species_id = S.id where S.name = 'Pokemon';

-- List all owners and their animals, include those that don't own any animal.
select O.full_name as owner_name, O.age as owner_age, A.name as animal_name
from owners O left join animals A on O.id = A.owner_id;

-- List How many animals are there per species?
select count(*), S.name as species_name
from animals A join species S on A.species_id = S.id
group by S.name;

-- List all Digimon owned by Jennifer Orwell.
select A.name as animal_name, S.name as species_name, O.full_name as owner_name
from animals A join species S on A.species_id = S.id join owners O on A.owner_id = O.id
where S.name = 'Digimon' and O.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
select A.name as animal_name, A.escape_attempts, O.full_name as owner_name
from animals A join owners O on A.owner_id = O.id
where A.escape_attempts = 0 and O.full_name = 'Dean Winchester';

-- Find Who owns the most animals?
select count(*) as number_of_animals, O.full_name as owner_name
from animals A join owners O on A.owner_id = O.id
group by O.full_name
order by count(*) desc
LIMIT 1;

-- Find who was the last animal seen by William Tatcher?
select A.id, A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg 
from animals A join visits V on A.id = V.animals_id
where V.vets_id = (select id from vets where name = 'William Tatcher')
order by date_of_visits desc
limit 1;

-- List how many different animals did Stephanie Mendez see?
select count(distinct A.id) as number_of_animals
from animals A join visits V on A.id = V.animals_id
where V.vets_id = (select id from vets where name = 'Stephanie Mendez');

-- List all vets and their specialties, including vets with no specialties.
select V.id, V.name, V.age, V.date_of_graduation, s.name as specialization
from vets V left join specializations SP on V.id = SP.vets_id 
left join species S on SP.species_id = S.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select A.id, A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg 
from animals A join visits V on A.id = V.animals_id
where V.vets_id = (select id from vets where name = 'Stephanie Mendez') 
and V.date_of_visits between '2020-4-1' and '2020-8-30';

-- Find What animal has the most visits to vets?
select A.id, A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, count(*) as visits_number
from animals A join visits V on A.id = V.animals_id
group by A.id
order by count(*) desc
limit 1;

-- Find Who was Maisy Smith's first visit?
select A.id, A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg 
from animals A join visits V on A.id = V.animals_id
where V.vets_id = (select id from vets where name = 'Maisy Smith')
order by date_of_visits
limit 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
select A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, 
V.name, V.age, V.date_of_graduation, VI.date_of_visits 
from animals A join visits VI on A.id = VI.animals_id 
join vets V on VI.vets_id = V.id
order by VI.date_of_visits desc
limit 1;

-- How many visits were with a vet that did not specialize in that animal's species?
select count(*), V.name
from vets V left join visits VI on V.id = VI.vets_id
left join animals A on A.id = VI.animals_id
left join specializations SP on V.id = SP.vets_id
where A.species_id != SP.species_id or SP.species_id is NULL
group by V.name;

-- Find What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select S.name
from vets V join visits VI on V.id = VI.vets_id
join animals A on A.id = VI.animals_id
join species S on S.id = A.species_id
where V.name = 'Maisy Smith'
group by S.name
order by count(*) desc
limit 1;