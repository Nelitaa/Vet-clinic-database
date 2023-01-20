/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              integer GENERATED ALWAYS AS IDENTITY,
    name            varchar(40) not null,
    date_of_birth   date not null,
    escape_attempts integer not null,
    neutered        boolean not null,
    weight_kg       decimal not null,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD species varchar(40);

CREATE TABLE owners (
    id              integer GENERATED ALWAYS AS IDENTITY,
    full_name       VARCHAR(40),
    age             integer,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id              integer GENERATED ALWAYS AS IDENTITY,
    name            VARCHAR(40),
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id integer;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id integer;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);
