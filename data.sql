/* Populate database with sample data. */

-- Insert Animal: His name is Agumon. He was born on Feb 3rd, 2020, 
-- and currently weighs 10.23kg. He was neutered and he has never tried to escape.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(1, 'Agumon', '2020-2-3', 0, true, 10.23);


-- Insert Animal: Her name is Gabumon. She was born on Nov 15th, 2018, 
-- and currently weighs 8kg. She is neutered and she has tried to escape 2 times.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(2, 'Gabumon', '2018-11-15', 2, true, 8);


-- Insert Animal: His name is Pikachu. He was born on Jan 7th, 2021, 
-- and currently weighs 15.04kg. He was not neutered and he has tried to escape once.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(3, 'Pikachu', '2021-1-7', 1, false, 15.04);


-- Insert Animal: Her name is Devimon. She was born on May 12th, 2017, 
-- and currently weighs 11kg. She is neutered and she has tried to escape 5 times.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(4, 'Devimon', '2017-5-12', 5, true, 11);


-- Insert Animal: His name is Charmander. He was born on Feb 8th, 2020, 
-- and currently weighs -11kg. He is not neutered and he has never tried to escape.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(5, 'Charmander', '2020-2-8', 0, false, -11);


-- Insert Animal: Her name is Plantmon. She was born on Nov 15th, 2022, 
-- and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(6, 'Plantmon', '2022-11-15', 2, true, -5.7);


-- Insert Animal: His name is Squirtle. He was born on Apr 2nd, 1993, 
-- and currently weighs -12.13kg. He was not neutered and he has tried to 3 times.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(7, 'Squirtle', '1993-4-2', 3, false, -12.13);


-- Insert Animal: His name is Angemon. He was born on Jun 12th, 2005, 
-- and currently weighs -45kg. He is neutered and he has tried to escape once.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(8, 'Angemon', '2005-6-12', 1, true, -45);


-- Insert Animal: His name is Boarmon. He was born on Jun 7th, 2005, 
-- and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(9, 'Boarmon', '2005-6-7', 7, true, 20.4);


-- Insert Animal: Her name is Blossom. She was born on Oct 13th, 1998, 
-- and currently weighs 17kg. She is neutered and she has tried to escape 3 times.

INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
(10, 'Blossom', '1998-10-13', 3, true, 17);


-- Insert owner: Sam Smith 34 years old.

Insert into owners (full_name, age) values ('Sam Smith', 34);


-- Insert owner: Jennifer Orwell 19 years old.

Insert into owners (full_name, age) values ('Jennifer Orwell', 19);


-- Insert owner: Bob 45 years old.

Insert into owners (full_name, age) values ('Bob', 45);


-- Insert owner: Melody Pond 77 years old.

Insert into owners (full_name, age) values ('Melody Pond', 77);


-- Insert owner: Dean Winchester 14 years old.

Insert into owners (full_name, age) values ('Dean Winchester', 14);


-- Insert owner: Jodie Whittaker 38 years old.

Insert into owners (full_name, age) values ('Jodie Whittaker', 38);


-- Insert specie: Pokemon.

Insert into species (name) values ('Pokemon');


-- Insert specie: Digimon.

Insert into species (name) values ('Digimon');


-- Modify inserted animals so it includes the species_id value:
-- -- If the name ends in "mon" it will be Digimon.

update animals set species_id = (select id from species where name = 'Digimon') 
where name like '%mon';

-- -- All other animals are Pokemon

update animals set species_id = (select id from species where name = 'Pokemon') 
where species_id is null;

-- Modify inserted animals to include owner information (owner_id):
-- -- Sam Smith owns Agumon.

update animals set owner_id = (select id from owners where full_name = 'Sam Smith') 
where name = 'Agumon';

-- -- Jennifer Orwell owns Gabumon and Pikachu.

update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell') 
where name in ('Gabumon', 'Pikachu');

-- -- Bob owns Devimon and Plantmon.

update animals set owner_id = (select id from owners where full_name = 'Bob') 
where name in ('Devimon', 'Plantmon');

-- -- Melody Pond owns Charmander, Squirtle, and Blossom.

update animals set owner_id = (select id from owners where full_name = 'Melody Pond') 
where name in ('Charmander', 'Squirtle', 'Blossom');

