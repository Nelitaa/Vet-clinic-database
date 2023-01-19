/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES  ('Agumon', '2020-02-03', 0, true, 10.23),
        ('Gabumon', '2018-11-15', 2, true, 8.0),
        ('Pikachu', '2021-01-07', 1, false, 15.04),
        ('Devimon', '2017-05-12', 5, true, 11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES  ('Charmander', '2020-02-08', 0, false, -11.0),
        ('Plantmon', '2021-11-15', 2, true, -5.7),
        ('Squirtle', '1993-04-02', 3 , false, -12.13),
        ('Angemon', '2005-06-12', 1, true, -45.0),
        ('Boarmon', '2005-06-07', 7, true, 20.4),
        ('Blossom', '1998-10-13', 3, true, 17.0),
        ('Ditto', '2022-05-14', 4, true, 22.0);

INSERT INTO owners (full_name, age) 
VALUES  ('Sam Smith', 34),
        ('Jennifer Orwell', 19),
        ('Bob', 45),
        ('Melody Pond', 77),
        ('Dean Winchester', 14),
        ('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES  ('Pokemon'),
        ('Digimon');

/*TRANSACTION 5: Modify your inserted animals so it includes the species_id value:
-If the name ends in "mon" it will be Digimon 
-All other animals are Pokemon*/
BEGIN;
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon%';
SELECT * FROM animals;
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/*TRANSACTION 5: Modify your inserted animals to include owner information (owner_id):
Sam Smith owns Agumon.
Jennifer Orwell owns Gabumon and Pikachu.
Bob owns Devimon and Plantmon.
Melody Pond owns Charmander, Squirtle, and Blossom.
Dean Winchester owns Angemon and Boarmon.*/
BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
