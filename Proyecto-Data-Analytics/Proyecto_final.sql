-- Trabajo Final - Análisis de datos

-- Para ejecutar estas consultas debes haber ingresado con tu usuario y contraseña y haber creado la base de datos

-- 1️) Emepezamos viendo todas las tablas en la base de datos
SHOW TABLES;

-- 2️) Vemos la estructura de cada tabla
DESCRIBE sucursales;
DESCRIBE productos;
DESCRIBE ventas;
DESCRIBE costos;

-- 3️) Vemos las primeras filas de cada tabla
SELECT * FROM sucursales LIMIT 5;
SELECT * FROM productos LIMIT 5;
SELECT * FROM ventas LIMIT 5;
SELECT * FROM costos LIMIT 5;

-- 4) Contamos el número de registros en cada tabla
SELECT 'Sucursales' AS tabla, COUNT(*) AS total FROM sucursales
UNION ALL
SELECT 'Productos', COUNT(*) FROM productos
UNION ALL
SELECT 'Ventas', COUNT(*) FROM ventas
UNION ALL
SELECT 'Costos', COUNT(*) FROM costos;

-- 5) Vemos los diferentes tipos de productos y su cantidad
 
 SELECT categoria, COUNT(*) AS total_productos
 FROM productos
 GROUP BY categoria
 ORDER BY total_productos DESC;

-- 6) Vemos las sucursales y sus ubicaciones

SELECT nombre_sucursal, ciudad, region, gerente
FROM sucursales
ORDER BY region,ciudad;

-- 7) Top 5 productos más vendidos

SELECT p.nombre_producto, sum(v.cantidad_vendida) AS total_vendido
from ventas v
join productos p on p.id_producto = v.id_producto 
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC
LIMIT 5;
 
 -- 8️) Total de ingresos por sucursal
 
	 SELECT s.nombre_sucursal AS sucursal, sum(v.total_venta) AS ingresos
	 from ventas v
	 join sucursales s on v.id_sucursal = s.id_sucursal
	 group by s.nombre_sucursal
	 order by ingresos DESC;

-- 9️) Total de costos por sucursal

SELECT s.nombre_sucursal AS sucursal, SUM(c.total_costo) AS Costos
FROM costos c
JOIN sucursales s on c.id_sucursal = s.id_sucursal 
GROUP BY s.nombre_sucursal
ORDER BY costos DESC;

-- 10) Utilidad por sucursal (Ingresos - Costos)

SELECT v.nombre_sucursal, v.ingresos, c.costos, (v.ingresos - c.costos) AS utilidad
FROM 
    (SELECT s.nombre_sucursal, SUM(v.total_venta) AS ingresos
     FROM ventas v
     JOIN sucursales s ON v.id_sucursal = s.id_sucursal
     GROUP BY s.nombre_sucursal) v
JOIN 
    (SELECT s.nombre_sucursal, SUM(c.total_costo) AS costos
     FROM costos c
     JOIN sucursales s ON c.id_sucursal = s.id_sucursal
     GROUP BY s.nombre_sucursal) c
ON v.nombre_sucursal = c.nombre_sucursal
ORDER BY utilidad DESC;
