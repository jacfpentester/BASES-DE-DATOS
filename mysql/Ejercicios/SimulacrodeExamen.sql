-- Base de datos NBA

-- 1 ¿Cuánto pesa el jugador más pesado de cada equipo?

SELECT Nombre_equipo , max(peso) FROM jugadores GROUP BY Nombre_equipo;

-- 2 ¿Qué equipos anotaron más de 6000 puntos de local en total y la media durante la temporada 02/03 ordenados por nombre?

select equipo_local,sum(puntos_local) as total_local, avg(puntos_local) media from partidos where temporada ='02/03' 
group by equipo_local having total_local > 6000 order by equipo_local;

-- 3 ¿De qué ciudad es el equipo con el jugador más bajo?

SELECT ciudad FROM equipos WHERE nombre =  
  (SELECT nombre_equipo FROM jugadores WHERE altura = 
         (SELECT min(altura) FROM jugadores));

-- 4 Utiliza la UNION para extraer el nombre de los equipos que anotaron más de 100 puntos como local y ganaron sus partidos, junto con los equipos que tienen jugadores españoles.

select distinct equipo_local from partidos where puntos_local > 100 and puntos_local > puntos_visitante
union
select distinct Nombre_equipo from jugadores where Procedencia='Spain';

-- 5 ¿Qué media de rebotes tienen los jugadores de la conferencia este?

select avg(Rebotes_por_partido) as media,jugadores.Nombre from estadisticas, jugadores, equipos
where jugadores.codigo=estadisticas.jugador and jugadores.Nombre_equipo=equipos.Nombre and Conferencia='East'
group by Nombre;

-- 6 ¿Cuántos jugadores juegan en la posición G en cada equipo de la conferencia este? Ordénalos por el total de manera descendente y en caso de empate por nombre de equipo ascendente.

select count(*) as total,Nombre_equipo from jugadores,equipos 
where jugadores.Nombre_equipo=equipos.Nombre 
and Posicion='G' and equipos.Conferencia='East'
group by Nombre_equipo
order by total desc,jugadores.Nombre_equipos asc;
