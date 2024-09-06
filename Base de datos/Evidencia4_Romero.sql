CREATE TABLE CamaraFotografica (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    memoria_capacidad INT NOT NULL,
    bateria INT NOT NULL CHECK (bateria BETWEEN 0 AND 100),
    fotos INT NOT NULL DEFAULT 0,
    zoom INT NOT NULL CHECK (zoom BETWEEN 1 AND 10)
);

INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Canon', 500, 100, 10, 5);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Nikon', 400, 50, 25, 3);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Sony', 800, 80, 30, 7);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Fujifilm', 600, 90, 12, 4);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Panasonic', 1000, 100, 5, 6);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Olympus', 700, 70, 40, 8);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Kodak', 300, 30, 50, 2);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Leica', 450, 20, 60, 1);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('Pentax', 350, 100, 20, 9);
INSERT INTO CamaraFotografica (marca, memoria_capacidad, bateria, fotos, zoom)
VALUES ('GoPro', 250, 10, 70, 5);

SELECT * FROM CamaraFotografica;
SELECT * FROM CamaraFotografica WHERE bateria < 50;
SELECT * FROM CamaraFotografica WHERE marca = 'Sony';
SELECT * FROM CamaraFotografica WHERE memoria_capacidad > 20;
SELECT * FROM CamaraFotografica ORDER BY bateria DESC;

CREATE TABLE Foto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camara_id INT NOT NULL,
    tamano_mb DECIMAL(5,2) NOT NULL,
    resolucion VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (camara_id) REFERENCES CamaraFotografica(id)
);

INSERT INTO Foto (camara_id, tamano_mb, resolucion, fecha) 
VALUES (1, 2.1, '1280x720', '2023-08-03');
INSERT INTO Foto (camara_id, tamano_mb, resolucion, fecha) 
VALUES (3, 1.8, '1920x1080', '2023-08-07');
INSERT INTO Foto (camara_id, tamano_mb, resolucion, fecha) 
VALUES (3, 2.5, '1280x720', '2023-08-08');

SELECT * FROM Foto;
SELECT * FROM Foto where camara_id = 3;

SELECT CamaraFotografica.marca, Foto.tamano_mb, Foto.resolucion, Foto.fecha
FROM Foto JOIN CamaraFotografica ON Foto.camara_id = CamaraFotografica.id;