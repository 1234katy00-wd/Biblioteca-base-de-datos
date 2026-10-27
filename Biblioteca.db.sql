Use biblioteca; 

CREATE TABLE libros(
	id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45) NOT NULL,
    editorial VARCHAR(45) NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE ejemplares(
	id_ejemplar INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(45) NOT NULL,
    cantidad INT NOT NULL,
    id_libro INT NOT NULL,
    FOREIGN KEY(id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE editorial(
	id_editorial INT AUTO_INCREMENT PRIMARY KEY,
    nombre_editorial VARCHAR(45) NOT NULL,
    fecha_emision DATE NOT NULL,
    id_libro INT NOT NULL,
     FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL
);

CREATE TABLE prestamos(
	id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    id_ejemplar INT NOT NULL,
    id_cliente INT NOT NULL,
	FOREIGN KEY (id_ejemplar) REFERENCES ejemplares(id_ejemplar),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE autores(
	id_autor INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL
);

CREATE TABLE autores_has_libros (
    autores_id_autor INT NOT NULL,
    libros_id_libro INT NOT NULL,
    PRIMARY KEY (autores_id_autor, libros_id_libro),
    FOREIGN KEY (autores_id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (libros_id_libro) REFERENCES libros(id_libro)    
);

INSERT INTO libros (titulo, editorial, fecha_creacion) 
VALUES ('El principito', 'Reynal & Hitchcock', '1943-04-06'),
	   ('Drácula', 'Archibald Constable & Co.', '1897-05-26'),
       ('El Hobbit', 'George Allen & Unwin', '1937-09-21'),
       ('Cien años de soledad', 'Editorial Sudamericana', '1967-05-30');
SELECT * FROM libros;

INSERT INTO autores (nombre, apellido) 
VALUES ('Antoine', 'de Saint-Exupéry'),
	   ('Bram', 'Stoker'),
       ('J.R.R.', 'Tolkien'),
       ('Gabriel', 'García Márquez'); 
SELECT * FROM autores;

-- Tabla intermedia 
INSERT INTO autores_has_libros (autores_id_autor, libros_id_libro) 
VALUES (1, 1),
	   (2, 2),
       (3, 3),
       (4, 4);
SELECT * FROM autores_has_libros;
  
INSERT INTO clientes (nombre, apellido, direccion, telefono) 
VALUES ('Carlos', 'Mendoza', 'Av. Libertad 123', '+56912345678'),
	   ('María José', 'Fuentes', 'Calle Los Aromos 456', '+56987654321'),
       ('Juan Pablo', 'Silva', 'Pasaje El Roble 789', '+56955554433'),
       ('Francisca', 'Oyarzún', 'Av. Providencia 1020', '+56922334455'),
       ('Diego', 'Alarcón', 'Condominio Las Brisas Dep. 42', '+56999887766');
SELECT * FROM clientes;

INSERT INTO editorial (nombre_editorial, fecha_emision, id_libro) 
VALUES ('Reynal & Hitchcock', '1943-04-06', 1), 
       ('Archibald Constable & Co.', '1897-05-26', 2),
       ('George Allen & Unwin', '1937-09-21', 3), 
       ('Editorial Sudamericana', '1967-05-30', 4);
SELECT * FROM editorial;
       
INSERT INTO ejemplares(estado, cantidad, id_libro) 
VALUES ('Nuevo', 5, 1),       
       ('Buen estado', 3, 2),
       ('Desgastado', 2, 3),  
       ('Excelente', 4, 4);
SELECT * FROM ejemplares;

INSERT INTO prestamos(fecha_prestamo, fecha_devolucion, id_ejemplar, id_cliente) 
VALUES ('2026-10-01', '2026-10-15', 1, 1), 
       ('2026-10-05', '2026-10-19', 2, 2), 
       ('2026-10-10', '2026-10-24', 3, 3), 
       ('2026-10-12', '2026-10-26', 4, 4), 
       ('2026-10-15', '2026-10-29', 1, 5); 
SELECT * FROM Prestamos;

