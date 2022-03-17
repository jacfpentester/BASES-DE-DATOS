-- Este documento está creado para que entre todos podáis ver las consultas sobre Jardineríay podáis corregir los fallos de los demás.
-- REPASO DE CONSULTAS SQL SOBRE BD JARDINERÍA
-- Consultas sobre una tabla
-- 1 Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

Select CodigoOficina, Ciudad from oficinas where ciudad is not null;

-- 2 Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select Ciudad, Telefono from oficinas where Pais in ('España',’Spain’);

-- 3 Devuelve un listado con el (nombre, apellidos) y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

Select concat(nombre,' ', apellido1,' ', apellido2) as nombreEmpleado, email, CodigoJefe from Empleados where CodigoJefe='7';

-- 4 Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT nombre, apellido1, apellido2, puesto from empleados where codigoempleado=1;

-- 5 Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

SELECT puesto, nombre, apellido1, Apellido2 FROM `empleados` WHERE Puesto<>'representante de ventas';

-- 6 Devuelve un listado con el nombre de todos los clientes españoles.

Select nombreCliente, Pais from clientes where Pais=`España`;

-- 7 Devuelve un listado con los distintos estados por los que puede pasar un pedido.

SELECT distinct estado FROM Pedidos;

-- 8 Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008.

SELECT CodigoCliente FROM `pagos` WHERE YEAR (FechaPago)=2008;

-- 9 Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

Select codigoPedido, CodigoCliente, fechaEsperada, fechaEntrega from pedidos
where fechaEntrega>FechaEsperada

-- 10 Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

SELECT codigopedido, codigocliente, fechaesperada, fechaentrega from pedidos
WHERE fechaentrega <= date_add(fechaesperada, interval -2 day)

-- 11 Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

Select * from pedidos where estado=’rechazado’ and FechaPedido like ’2009%’;
OR
Select * from pedidos where estado=’rechazado’ and year(FechaPedido)=`2009`

-- 12 Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

Select * from pedidos where Month(FechaEntrega)='01';
or
Select * from pedidos where FechaEntrega like '%-01-%';

-- 13 Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

SELECT CodigoCliente,FechaPago,Cantidad FROM Pagos where FormaPago='Paypal' and FechaPago like '2009-%' order by Cantidad desc;

-- 14 Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

SELECT Formapago, COUNT(*) FROM Pagos GROUP by FormaPago;

-- 15 Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

Select * from productos where Gama = "ornamentales" and CantidadEnStock >100 order by PrecioVenta desc;

-- 16 Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

SELECT ciudad, codigoEmpleadoRepVentas FROM clientes WHERE
ciudad='Madrid' and codigoEmpleadoRepVentas in (11,30)
SELECT ciudad, codigoEmpleadoRepVentas FROM clientes WHERE
ciudad='Madrid' and (codigoEmpleadoRepVentas=11 or codigoEmpleadoRepVentas=30)

-- Manejando subconsultas

-- 1 Devuelve el producto que más unidades tiene en stock.

SELECT * FROM `productos` WHERE CantidadEnStock= (SELECT MAX(CantidadEnStock) FROM productos);

-- 2 Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

SELECT clientes.NombreContacto ,concat(empleados.Nombre,
empleados.Apellido1) as representante FROM `clientes`
INNER JOIN empleados on
clientes.CodigoEmpleadoRepVentas=empleados.CodigoEmpleado;

-- 3 Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

SELECT clientes.NombreContacto ,concat(empleados.Nombre,
empleados.Apellido1) as representante FROM `clientes`
INNER JOIN empleados on
clientes.CodigoEmpleadoRepVentas=empleados.CodigoEmpleado WHERE
clientes.CodigoCliente IN (SELECT DISTINCT pagos.CodigoCliente from pagos);

-- 4 Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

SELECT clientes.NombreContacto, concat(empleados.Nombre,
empleados.Apellido1) as representante FROM `clientes`
INNER JOIN empleados on
clientes.CodigoEmpleadoRepVentas=empleados.CodigoEmpleado WHERE
clientes.CodigoCliente NOT IN (SELECT DISTINCT pagos.CodigoCliente from
pagos);

-- 5 Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

Select Clientes.NombreCliente,concat(Empleados.Nombre,' ',Empleados.Apellido1) as
representante,Empleados.CodigoOficina,Oficinas.Ciudad from Clientes,Empleados,Oficinas
where Empleados.CodigoEmpleado=Clientes.CodigoEmpleadoRepVentas and
Empleados.CodigoOficina=Oficinas.CodigoOficina
and Clientes.CodigoCliente in (SELECT CodigoCliente from Pagos ) ;

