/* Database schema to keep the structure of entire database. */

create database vet

-- Create a table named animals
create table animals (
	id integer,
	name varchar(200),
	date_of_birth date,
	escape_attempts integer,
	neutered boolean,
	weight_kg decimal
)
