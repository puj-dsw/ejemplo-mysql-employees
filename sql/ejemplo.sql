# Script de ejemplo
# -----------------
# Para ejecutarlo en el MySQL en el contenedor se puede ejecutar
#   source /sql/ejemplo.sql

use employees;

# lista los primeros 10 empleados
select * from employees limit 10;