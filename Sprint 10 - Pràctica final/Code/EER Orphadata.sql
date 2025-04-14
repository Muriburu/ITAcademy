-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS orphadata CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 2. Usar la base de datos
USE orphadata;

-- 3. Tabla principal: enfermedades
CREATE TABLE enfermedades (
    ORPHAcode INT PRIMARY KEY,
    nombre_enfermedad VARCHAR(255) NOT NULL
);

-- 4. Diccionario de fenotipos
CREATE TABLE fenotipos (
    fenotipo_id VARCHAR(50) PRIMARY KEY,
    fenotipo VARCHAR(255)
);

-- 5. Diccionario de genes
CREATE TABLE genes (
    hgnc_id INT,
    simbolo_gen VARCHAR(50) PRIMARY KEY,
    nombre_gen VARCHAR(255),
    tipo_gen VARCHAR(100),
    sinonimos TEXT,
    locus VARCHAR(100)
);

-- 6. Clasificación de enfermedades
CREATE TABLE clasificacion (
    clase_id INT,
    clase VARCHAR(255),
    ORPHAcode INT,
    nombre_enfermedad VARCHAR(255),
    FOREIGN KEY (ORPHAcode) REFERENCES enfermedades(ORPHAcode)
);

-- 7. Información epidemiológica
CREATE TABLE epidemiologia (
    ORPHAcode INT,
    nombre_enfermedad VARCHAR(255),
    tipo_enfermedad VARCHAR(100),
    prevalencia_tipo VARCHAR(100),
    prevalencia_final FLOAT,
    region_prevalencia VARCHAR(100),
    calidad_prevalencia VARCHAR(100),
    estado_validacion_prevalencia VARCHAR(100),
    fuente TEXT,
    FOREIGN KEY (ORPHAcode) REFERENCES enfermedades(ORPHAcode)
);

-- 8. Historia clínica
CREATE TABLE historia (
    ORPHAcode INT,
    nombre_enfermedad VARCHAR(255),
    tipo_enfermedad VARCHAR(100),
    edad_media_inicio VARCHAR(100),
    tipo_herencia VARCHAR(100),
    FOREIGN KEY (ORPHAcode) REFERENCES enfermedades(ORPHAcode)
);

-- 9. Asociación enfermedad-fenotipo
CREATE TABLE enfermedad_fenotipo (
    ORPHAcode INT,
    fenotipo_id VARCHAR(50),
    frecuencia VARCHAR(50),
    FOREIGN KEY (ORPHAcode) REFERENCES enfermedades(ORPHAcode),
    FOREIGN KEY (fenotipo_id) REFERENCES fenotipos(fenotipo_id)
);

-- 10. Asociación enfermedad-gen
CREATE TABLE enfermedad_gen (
    ORPHAcode INT,
    simbolo_gen VARCHAR(50),
    fuente_info TEXT,
    FOREIGN KEY (ORPHAcode) REFERENCES enfermedades(ORPHAcode),
    FOREIGN KEY (simbolo_gen) REFERENCES genes(simbolo_gen)
);
