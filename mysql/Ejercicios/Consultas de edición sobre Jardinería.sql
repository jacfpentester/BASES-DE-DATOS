use jardineria;
-- 1 Elimina los clientes que no hayan realizado ningún pedido.
delete from Clientes where CodigoCLiente not in (select distinct CodigoCliente from Pedidos);

-- 2 Reduce en un 20% el precio de venta de los productos que no tengan pedidos.
update Productos set PrecioVenta=PrecioVenta*0.8 where CodigoProducto not in (select distinct CodigoProducto from DetallePedidos);

-- 3 Borra los pagos del cliente con menor límite de crédito.
delete from Pagos where CodigoCliente in (select CodigoCliente from Clientes where LimiteCredito=(select min(LimiteCredito) from Clientes));

-- 4 Establece a 0 el límite de crédito del cliente que menos unidades pedidas tenga del producto 11679.
update Clientes set LimiteCredito=0 where CodigoCliente=
(Select CodigoCliente from Pedidos natural join DetallePedidos
where Cantidad = (Select Min(Cantidad) From DetallePedidos where
CodigoProducto='11679') AND CodigoProducto='11769'
);

-- 5 Modifica la tabla detalle_pedido para insertar un campo numérico llamado iva. Establece el valor de ese campo a 18 para aquellos registros cuyo pedido tenga fecha a partir de Enero de 2009. A continuación, actualiza el resto de pedidos estableciendo el iva al 21.
ALTER TABLE DetallePedidos ADD Column IVA NUMERIC(15,2);
UPDATE DetallePedidos set IVA=21;
UPDATE DetallePedidos Set IVA=18 where CodigoPedido in (select CodigoPedido from Pedidos where FechaPedido >'2009-01-01');
-- alternativa 2
-- UPDATE DetallePedidos Set IVA=21 where CodigoPedido in (select CodigoPedido from Pedidos where FechaPedido <'2009-01-01');

-- 6 Modifica la tabla detalle_pedido para incorporar un campo numérico llamado total_linea y actualiza todos sus registros para calcular su valor con la fórmula: total_linea = precio_unidad*cantidad * (1 + (iva/100));
ALTER TABLE DetallePedidos ADD Column total_linea NUMERIC(15,2);
UPDATE DetallePedidos set total_linea=PrecioUnidad*Cantidad*(1+IVA/100);

-- 7 Borra el cliente que menor límite de crédito tenga. ¿Es posible borrarlo solo con una consulta? ¿Por qué?

-- 8 Inserta una oficina con sede en Granada y tres empleados que sean
representantes de ventas y sin jefe asignado.
INSERT INTO Oficinas VALUES
('GRAN-ES','GRANADA','España','Andalucía','18004','918837627','C/Alhambra','Bajo A');
INSERT INTO Empleados (CodigoEmpleado,Nombre,Apellido1,Email,CodigoOficina,Puesto,Extension) 
VALUES (500,'Domingo','López','isanchez@jardineria.com','GRAN-ES','Rep.Ventas',NULL);
INSERT INTO Empleados (CodigoEmpleado,Nombre,Apellido1,Email,CodigoOficina,Puesto,Extension) 
VALUES (501,'Ángel','López','isanchez@jardineria.com','GRAN-ES','Rep.Ventas',NULL); 
INSERT INTO Empleados (CodigoEmpleado,Nombre,Apellido1,Email,CodigoOficina,Puesto,Extension) 
VALUES (502,'Pilar','López','isanchez@jardineria.com','GRAN-ES','Rep.Ventas',NULL)
-- 9 Inserta tres clientes que tengan como representantes de ventas los empleados que hemos creado en el paso anterior.
INSERT INTO Clientes(CodigoCliente, NombreCliente, telefono,CodigoEmpleadoRepVentas,Fax,LineaDireccion1,ciudad)
VALUES (290,'Cliente1','918882763',500,'adsf','micasa','otra'), (291,'Cliente2','918882763',501,'adsf','micasa','otra'), (292,'Cliente3','918882763',502,'adsf','micasa','otra');
