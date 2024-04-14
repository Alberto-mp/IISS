## PASO 1: Imagen de Jenkins personalizada
Se crea un Dockerfile para construir una versión modificada de la imagen más reciente de Jenkins.

## PASO 2: Creación de dos contenedores con Terraform
Con ayuda de Terraform, delegamos la creación de dos contenedores: uno que utilice la imagen modificada de Jenkins y otro que utilice la versión más reciente de Docker in Docker (DinD).

## PASO 3: Acceso a Jenkins
Accedemos a Jenkins mediante http://localhost:8080/. Si es la primera vez que accedemos, se nos pedirá una contraseña que se encuentra en una ruta específica dentro del contenedor de Jenkins. Para obtener esta contraseña, ejecutaremos `docker exec -it jenkins` y la obtendremos de la ruta especificada.

## PASO 4: Repositorio GitHub
Forkeamos el repositorio https://github.com/jenkins-docs/simple-python-pyinstaller-app.git en nuestro repositorio. Localmente, añadimos un Jenkinsfile que contendrá las etapas del pipeline. Después de esto, hacemos `git push`.

## PASO 5: Creación del pipeline y ejecución
En Jenkins, vamos al panel de control y seleccionamos "Nueva Tarea". Luego elegimos "Pipeline" y confirmamos con OK. En la configuración, seleccionamos "Pipeline script from SCM" en el campo de definición, luego elegimos "Git" en SCM, introducimos la URL de nuestro repositorio en GitHub y guardamos la configuración. Para ejecutar el pipeline, hacemos clic en el botón "Build".