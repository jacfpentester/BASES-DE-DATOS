#Simulacro de Examen en Gestion de Tablas  
![](/mysql/Ejercicios/CreaciondeTablas/img/1.JPG)  
1) Crea un índice en la tabla Pieza sobre los campos código y código_categoría  

create index i_pieza on pieza (codigo,cod_categoria);  

2) Añade un nuevo campo cod_Postal a la tabla Proveedor de tipo char(5) tras el campo provincia  

alter table proveedor add cod_Postal char(5) after provincia;  

3) Crea una vista en la tabla Proveedor_suministra_pieza  
	
create view vista_proveedor_suministra_pieza as select * from proveedorsuministrapieza;  

4) Elimina la FK de pieza.  

alter table pieza drop foreign key fk_categoria;  

5) Crea de nuevo la FK a pieza.  
 
alter table pieza add constraint fk_cod_pieza foreign key (cod_categoria) references categoria(codigo);  

6) Cambia el nombre de la tabla Proveedor_suministra_pieza.  

rename table proveedorsuministrapieza TO proveedor_da_pieza;  

Pero ante esta acción devemos previamente borrar la vista:  
drop view if exists vista_proveedor_suministra_pieza;  
y luego realizar el rename.  

7) Crea una copia de la tabla pieza con el nombre pieza2  

create table pieza2 as select * from pieza;

8) Elimina la tabla pieza2 en el orden correcto.  

-- Para borrar la tabla eliminaremos sus referencias a otras tablas como en la copia no ha hecho los FK directamente borramos  
-- Ejemplo en caso de tener relaciones  alter table pieza2 drop foreign key (nombredelfk);  


