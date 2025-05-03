# database-scripts

Este repositorio contiene los archivos relacionados con la base de datos del proyecto principal.  
La rama `database-scripts` incluye scripts de creación de base de datos, inserción de datos y un archivo para restaurar la base de datos en otro equipo.

## 📦 Contenido

- `backup.bak` → Archivo de respaldo de la base de datos (`.bak`) para restaurar en SQL Server.
- `create_and_insert.sql` → Script con todas las consultas de creación de tablas e inserción de datos.
- `restore_database.sql` → Script que permite restaurar la base de datos en otro equipo usando el archivo `.bak`.

## ⚙️ Requisitos previos

- Tener instalado **SQL Server Management Studio (SSMS)**.
- Contar con permisos suficientes para crear/restaurar bases de datos.
- Copiar los archivos del repositorio al equipo donde se va a instalar la base de datos.

by: Willian Andres Cervantes Cermeño
