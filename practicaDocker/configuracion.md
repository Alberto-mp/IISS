# /IISS
Directorio donde se encuentran dos carpetas con cada una de las partes del entregable, parte1/ y parte2/
## /IISS/parte1
Nos encontramos un archivo docker-compose.yml, en este archivo se definen dos servicios: drupal y mysql, ambos utilizados para ejecutar una aplicación web Drupal junto con una base de datos MySQL. 
El servicio drupal utiliza la imagen drupal:latest y expone el puerto 81 en el host, mapeado al puerto 80 del contenedor de Drupal. Además, monta un volumen llamado drupal_data en /var/www/html dentro del contenedor, lo que permite persistir los datos de Drupal incluso si el contenedor se detiene o elimina. El servicio drupal depende del servicio mysql, lo que significa que Docker Compose asegurará que el servicio de MySQL se inicie antes de iniciar el servicio de Drupal. Además, se establecen varias variables de entorno para configurar la base de datos MySQL utilizada por Drupal.
El servicio mysql utiliza la imagen mysql:5.7 y monta un volumen llamado mysql_data en /var/lib/mysql, permitiendo así persistir los datos de la base de datos MySQL. Se establecen variables de entorno para configurar la contraseña de root y crear una base de datos, así como un usuario y contraseña para Drupal.
Finalmente, se definen dos volúmenes para persistir los datos de Drupal y MySQL.
## /IISS/parte2
Nos encontramos un archivo docker-compose.yml, en este se definen dos servicios: wordpress y mariadb, que se utilizan para ejecutar un sitio web de WordPress junto con una base de datos MariaDB.
El servicio wordpress utiliza la imagen wordpress:latest y expone el puerto 82 en el host, mapeado al puerto 80 del contenedor de WordPress. Esto permite acceder al sitio web de WordPress a través del puerto 82 en el navegador web del host. El servicio wordpress también se une a una red personalizada llamada redDocker, lo que facilita la comunicación entre los servicios.
El servicio mariadb utiliza la imagen mariadb:latest y también se une a la red personalizada redDocker. Esto permite que WordPress se comunique con la base de datos MariaDB a través de esta red. La dependencia depends_on garantiza que el servicio de MariaDB se inicie antes de iniciar el servicio de WordPress.
Se define una red personalizada llamada redDocker con el controlador de puente (bridge), lo que proporciona a los servicios un entorno de red aislado donde pueden comunicarse entre sí.
