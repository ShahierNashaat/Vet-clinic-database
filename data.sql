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
