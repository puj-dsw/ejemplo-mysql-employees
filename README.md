# Employees: Base de datos de ejemplo en MySQL

> Base de datos de ejemplo con un conjunto relativamente grande de datos (160MB aprox.): incluye 4 tablas con unos 4 millones de registros en total.

La documentación de este ejempo está disponible en [el sitio de MySQL](https://dev.mysql.com/doc/employee/en/) y en el [repositorio de Github](https://github.com/datacharmer/test_db).

## Clonando el proyecto

Este repositorio Git contiene un submodulo con un enlace al repositorio del ejemplo. Al clonar el repositorio es necesario inicializar el submodulo. Por ejemplo, puede ejecutar las siguientes instrucciones

```
git clone ...
git submodule init
git submodule update
```

## Crear una imagen de contenedor con el ejemplo

Ejecute el script `crear-contenedor` para crear la imagen de contenedor con el ejemplo.

```
# En Windows
crear-imagen.bat

# En Linux
sh ./crear-imagen.sh
```

Si lo desea, puede ejecutar `docker build` para crear la imagen

```
docker build -t mysql-employees .
```

## Ejecutar el contenedor

Puede usar `ejecutar-mysql` para ejecutar el contenedor.

```
# En Windows
ejecutar-contenedor

# En Linux
sh ./ejecutar-contenedor.sh
```

## Acceder a la base de datos

> El script expone los puertos 3306 y 33060. Cuando ejecuta el contenedor es posible conectarse a la base de datos usando cualquier programa, incluyendo [MySQL Workbench](https://www.mysql.com/products/workbench/), usando la dirección `localhost` en el puerto 3306.

Es posible usar el script `ejecutar-mysql` para conectarse a la base de datos.

```
# En Windows
ejecutar-mysql.bat

# En linux
sh ./ejecutar-mysql.sh
```

La contraseña para el usuario `root` es `secret`.

## Ejecutando un script de SQL

El contenedor carga una carpeta `/sql` que es compartida con el entorno de desarrollo: Los archivos que están en la carpeta `sql` del proyecto se pueden ver en el contenedor en la carpeta `/sql`.

- Es posible crear y modificar archivos en la carpeta `sql` en el entorno de desarrollo
- Es posible ejecutar estos archivos en MySQL usando `source /sql/<nombre-archivo>.sql`

Por ejemplo, suponga que crea un archivo en `sql/listado-empleados.sql`

```
USE employees;

SELECT * 
  FROM employees
  LIMIT 10;
```

Es posible ejecutar el script iniciando MySQL en el contenedor (p.ej., usando `./ejecutar-mysql.sh`) y ejecutando el siguiente comando

```
source /sql/listado-empleados.sql
```


## Detener y eliminar el contenedor

Es posible usar `detener-contenedor` para detener y eliminar el contenedor.

```
# En Windows
detener-contenedor.bat

# En Linux
sh ./detener-contenedor.sh
```
