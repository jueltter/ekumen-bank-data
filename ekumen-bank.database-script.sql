-- Drop the database if it already exists
DROP DATABASE IF EXISTS "ekumen-bank" WITH (FORCE);

-- Create the new database
CREATE DATABASE "ekumen-bank"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Connect to the newly created database using pgAdmin or a psql-specific command
-- \connect database

-- tables

DROP TABLE IF EXISTS cuenta cascade;

CREATE TABLE cuenta (
    id BIGSERIAL PRIMARY KEY,
    numero_cuenta VARCHAR(255) NOT NULL UNIQUE,
    tipo_cuenta VARCHAR(255) NOT NULL,
    saldo_inicial NUMERIC(19, 2) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    cliente_id VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS movimiento_cuenta cascade;

CREATE TABLE movimiento_cuenta (
    id BIGSERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL,
    tipo_movimiento VARCHAR(255) NOT NULL,
    valor NUMERIC(19, 2) NOT NULL,
    saldo NUMERIC(19, 2) NOT NULL,
    saldo_anterior NUMERIC(19, 2) NOT NULL,
    cuenta BIGINT NOT NULL,
    FOREIGN KEY (cuenta) REFERENCES cuenta(id)
);

DROP TABLE IF EXISTS cliente CASCADE;

CREATE TABLE cliente (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE,
    genero VARCHAR(50),
    fecha_nacimiento DATE,
    identificacion VARCHAR(50) NOT NULL UNIQUE,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    cliente_id VARCHAR(50) NOT NULL UNIQUE,
    clave VARCHAR(255) NOT NULL,
    estado VARCHAR(50) NOT NULL
);