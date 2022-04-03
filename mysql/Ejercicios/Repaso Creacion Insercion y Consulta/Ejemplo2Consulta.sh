use alquileres;

-- ¿Qué propietario tiene más viviendas?
SELECT id_propietario, COUNT(*) FROM vivienda group by id_propietario by COUNT(*);

-- ¿Qué agencia oferta viviendas de Almería?
SELECT agencia.* FROM agencia inner join vivienda on agencia.id=vivienda.id_agencia where vivienda.poblacion="Almería";

-- Sube el importe del alquiler un 2’5 %
UPDATE alquiler set importe=importe*1.0025;

-- Borra las agencias que no ofertan viviendas
DELETE FROM agencia where id not in (select distinct id_agencia from vivienda);
