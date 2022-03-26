-- Usaremos la BD jardinería
use jardineria;
-- 1 Inserta una oficina con sede en Fuenlabrada.
INSERT INTO Oficinas VALUES
('FUEE-ES','Fuenlabrada','España','Madrid','28941','918837627','C/Las suertes,27','Bajo A');

-- 2 Inserta un empleado para la oficina de Fuenlabrada que sea representante de ventas.
INSERT INTO Empleados (CodigoEmpleado,Nombre,Apellido1,Email,CodigoOficina,Puesto,Extension) 
VALUES (400,'Ismael','Sánchez','isanchez@jardineria.com','FUEE-ES','Rep.Ventas','123');

-- 3 Inserta un cliente del representante de ventas insertado en el punto 2.
INSERT INTO Clientes(CodigoCliente, NombreCliente, telefono,CodigoEmpleadoRepVentas,Fax,LineaDireccion1,ciudad)
VALUES (288,'Riegos Pérez','918882763',400,'adsf','micasa','otra');

-- 4 Inserta otros ejemplos de las tablas de jardinería y NBA a la vez. Fíjate en el formato en los ficheros SQL que las crearon.
INSERT INTO jugadores (codigo,Nombre,Procedencia,Altura,Posicion,Nombre_equipo) VALUES (614,'Domingo Lopez','Spaim','6-9','F-G','Lakers');

INSERT INTO Pedidos VALUES (129,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',288);
INSERT INTO DetallePedidos VALUES (129,'FR-67',10,70,1);

-- Ten en cuenta que al introducir datos puede que haya que meter datos en otras tablas por las referencias externas y que se haga en un orden. Ejemplo: una factura o un formulario web
