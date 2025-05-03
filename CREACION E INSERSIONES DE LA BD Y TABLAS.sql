CREATE DATABASE BD_E_DISCIPLINAR;

-- Tabla: users
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(100) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL
);

-- Tabla: places
CREATE TABLE places (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(200) NOT NULL,
    category NVARCHAR(100) NOT NULL,
    rating FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    address NVARCHAR(300),
    created_at DATETIME DEFAULT GETDATE()
);

-- Tabla: user_places (relación muchos a muchos)
CREATE TABLE user_places (
    user_id INT NOT NULL,
    place_id INT NOT NULL,
    PRIMARY KEY (user_id, place_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (place_id) REFERENCES places(id) ON DELETE CASCADE
);

select * from places
select * from users
select * from user_places

INSERT INTO users (username, password_hash)
VALUES 
('juanperez', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441'),
('mariagomez', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8'),
('carlosruiz', '2aae6c35c94fcfb415dbe95f408b9ce91ee846ed'),
('laura_123', '12dea96fec20593566ab75692c9949596833adc9'),
('admin', '21232f297a57a5a743894a0e4a801fc3');

INSERT INTO places (name, category, rating, latitude, longitude, address)
VALUES
('Parque Central', 'parque', 4.5, 19.4326, -99.1332, 'Av. Juárez s/n, Centro Histórico, CDMX'),
('La Buena Mesa', 'restaurante', 4.7, 19.427, -99.1635, 'Calle Reforma 123, Roma Norte, CDMX'),
('Tienda El Ahorro', 'tienda', 4.1, 19.421, -99.145, 'Av. Insurgentes Sur 456, Del Valle, CDMX'),
('Café del Lago', 'restaurante', 4.8, 19.4212, -99.1953, 'Bosque de Chapultepec 1a Secc, CDMX'),
('Librería Solaris', 'tienda', 4.3, 19.4372, -99.1411, 'Calle Donceles 89, Centro Histórico, CDMX'),
('Jardín Botánico', 'parque', 4.9, 19.4200, -99.1900, 'Bosque de Chapultepec, CDMX');


INSERT INTO user_places (user_id, place_id)
VALUES
(1, 2),  -- Juan Pérez ha visitado "La Buena Mesa"
(1, 4),  -- Juan Pérez ha visitado "Café del Lago"
(2, 1),  -- María Gómez ha visitado "Parque Central"
(2, 3),  -- María Gómez ha visitado "Tienda El Ahorro"
(3, 2),  -- Carlos Ruiz ha visitado "La Buena Mesa"
(3, 5),  -- Carlos Ruiz ha visitado "Librería Solaris"
(4, 6),  -- Laura ha visitado "Jardín Botánico"
(5, 1),  -- Admin ha visitado "Parque Central"
(5, 4);  -- Admin ha visitado "Café del Lago"

SELECT u.username, p.name AS place_name, p.category
FROM users u
JOIN user_places up ON u.id = up.user_id
JOIN places p ON up.place_id = p.id
WHERE u.username = 'juanperez';