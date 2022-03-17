-- BD JARDINERÍA RECORDAD poner use jardineria;

-- 1 ¿Cuál es el nombre del producto más caro?

select Nombre from Productos where PrecioVenta = (Select max(PrecioVenta) from Productos);

-- 2 ¿Cuál es el nombre del producto del que más unidades se hayan vendido en un pedido?

select Nombre from Productos where CodigoProducto=(select CodigoProducto from DetallePedidos where cantidad=(select max(cantidad) from DetallePedidos));

-- 3 Muestra los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado.

select NombreCliente from Clientes where LimiteCredito > (select sum(Cantidad) from Pagos where Pagos.CodigoCliente=Clientes.CodigoCliente group by CodigoCliente); 

-- 4 Muestra el producto que más unidades tiene en stock o el que menos unidades tiene.

select Nombre,CantidadEnStock from Productos where CantidadEnStock = (SELECT MAX(CantidadEnStock) FROM Productos) or CantidadEnStock = (SELECT MIN(CantidadEnStock) FROM Productos);

-- 5 ¿Qué empleados trabajan en la oficinas de Madrid y Sydney? 

select * from Empleados where CodigoOficina in (select CodigoOficina from Oficinas where Ciudad in ('Madrid','Sydney'));

-- 6 ¿Qué productos tienen una gama relacionada con plantas?

select * from Productos where Gama in (select Gama from GamasProductos where DescripcionTexto like 'Plantas%');

-- 7 Utiliza la UNION para extraer el (nomre apellidos) y email de los empleados que son Director Oficina y Secretaria

select concat(Nombre,' ', Apellido1,' ', Apellido2) as nombre, Email from Empleados where Puesto='Director Oficina'
UNION
select concat(Nombre,' ', Apellido1,' ', Apellido2) as nombre , Email from Empleados where Puesto='Secretaria';

-- DB nba RECORDAD use nba;

-- 8 Nombre de los jugadores que tuvieron más de 4 rebotes durante la temporada 01/02

select Nombre from jugadores where codigo in (select jugador from estadisticas where Rebotes_por_partido >4 and temporada ='01/02');

 -- 9 ¿De qué ciudad es el equipo con el jugador más bajo?
 
SELECT ciudad FROM equipos WHERE nombre = (SELECT nombre_equipo FROM jugadores WHERE altura = (SELECT min(altura) FROM jugadores));

-- 10 ¿Qué jugador hizo más asistencias en alguna temporada y ordénalo por nombre completo descendente?

select * from jugadores where codigo in 
    (select jugador from estadisticas where (temporada,Asistencias_por_partido) in 
        (select temporada,max(Asistencias_por_partido)as totalAsistencia from estadisticas group by temporada)
    )
order by Nombre desc;

-- 11 ¿Qué equipos no tienen jugadores de España, Italia y Francia?

SELECT Nombre FROM equipos WHERE NOT EXISTS (SELECT  Nombre FROM jugadores 	WHERE equipos.Nombre = jugadores.Nombre_Equipo 	AND procedencia in ('Spain','France','Italy'));

-- 12 Utiliza la UNION para extraer el nombre de los equipos que anotaron más de 100 puntos como local y ganaron sus partidos, junto con los equipos que tienen jugadores españoles.

select distinct equipo_local from partidos where puntos_local > 100 and puntos_local > puntos_visitante
union
select distinct Nombre_equipo from jugadores where Procedencia='Spain';

-- 13 ¿Qué jugadores y en qué equipo juegan en la división Atlantic? 

select Nombre,Nombre_equipo from jugadores where Nombre_equipo in 
    (select Nombre from equipos where Division='Atlantic');
