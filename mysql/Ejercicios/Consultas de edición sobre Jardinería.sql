-- 1 Elimina los clientes que no hayan realizado ningún pedido.
2) Reduce en un 20% el precio de venta de los productos que no tengan pedidos.
3) Borra los pagos del cliente con menor límite de crédito.
4) Establece a 0 el límite de crédito del cliente que menos unidades pedidas tenga
del producto 11679.
5) Modifica la tabla detalle_pedido para insertar un campo numérico llamado iva.
Establece el valor de ese campo a 18 para aquellos registros cuyo pedido tenga
fecha a partir de Enero de 2009. A continuación, actualiza el resto de pedidos
estableciendo el iva al 21.
6) Modifica la tabla detalle_pedido para incorporar un campo numérico llamado
total_linea y actualiza todos sus registros para calcular su valor con la fórmula:
total_linea = precio_unidad*cantidad * (1 + (iva/100));
7) Borra el cliente que menor límite de crédito tenga. ¿Es posible borrarlo solo con
una consulta? ¿Por qué?
8) Inserta una oficina con sede en Granada y tres empleados que sean
representantes de ventas y sin jefe asignado.
9) Inserta tres clientes que tengan como representantes de ventas los empleados
que hemos creado en el paso anterior.
