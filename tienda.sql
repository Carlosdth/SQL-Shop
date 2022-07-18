DROP database IF exists tienda;
create database tienda;
use tienda;


create table fabricante(
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

create table producto(
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
codigo_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- Lista el nombre de todos los productos que hay en la tabla producto

SELECT nombre 
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre, precio 
FROM producto;

-- Lista todas las columnas de la tabla producto.

SELECT * 
FROM producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD)

SELECT nombre, precio as Euros, (precio*1.06) AS Dolares 
FROM producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT nombre AS nombre_de_producto, precio AS euros, (precio * 1.06) AS dólares
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(nombre) AS nombre, precio
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(nombre) AS nombre, precio
FROM producto;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) AS nombre_2
FROM fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT nombre, ROUND(precio) AS precio_redondeado
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT nombre, TRUNCATE(precio,0) AS precio_NOdecimales
FROM producto;

-- Lista el código de los fabricantes que tienen productos en la tabla producto.

SELECT codigo_fabricante 
FROM producto;

-- Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.

SELECT DISTINCT codigo_fabricante
FROM producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT nombre
FROM fabricante
ORDER BY nombre;

-- Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT nombre, precio
FROM producto
ORDER BY nombre, precio DESC;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT *
FROM fabricante
LIMIT 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.

SELECT *
FROM fabricante
WHERE codigo >= 4 
LIMIT 2;

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio
FROM producto
ORDER BY precio
LIMIT 1;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.

SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.

SELECT nombre
FROM producto
WHERE precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT nombre
FROM producto
WHERE precio >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€

SELECT nombre
FROM producto
WHERE precio < 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT *
FROM producto
WHERE precio >= 80 AND precio <= 300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT *
FROM producto 
WHERE precio BETWEEN 60 AND 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.

SELECT *
FROM producto 
WHERE precio > 200 AND codigo_fabricante = 6;

-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

SELECT *
FROM producto 
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT *
FROM producto 
WHERE codigo_fabricante IN (1,3,5);

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). 
-- Cree un alias para la columna que contiene el precio que se llame céntimos.

SELECT nombre, (precio * 100) AS centimos
FROM producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT nombre
FROM fabricante 
WHERE nombre LIKE 's%';

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT nombre
FROM fabricante 
WHERE nombre LIKE '%e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT nombre
FROM fabricante 
WHERE nombre LIKE '%w%';

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

SELECT nombre
FROM fabricante 
WHERE nombre LIKE '____';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

SELECT nombre
FROM producto
WHERE nombre LIKE '%Port_til%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

SELECT nombre
FROM producto
WHERE nombre LIKE '%Monito%' AND precio < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
-- Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT p.nombre AS prodcuto, f.nombre AS fabricante, precio 
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
-- Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT p.nombre AS prodcuto, f.nombre AS fabricante, precio 
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre;

-- Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT p.nombre AS prodcuto, f.nombre AS fabricante, precio 
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
ORDER BY precio
LIMIT 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT p.nombre AS prodcuto, f.nombre AS fabricante, precio 
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
ORDER BY precio DESC
LIMIT 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT p.nombre
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '_enovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT p.nombre
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Crucial' AND p.precio > 200;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy, Seagate. Sin utilizar el operador IN.

SELECT p.nombre
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Asus' OR f.nombre LIKE 'Hewlett-Packardy' OR f.nombre LIKE 'Seagate';

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy, Seagate. Utilizando el operador IN.

SELECT p.nombre
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packardy', 'Seagate');

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT p.nombre, p.precio
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%e';

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT p.nombre, p.precio
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. 
-- Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre;

-- Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT distinct f.codigo, f.nombre
FROM fabricante AS f
JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante;

-- Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

SELECT f.nombre, p.nombre
FROM fabricante AS f
LEFT JOIN producto AS p
	ON f.codigo = p.codigo_fabricante;
    
-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT f.nombre, p.nombre
FROM fabricante AS f
LEFT JOIN producto AS p
	ON f.codigo = p.codigo_fabricante
WHERE f.nombre IN ('Huawei', 'Xiaomi');

-- Calcula el número total de productos que hay en la tabla productos.

SELECT COUNT(nombre)
FROM producto;

-- Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT COUNT(nombre)
FROM fabricante;

-- Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.

SELECT COUNT(DISTINCT codigo_fabricante)
FROM producto;

-- Calcula la media del precio de todos los productos.

SELECT AVG(precio)
FROM producto;

-- Calcula el precio más barato de todos los productos.

SELECT MIN(precio)
FROM producto;

-- Calcula el precio más caro de todos los productos.

SELECT MAX(precio)
FROM producto;

-- Lista el nombre y el precio del producto más barato.

SELECT nombre, MIN(precio)
FROM producto;

-- Lista el nombre y el precio del producto más caro.

SELECT nombre, MAX(precio)
FROM producto;