-- 6 Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

Select Clientes.NombreCliente,concat(Empleados.Nombre,' ',Empleados.Apellido1)
as representante,Empleados.CodigoOficina,Oficinas.Ciudad from
Clientes,Empleados,Oficinas
where Empleados.CodigoEmpleado=Clientes.CodigoEmpleadoRepVentas and
Empleados.CodigoOficina=Oficinas.CodigoOficina
and Clientes.CodigoCliente not in (SELECT CodigoCliente from Pagos ) ;

-- 7 Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT concat(oficinas.LineaDireccion1,oficinas.LineaDireccion2) from
oficinas,empleados where oficinas.CodigoOficina in (SELECT
empleados.CodigoOficina from empleados,clientes where
clientes.Ciudad="fuenlabrada" and empleados.CodigoEmpleado =
clientes.CodigoEmpleadoRepVentas );

-- 8 Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT clientes.NombreCliente,empleados.Nombre,oficinas.Ciudad from
clientes,empleados,oficinas where clientes.CodigoEmpleadoRepVentas in (SELECT
empleados.CodigoEmpleado from empleados ) and
oficinas.CodigoOficina=empleados.CodigoOficina;

-- 9 Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

SELECT concat(emp.Nombre,' ', emp.Apellido1) as empleado, concat(jefe.Nombre,'
', jefe.Apellido1) as jefe from Empleados emp,Empleados jefe where
emp.CodigoJefe=jefe.CodigoEmpleado;

-- 10 Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

SELECT concat(emp.Nombre,' ', emp.Apellido1) as empleado, concat(jefe.Nombre,'
', jefe.Apellido1) as jefe, concat(jefe2.Nombre,' ', jefe2.Apellido1) as jefeJefe
from Empleados emp,Empleados jefe,Empleados jefe2 where
emp.CodigoJefe=jefe.CodigoEmpleado and jefe.CodigoJefe=jefe2.CodigoEmpleado;

-- 11 Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

select * from Clientes where Clientes.CodigoCliente in (select CodigoCliente from
Pedidos where FechaEntrega>FechaEsperada)

-- 12 Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

select Productos.Gama,count(*) as total from Productos where
Productos.CodigoProducto in (SELECT distinct CodigoProducto from
DetallePedidos)
group by Productos.Gama;

-- 13 Devuelve un listado de los productos que nunca han aparecido en un pedido.

select * from Productos where Productos.CodigoProducto not in (SELECT distinct
CodigoProducto from DetallePedidos);

-- 14 Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

select * from Empleados where CodigoJefe=(select codigoEmpleado from
Empleados where Nombre='Alberto' and Apellido1='Soria');

-- 15 Devuelve el nombre del producto que tenga el precio de venta más caro.

SELECT * FROM Productos WHERE PrecioVenta = (select max(PrecioVenta) from Productos);

-- Consultas multitabla

-- 1 Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

select Clientes.*,Pagos.* from Clientes left join Pagos on
Clientes.CodigoCliente=Pagos.CodigoCliente where Pagos.FormaPago is null

-- 2 Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

SELECT Clientes.*,Pedidos.* from Clientes left join Pedidos on
CLientes.CodigoCliente=Pedidos.CodigoCliente
where Pedidos.FechaPedido is null

-- 3 Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

select Clientes.*,Pagos.* from Clientes
left join Pagos on Clientes.CodigoCliente=Pagos.CodigoCliente
left join Pedidos on CLientes.CodigoCliente=Pedidos.CodigoCliente where
Pagos.FormaPago is null and Pedidos.FechaPedido is null
A partir de aquí se cumple este patrón, se trata de buscar por left join y ver si lo que se
“acopla” de la otra tabla está a null o no.

-- 4 Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
-- Al hacer left join empleados y oficinas, el que tenga null en oficina
-- 5 Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
/*  Al hacer left join empleados y clientes por representante, ver los que da null
en cod_cliente
6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente
asociado junto con los datos de la oficina donde trabajan.
7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada
y los que no tienen un cliente asociado.
8. Devuelve un listado de los productos que nunca han aparecido en un pedido.
9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El
resultado debe mostrar el nombre, la descripción y la imagen del producto.
10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido
los representantes de ventas de algún cliente que haya realizado la compra de algún
producto de la gama Frutales.
11. Devuelve un listado con los clientes que han realizado algún pedido pero no han
realizado ningún pago.
12. Devuelve un listado con los datos de los empleados que no tienen clientes
asociados y el nombre de su jefe asociado. */
