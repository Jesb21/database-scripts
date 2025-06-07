# Database Scripts - Recomienda App

Este directorio contiene los scripts y recursos relacionados con la base de datos para la aplicación Recomienda App, un sistema de recomendación de lugares cercanos.

## 📋 Contenido

- `recomienda_app.sqbpro`: Proyecto de SQLite Browser con la estructura de la base de datos
- `schema.sql`: Script SQL para crear la estructura de la base de datos
- `seed_data.sql`: Datos de ejemplo para poblar la base de datos

## 🗄️ Esquema de la Base de Datos

### Tabla: users
```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE,
    hashed_password TEXT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Tabla: places
```sql
CREATE TABLE places (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    category TEXT,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    address TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id)
);
```

### Tabla: favorites
```sql
CREATE TABLE favorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    place_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (place_id) REFERENCES places(id),
    UNIQUE(user_id, place_id)
);
```

## 🛠️ Configuración Inicial

### Requisitos previos

- [SQLite Browser](https://sqlitebrowser.org/) (recomendado para gestión visual)
- O cualquier cliente SQLite compatible

### Crear la base de datos

1. Abre SQLite Browser
2. Ve a "Nueva Base de Datos"
3. Navega hasta el directorio del proyecto
4. Guarda la base de datos como `recomienda_app.db`
5. Abre la pestaña "Ejecutar SQL"
6. Copia y pega el contenido de `schema.sql`
7. Ejecuta el script

## 🔄 Migraciones

Para realizar cambios en la estructura de la base de datos:

1. Crea un nuevo script SQL con la siguiente convención de nombre: 
   `migrations/YYYYMMDD_HHMMSS_description.sql`
2. Documenta los cambios en el archivo
3. Proporciona instrucciones para revertir los cambios si es necesario

## 📊 Datos de Ejemplo

El archivo `seed_data.sql` contiene datos de ejemplo que puedes usar para probar la aplicación:

```sql
-- Usuarios de ejemplo
INSERT INTO users (username, email, hashed_password) VALUES 
('usuario1', 'usuario1@example.com', '$2b$12$...'),
('usuario2', 'usuario2@example.com', '$2b$12$...');

-- Lugares de ejemplo
INSERT INTO places (name, description, category, latitude, longitude, address) VALUES
('Café Central', 'Acogedor café en el centro', 'Café', 4.7109, -74.0721, 'Calle 123 #45-67'),
('Parque Principal', 'Gran parque en el centro de la ciudad', 'Parque', 4.7119, -74.0821, 'Carrera 8 #12-34');
```

## 🔒 Seguridad

- Las contraseñas se almacenan con hash usando bcrypt
- Las claves foráneas aseguran la integridad referencial
- Se recomienda realizar copias de seguridad periódicas

## 🛠️ Herramientas Recomendadas

- [DB Browser for SQLite](https://sqlitebrowser.org/): Interfaz gráfica para administrar bases de datos SQLite
- [SQLite CLI](https://www.sqlite.org/cli.html): Herramienta de línea de comandos para SQLite
- [SQLite Viewer](https://inloop.github.io/sqlite-viewer/): Visor en línea de archivos SQLite

## 🤝 Contribución

1. Haz un fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Haz commit de tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Haz push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## ✨ Créditos

- [SQLite](https://www.sqlite.org/)
- [DB Browser for SQLite](https://sqlitebrowser.org/)
- Equipo de desarrollo de Recomienda App