-- Calcula la suma de los precios de todos los productos.

SELECT SUM(precio)
FROM producto;

-- Calcula el número de productos que tiene el fabricante Asus.

SELECT COUNT(p.nombre)
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Asus';

-- Calcula la media del precio de todos los productos del fabricante Asus.

SELECT AVG(p.precio)
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Asus';

-- Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT MIN(p.precio)
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Asus';

-- Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT MAX(p.precio)
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Asus';

-- Calcula la suma de todos los productos del fabricante Asus.

SELECT SUM(p.precio)
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Asus';

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

SELECT MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(p.nombre)
FROM producto AS p
JOIN fabricante AS f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE 'Crucial';

-- Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. 
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
-- Ordene el resultado descendentemente por el número de productos.

SELECT f.nombre, COUNT(p.nombre) AS numero_de_productos
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY COUNT(p.nombre) DESC;

-- Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio)
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.

SELECT  f.codigo, MAX(p.precio), MIN(p.precio), COUNT(p.nombre)
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.codigo;

-- Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- Es necesario mostrar el nombre del fabricante.

SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio) AS media, count(p.nombre)
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING AVG(p.precio) > 200;

-- Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT COUNT(*)
FROM producto
WHERE precio >= 180;

-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT f.nombre, COUNT(p.nombre)
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
WHERE precio >= 180
GROUP BY f.nombre;

-- Lista el precio medio de los productos de cada fabricante, mostrando solamente el código del fabricante.

SELECT f.codigo, AVG(p.precio)
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- Lista el precio medio de los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT f.nombre, AVG(p.precio)
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

SELECT f.nombre
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
WHERE precio >= 150
GROUP BY f.nombre;

-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT f.nombre
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.nombre) >= 2;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

SELECT f.nombre, count(*)
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
WHERE precio >= 220
GROUP BY f.nombre;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, 
-- si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT f.nombre,
	COUNT(CASE 
		WHEN p.precio >= 220 THEN p.nombre 
		ELSE NULL 
		END) AS Total
FROM fabricante as f
LEFT JOIN producto as p
	ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.

SELECT f.nombre
FROM fabricante AS f
LEFT JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING SUM(p.precio) > 1000;

-- Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. 
-- El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

SELECT p.nombre AS producto_mas_caro, max(p.precio) AS precio, f.nombre AS fabricante
FROM fabricante AS f
JOIN producto AS p
	ON  f.codigo = p.codigo_fabricante
GROUP BY f.codigo;

-- Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT p.nombre
FROM producto AS p
WHERE  codigo_fabricante= (SELECT codigo 
	FROM fabricante AS f 
    WHERE f.nombre LIKE 'Lenovo');

-- Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT *
FROM producto AS p
WHERE precio= (SELECT max(p.precio) 
	FROM producto 
	WHERE p.codigo_fabricante= (SELECT f.codigo 
		FROM fabricante AS f
		WHERE f.nombre LIKE 'Lenovo'));
                                            
                                            
-- Lista el nombre del producto más caro del fabricante Lenovo.

SELECT producto.nombre
FROM producto
WHERE precio = (SELECT MAX(precio)
				FROM fabricante
                INNER JOIN producto
					ON fabricante.codigo = producto.codigo_fabricante
				WHERE fabricante.nombre = 'Lenovo');
               
-- Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT producto.nombre
FROM producto
WHERE precio = (SELECT MIN(precio)
	FROM fabricante
	INNER JOIN producto
		ON fabricante.codigo = producto.codigo_fabricante
	WHERE fabricante.nombre = 'Hewlett-Packard');

-- Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

SELECT *
FROM producto
WHERE precio >= (SELECT MAX(precio)
    FROM fabricante  
    INNER JOIN producto
		ON fabricante.codigo = producto.codigo_fabricante
    WHERE fabricante.nombre = 'Lenovo');
                    
-- Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

SELECT producto.*
FROM producto
INNER JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = (SELECT nombre
	FROM fabricante 
	WHERE nombre = 'Asus') 
    AND precio > (SELECT AVG(precio)
	FROM fabricante
	INNER JOIN producto
		ON fabricante.codigo = producto.codigo_fabricante
	WHERE fabricante.nombre = 'Asus');
                                                                
                                                                
-- Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT *
FROM producto
WHERE precio >= ALL (SELECT precio
	FROM producto);

                
-- Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT *
FROM producto
WHERE precio <= ALL (SELECT precio
	FROM producto);
    
-- Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro. 

SELECT fabricante.nombre, producto.nombre, max(precio) AS precio
FROM fabricante
INNER JOIN producto
	ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre;

-- Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT *
FROM producto INNER JOIN (
    SELECT codigo_fabricante, AVG(precio) AS media
    FROM producto
    GROUP BY codigo_fabricante) AS t
ON producto.codigo_fabricante = t.codigo_fabricante
WHERE producto.precio >= t.media;




