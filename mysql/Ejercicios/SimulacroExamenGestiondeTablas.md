#Simulacro de Examen en Gestion de Tablas  
![](/mysql/Ejercicios/CreaciondeTablas/img/1.JPG)  
1) Crea un índice en la tabla Pieza sobre los campos código y código_categoría  

create index i_pieza on pieza (codigo,cod_categoria);  

2) Añade un nuevo campo cod_Postal a la tabla Proveedor de tipo char(5) tras el campo provincia  

alter table proveedor add cod_Postal char(5) after provincia;
