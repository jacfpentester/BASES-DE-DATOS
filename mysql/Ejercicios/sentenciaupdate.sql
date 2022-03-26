-- Usaremos la BD jardinería
use jardineria;

-- 1 Cambia la región de Madrid a MAD
update Clientes set Region='MAD' where Ciudad='Madrid';

-- 2 Coloca en región lo mismo que en Ciudad en los registros no indicados
update Clientes set Region=Ciudad where Region is null;

-- 3 Incrementa en un 20% el precio de los productos que no tengan pedidos.
update Productos set PrecioVenta=PrecioVenta*1.2 where not exists
(Select distinct CodigoProducto from DetallePedidos
where DetallePedidos.CodigoProducto=Productos.CodigoProducto);

update Productos set PrecioVenta=PrecioVenta*1.2 where CodigoProducto not in (Select distinct CodigoProducto from DetallePedidos);

-- 4 Modifica la tabla DetallePedido para incorporar un campo numérico llamado TotalLinea, y actualiza todos sus registros para calcular su valor con la fórmula TotalLinea=PrecioUnidad*Cantidad*IVA/100
ALTER TABLE DetallePedidos ADD Column TotalLinea NUMERIC(15,3);
ALTER TABLE DetallePedidos ADD Column TotalLinea2 NUMERIC(15,3) default 0;
UPDATE DetallePedidos Set TotalLinea=Cantidad*PrecioUnidad*IVA/100;

-- 5 Establece a 0 el límite de crédito del cliente que menos unidades pedidas tenga del producto 'OR-179'.
update Clientes set LimiteCredito=0 where CodigoCliente=
(Select CodigoCliente from Pedidos natural join DetallePedidos
where Cantidad = (Select Min(Cantidad) From DetallePedidos where
CodigoProducto='OR-179') AND CodigoProducto='OR-179';
