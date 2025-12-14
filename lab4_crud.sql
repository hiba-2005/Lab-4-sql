USE bibliotheque;
INSERT INTO auteur (nom)
VALUES 
  ('Victor Hugo'),
  ('George Orwell'),
  ('Jane Austen');
  SELECT id, nom FROM auteur WHERE nom='Victor Hugo';
  INSERT INTO ouvrage (titre, disponible, auteur_id)
VALUES 
  ('Les Misérables', TRUE, 1),
  ('1984', FALSE, 2),
  ('Pride and Prejudice', TRUE, 3);
  INSERT INTO abonne (nom, email)
VALUES 
  ('Karim', 'karim@mail.com'),
  ('Lucie', 'lucie@mail.com');
  INSERT INTO emprunt (ouvrage_id, abonne_id, date_debut)
VALUES (2, 1, '2025-06-18');
UPDATE ouvrage
SET disponible = FALSE
WHERE titre = 'Les Misérables';
SELECT * FROM abonne;
UPDATE ouvrage
SET disponible = FALSE
WHERE id = 1;
SELECT id, titre, disponible
FROM ouvrage
WHERE id = 1;
SELECT id, nom, email
FROM abonne
WHERE nom = 'Karim';
UPDATE abonne
SET email = 'karim.new@mail.com'
WHERE nom = 'Karim';
SELECT id, nom, email
FROM abonne
WHERE nom = 'Karim';
UPDATE emprunt
SET date_fin = CURDATE()
WHERE id = 1;
SELECT *
FROM emprunt
WHERE ouvrage_id = 2
  AND abonne_id = 1
  AND date_fin IS NULL;
  UPDATE emprunt
SET date_fin = CURDATE()
WHERE id = 1;
SELECT * FROM auteur
WHERE nom = 'George Orwell';

SELECT o.*
FROM ouvrage o
JOIN auteur a ON o.auteur_id = a.id
WHERE a.nom = 'George Orwell';

DELETE FROM auteur
WHERE nom = 'George Orwell';

DELETE FROM ouvrage
WHERE id = 2;

DELETE FROM abonne
WHERE nom = 'Lucie';

START TRANSACTION;

INSERT INTO abonne (nom, email) VALUES ('Samir', 'samir@mail.com');
INSERT INTO emprunt (ouvrage_id, abonne_id, date_debut) VALUES (3, LAST_INSERT_ID(), '2025-06-19');
COMMIT;
ROLLBACK;
SELECT * 
FROM abonne
WHERE nom = 'Samir';
SELECT *
FROM emprunt
WHERE abonne_id = (
  SELECT id FROM abonne WHERE nom = 'Samir'
);
