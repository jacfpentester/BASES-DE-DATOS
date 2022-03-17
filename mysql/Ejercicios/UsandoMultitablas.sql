-- BD jardineria RECORDAD poner use jardineria;

-- 1
SELECT NombreCliente, concat(Nombre,' ', Apellido1) as EmpleadoVentas FROM Clientes INNER JOIN Empleados 
    ON Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado;

-- 2
select Clientes.NombreCliente,Empleados.Nombre,Oficinas.Ciudad from Empleados 
inner join Oficinas
    on Oficinas.CodigoOficina=Empleados.CodigoOficina
inner join Clientes 
  	on Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado;
	
-- 3
select Clientes.NombreCliente,Empleados.Nombre,Oficinas.Ciudad from Empleados 
inner join Oficinas
    on Oficinas.CodigoOficina=Empleados.CodigoOficina
inner join Clientes 
  	on Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado
and not exists (Select CodigoCliente from Pagos where Pagos.CodigoCliente=Clientes.CodigoCliente)
order by NombreCliente;

select Clientes.NombreCliente,Empleados.Nombre,Oficinas.Ciudad from Empleados 
inner join Oficinas
    on Oficinas.CodigoOficina=Empleados.CodigoOficina
inner join Clientes 
  	on Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado
and Clientes.CodigoCliente not in (Select distinct CodigoCliente from Pagos)
order by NombreCliente;

-- 4
select Clientes.NombreCliente,Empleados.Nombre,Clientes.Ciudad from Empleados 
inner join Clientes 
    on Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado
inner join Oficinas
    on Oficinas.Ciudad=Clientes.Ciudad;

select Clientes.NombreCliente,Empleados.Nombre,Clientes.Ciudad from Empleados 
inner join Oficinas
    on Oficinas.CodigoOficina=Empleados.CodigoOficina
inner join Clientes 
  	on Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado
    and Oficinas.Ciudad=Clientes.Ciudad;

-- 5
SELECT Nombre, SUM(Cantidad) As TotalUnidades, SUM(Cantidad*PrecioUnidad) as TotalFacturado, SUM(Cantidad*PrecioUnidad)*1.21 as TotalConImpuestos FROM DetallePedidos 
NATURAL JOIN Productos
GROUP BY Nombre HAVING Sum(Cantidad*PrecioUnidad)>3000;

-- 6
select distinct NombreCliente from Clientes 
natural Join Pedidos 
where FechaEntrega > FechaEsperada;

-- 7
select distinct NombreCliente from Pedidos 
natural join Clientes 
where Pedidos.FechaPedido like '2008%'

-- 8
select Ciudad,count(*) as total from Empleados 
natural join Oficinas 
group by Ciudad;

-- BD NBA RECORDAD poner use nba;

-- 9
select avg(Rebotes_por_partido),jugadores.Nombre from estadisticas, jugadores, equipos
where jugadores.codigo=estadisticas.jugador and jugadores.Nombre_equipo=equipos.Nombre and Conferencia='East'
group by Nombre;

-- 10
select Nombre from jugadores,estadisticas 
where estadisticas.jugador=jugadores.codigo and Puntos_por_partido =
    (select max(Puntos_por_partido) from estadisticas);

select Nombre,max(estadisticas.Puntos_por_partido) as total from jugadores inner join estadisticas 
	on estadisticas.jugador=jugadores.codigo 
group by Nombre
order by total desc limit 1;


-- 11
select count(*),Nombre_equipo from jugadores,equipos 
where jugadores.Nombre_equipo=equipos.Nombre 
and Posicion='G' and equipos.Conferencia='East'
group by Nombre_equipo;

-- 12
select Nombre,estadisticas.Rebotes_por_partido from jugadores,estadisticas 
where estadisticas.jugador=jugadores.codigo and Rebotes_por_partido =
    (Select max(Rebotes_por_partido) from estadisticas,jugadores 
     where estadisticas.jugador=jugadores.codigo and Nombre_equipo='Suns'
    )
and Nombre_equipo='Suns';

select Nombre,max(estadisticas.Rebotes_por_partido) as total from jugadores inner join estadisticas 
	on estadisticas.jugador=jugadores.codigo 
where Nombre_equipo='Suns'
group by Nombre
order by total desc limit 1;