-- -- Dean Winchester owns Angemon and Boarmon.

update animals set owner_id = (select id from owners where full_name = 'Dean Winchester') 
where name in ('Angemon', 'Boarmon');


-- Insert the following data for vets:
-- -- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
-- -- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
-- -- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
-- -- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.

insert into vets (name, age, date_of_graduation) values 
('William Tatcher', 45, '2000-4-23'),
('Maisy Smith', 26, '2013-1-17'),
('Stephanie Mendez', 64, '1981-5-4'),
('Jack Harkness', 38, '2008-6-8');


-- Insert the following data for specializations:
-- -- Vet William Tatcher is specialized in Pokemon.
-- -- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
-- -- Vet Jack Harkness is specialized in Digimon.

insert into specializations (species_id, vets_id) values 
((select id from species where name = 'Pokemon'), (select id from vets where name = 'William Tatcher')),
((select id from species where name = 'Digimon'), (select id from vets where name = 'Stephanie Mendez')),
((select id from species where name = 'Pokemon'), (select id from vets where name = 'Stephanie Mendez')),
((select id from species where name = 'Digimon'), (select id from vets where name = 'Jack Harkness'));


-- Insert the following data for visits:
-- -- Agumon visited William Tatcher on May 24th, 2020.
-- -- Agumon visited Stephanie Mendez on Jul 22th, 2020.
-- -- Gabumon visited Jack Harkness on Feb 2nd, 2021.
-- -- Pikachu visited Maisy Smith on Jan 5th, 2020.
-- -- Pikachu visited Maisy Smith on Mar 8th, 2020.
-- -- Pikachu visited Maisy Smith on May 14th, 2020.
-- -- Devimon visited Stephanie Mendez on May 4th, 2021.
-- -- Charmander visited Jack Harkness on Feb 24th, 2021.
-- -- Plantmon visited Maisy Smith on Dec 21st, 2019.
-- -- Plantmon visited William Tatcher on Aug 10th, 2020.
-- -- Plantmon visited Maisy Smith on Apr 7th, 2021.
-- -- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
-- -- Angemon visited Jack Harkness on Oct 3rd, 2020.
-- -- Angemon visited Jack Harkness on Nov 4th, 2020.
-- -- Boarmon visited Maisy Smith on Jan 24th, 2019.
-- -- Boarmon visited Maisy Smith on May 15th, 2019.
-- -- Boarmon visited Maisy Smith on Feb 27th, 2020.
-- -- Boarmon visited Maisy Smith on Aug 3rd, 2020.
-- -- Blossom visited Stephanie Mendez on May 24th, 2020.
-- -- Blossom visited William Tatcher on Jan 11th, 2021.

insert into visits (animals_id, vets_id, date_of_visit) values 
((select id from animals where name = 'Agumon'), (select id from vets where name = 'William Tatcher'), '2020-5-24'),
((select id from animals where name = 'Agumon'), (select id from vets where name = 'Stephanie Mendez'), '2020-7-22'),
((select id from animals where name = 'Gabumon'), (select id from vets where name = 'Jack Harkness'), '2021-2-2'),
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-1-5'),
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-3-8'),
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-3-14'),
((select id from animals where name = 'Devimon'), (select id from vets where name = 'Stephanie Mendez'), '2021-3-4'),
((select id from animals where name = 'Charmander'), (select id from vets where name = 'Jack Harkness'), '2021-2-24'),
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'Maisy Smith'), '2019-12-21'),
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'William Tatcher'), '2020-8-10'),
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'Maisy Smith'), '2021-4-7'),
((select id from animals where name = 'Squirtle'), (select id from vets where name = 'Stephanie Mendez'), '2019-9-29'),
((select id from animals where name = 'Angemon'), (select id from vets where name = 'Jack Harkness'), '2020-10-3'),
((select id from animals where name = 'Angemon'), (select id from vets where name = 'Jack Harkness'), '2020-11-4'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2019-1-24'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2019-5-15'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2020-2-27'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2020-8-3'),
((select id from animals where name = 'Blossom'), (select id from vets where name = 'Stephanie Mendez'), '2020-8-24'),
((select id from animals where name = 'Blossom'), (select id from vets where name = 'William Tatcher'), '2021-1-11');