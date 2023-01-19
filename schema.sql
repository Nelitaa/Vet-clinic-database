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
