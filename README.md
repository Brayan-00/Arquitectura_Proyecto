# Arquitectura_Proyecto
Analizador estadístico y generador de histogramas en ASM NASM X86_86

## Planeamiento

### Acceder archivo notas.txt

+ Se debe crear una subrutina capaz de verificar si existe un archivo y en caso de que no exista informar al usuario del problema
+ Se debe leer el archivo 
+ Se debe poder acceder a una linea de texto
+ De esa linea se debe ser capaz de separar los nombres de los numeros
+ Se debe poder almacenar la informacion extraida en el stack

### Acceder archivo de configuracion config.ini
+ Se debe poder validar que el archivo exista 
+ Se debe abrir el archivo
+ Se debe poder leer linea a linea el archivo
+ Se debe distinguir los parametros 
+ Se debe almacenar como variables globales tal que puedan ser accesados por el gestor de interfaz

