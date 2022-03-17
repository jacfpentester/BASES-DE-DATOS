-- BD NBA RECORDAD poner linea: use nba;

-- 1 ¿Cuántas temporadas diferentes hay en la tabla estadísticas?

select distinct temporada from estadisticas;

-- 2 ¿Qué jugadores tuvieron más de 20 puntos por partido durante la temporada 00/01?

select jugador,puntos_por_partido from estadisticas where puntos_por_partido >20 and temporada='00/01';

-- 3 ¿Cuántos equipos compiten según la conferencia y división y ordenando por división descente?

select conferencia,division,count(*) from equipos group by conferencia,division order by division desc;

-- 4 ¿Qué equipos anotaron más de 6000 puntos de local en total y la media durante la temporada 02/03 ordenados por nombre?

select equipo_local,sum(puntos_local) as total_local, avg(puntos_local) media from partidos where temporada ='02/03' group by equipo_local having total_local > 6000 order by equipo_local;

-- BD JARDINERÍA RECORDAD poner linea: use jardineria;

-- 5 Mostrar el código de oficina y la ciudad donde hay oficinas en EEUU.

SELECT CodigoOficina,ciudad FROM Oficinas where pais='EEUU';

-- 6 ¿Cuántos empleados hay en la compañía?

SELECT Count(*) FROM Empleados;

-- 7 ¿Cuántos clientes tiene cada país?
SELECT Count(*),Pais FROM Clientes GROUP BY Pais;

-- 8 ¿Cuál fue el pago medio en 2008? (pista: Usar la función YEAR de MySQL o la función to-char(fecha,'yyyy') de Oracle o LIKE)

SELECT AVG(Cantidad) FROM Pagos WHERE YEAR(FéchaPago)=2008;

-- 9 ¿Cuántos pedidos están en cada estado y ordena esta cuenta de manera descendente ?

SELECT Count(*),Estado FROM Pedidos GROUP BY Estado ORDER BY Count(*) DESC;

-- 10 ¿ Cual es el precio del producto más caro y del más barato?

SELECT Max(PrecioVenta),Min(PrecioVenta) FROM Productos;

-- 11 Obtén el nombre del cliente con mayor límite de crédito.

SELECT NombreCliente FROM Clientes WHERE LimiteCredito = (SELECT Max(LimiteCredito) FROM Clientes);

-- 12 Obtén el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

SELECT Nombre, Apellidol, Puesto FROM Empleados WHERE CodigoEmpleado NOT IN (SELECT CodigoEmpleadoRepVentas FROM Clientes );

-- 13 Muestra el nombre, los apellidos y el email de los empleados a cargo de Alberto Soria.

SELECT Nombre,Apellido1,Apellido2, email FROM Empleados WHERE CodigoJefe=3;

-- 14 Muestra el cargo, nombre, apellidos y email del jefe de la empresa.

select Nombre,Apellido1,Apellido2,email,Puesto from Empleados where CodigoJefe is null; 

-- 15 El nombre, apellidos y cargo de aquellos que no sean representantes de ventas.

select Nombre,Apellido1,Apellido2, Puesto from Empleados where not Puesto <>'Representante Ventas';

-- 16 Muestra el número de clientes que tiene la empresa

select count(CodigoCliente) from Clientes;

-- 17 Muestra el nombre de los clientes españoles. (dos opciones diferentes)

select NombreCliente,pais from Clientes where Pais='España' OR pais='SPAIN';

select NombreCliente,pais from Clientes where Pais IN ('España' , 'SPAIN');

-- 18 ¿Cuántos pedidos entregados ha realizado cada cliente?

select codigoCliente,count(*) as cuenta from Pedidos where FechaEntrega is not null group by CodigoCliente order by cuenta desc;

-- 19 ¿Cuántos clientes tiene la ciudad de Madrid?

select count(*) from Clientes where ciudad ='Madrid';

-- 20 ¿Cuántos clientes tienen las ciudades que empiezan por M?

select count(*),ciudad from Clientes where ciudad like 'M%' group by ciudad;

-- 21 El código de empleado y el número de clientes al que atiende cada representante de ventas.

select count(CodigoCliente), codigoEmpleadoRepVentas from Clientes group by codigoEmpleadoRepVentas; 

-- 22 Muestra el número de clientes que no tiene asignado representante de ventas.

select count(CodigoCliente) from Clientes where CodigoEmpleadoRepVentas is null;

-- 23 ¿Cuál fue la primera y última fecha de pago que hizo algún cliente?

select min(FechaPago),max(FechaPago) from Pagos;

-- 24 Muestra el código de cliente de aquellos clientes que hicieron pagos en 2008. (dos opciones)

select codigoCliente, FechaPago from Pagos where FechaPago like '2008-%-%';

select codigoCliente, FechaPago from Pagos where year(FechaPago)='2008';

-- 25 Muestra los distintos estados por los que puede pasar un pedido.

SELECT distinct Estado From Pedidos;

-- 26 Muestra el número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos que no han sido entregados a tiempo.

select CodigoPedido,CodigoCliente, FechaEsperada,FechaEntrega from Pedidos where FechaEntrega>FechaEsperada;

-- 27 ¿Cuántos productos existen en cada gama?

select count(*),Gama from Productos group by Gama;

-- 28 Saca los 20 productos más solicitados por cantidad.

select sum(Cantidad),CodigoProducto from DetallePedidos group by CodigoProducto order by sum(cantidad) desc limit 20;

-- 29 Muestra la facturación que ha tenido la empresa en toda la historia, indicando el subtotal, el IVA y el total facturado. 

SELECT sum(Cantidad*PrecioUnidad) as baseImponible, sum(Cantidad*PrecioUnidad)*0.21 as iva, sum(Cantidad*PrecioUnidad)*1.21 as total FROM DetallePedidos;

-- 30 La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por FR.

SELECT CodigoProducto, sum(Cantidad*PrecioUnidad) as baseImponible, sum(Cantidad*PrecioUnidad)*0.21 as iva, sum(Cantidad*PrecioUnidad)*1.21 as total  FROM DetallePedidos WHERE CodigoProducto like 'FR%' GROUP BY CodigoProducto;


