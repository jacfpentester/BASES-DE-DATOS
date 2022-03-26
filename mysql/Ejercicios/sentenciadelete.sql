/* ¡IMPORTANTE! Hay que estar MUY seguro de lo que se está haciendo en este proceso. Si
borras un registro después no lo podrás recuperar si no hay backup.
Por este motivo, o se hace en un entorno de pruebas o mediante transacciones SQL que se
pueden deshacer */

-- Usaremos la BD jardinería.
use jardineria;

-- 1 Borra los clientes que no tengan pedidos.
delete from Clientes where CodigoCliente not in
(Select distinct CodigoCliente from Pedidos);

-- 2 Borra los pagos del cliente con menor límite de crédito.
delete from Pagos where CodigoCliente in
(Select CodigoCliente from Clientes where LimiteCredito =
(Select min(LimiteCredito) from Clientes));

-- 3 Borra los pagos por cheque.
delete from Pagos where FormaPago='Cheque';

-- 4 Borra los pedidos y su detalle del cliente “Tendo Garden”.
delete from Pedidos where CodigoCliente=(select CodigoCliente from Clientes where NombreCliente='Tendo Garden');
delete from DetallePedidos where CodigoPedido in (select CodigoPedido from Pedidos where CodigoCliente=(select CodigoCliente from Clientes where NombreCliente='Tendo Garden'));

-- Usaremos la BD NBA.
use nba;

-- 5 Borra las estadísticas de los jugadores sin procedencia.
delete from estadisticas where jugador in (select codigo from jugadores where Procedencia is null);
delete from jugadores where Procedencia is null;

-- 6 Borra los jugadores españoles.
delete from jugadores where Procedencia='Spain';

-- 7 Borra los equipos de las ciudades que tienen una o en la segunda posición.
delete from equipos where Ciudad like '_o%';

-- 8 Borra todo lo relacionado con el equipo 76ers en la base de datos.
delete from partidos where equipo_local='76ers' or equipo_visitante='76ers';
delete from equipos where Nombre='76ers';
delete from jugadores where Nombre_equipo='76ers';

-- Usaremos la BD jardinería.
use jardineria;

-- 9 Actualiza el código de un cliente y averigua si hubo cambios en las tablas relacionadas. ¿Y borrarlo?
UPDATE Clientes SET CodigoCliente=290 WHERE CodigoCliente=288;
-- no permite la modificación, debería tener la FK con ON UPDATE CASCADE;

DELETE FROM Clientes WHERE CodigoCliente=288;
-- tampoco permite el borrado, debería tener la FK con ON DELETE CASCADE
