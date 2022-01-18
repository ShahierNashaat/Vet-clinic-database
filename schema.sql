/* Database schema to keep the structure of entire database. */

create database vet;

-- Create a table named animals
create table animals (
	id integer,
	name varchar(200),
	date_of_birth date,
	escape_attempts integer,
	neutered boolean,
	weight_kg decimal
);

-- Add a column species of type string to your animals table.
alter table animals add species varchar(200);

-- Create a table named owners
create table owners (
	id integer generated always as identity primary key,
	full_name varchar(200),
	age integer
);

-- Create a table named species
create table species (
	id integer generated always as identity primary key,
	name varchar(200)
);

-- Modify animals table
-- -- Make sure that id is set as autoincremented PRIMARY KEY
alter table animals drop column id;
alter table animals add column id integer generated always as identity primary key;

-- -- Remove column species
alter table animals drop column species;

-- -- Add column species_id which is a foreign key referencing species table
alter table animals add column species_id integer;
alter table animals add constraint fk_species foreign key(species_id) references species(id);

-- -- Add column owner_id which is a foreign key referencing the owners table
alter table animals add column owner_id integer;
alter table animals add constraint fk_owners foreign key(owner_id) references owners(id);

-- Create a table named vets
create table vets (
	id integer generated always as identity primary key,
	name varchar(200),
	age integer,
	date_of_graduation date
);

-- Create a "join table" called specializations to handle this relationship 
-- between the tables species and vets.
create table specializations (
	species_id integer,
	vets_id integer,
	constraint fk_species foreign key(species_id) references species(id),
	constraint fk_vets foreign key(vets_id) references vets(id),
	primary key(species_id, vets_id)
);

-- Create a "join table" called visits to handle this relationship
-- between the tables animals and vets.
create table visits (
	animals_id integer,
	vets_id integer,
	date_of_visit date,
	constraint fk_animals foreign key(animals_id) references animals(id),
	constraint fk_vets foreign key(vets_id) references vets(id),
	primary key(animals_id, vets_id, date_of_visit)
);